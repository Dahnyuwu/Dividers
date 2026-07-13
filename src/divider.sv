module divider #(
    parameter WIDTH = 52
)(
    input  logic             clk,
    input  logic             rst,

    input  logic [WIDTH-1:0] srca,
    input  logic [WIDTH-1:0] srcb,
    input  logic             is_signed,

    output logic [WIDTH-1:0] result,
    output logic [WIDTH-1:0] rem,
    output logic             div_zero_f
);

    logic [WIDTH-1:0] srcaR;
    logic [WIDTH-1:0] srcbR;
    logic             is_signedR;

    logic [WIDTH-1:0] resultC;
    logic [WIDTH-1:0] remC;
    logic             div_zero_fC;

    Register #(.LENGTH(WIDTH)) srca_reg(.clk(clk), .rst(rst), .ena(1'b1), .in(srca), .out(srcaR));
    Register #(.LENGTH(WIDTH)) srcb_reg(.clk(clk), .rst(rst), .ena(1'b1), .in(srcb), .out(srcbR));
    Register #(.LENGTH(1)) is_signed_reg(.clk(clk), .rst(rst), .ena(1'b1), .in(is_signed), .out(is_signedR));

    Register #(.LENGTH(WIDTH)) result_reg(.clk(clk), .rst(rst), .ena(1'b1), .in(resultC), .out(result));
    Register #(.LENGTH(WIDTH)) rem_reg(.clk(clk), .rst(rst), .ena(1'b1), .in(remC), .out(rem));
    Register #(.LENGTH(1)) div_zero_reg(.clk(clk), .rst(rst), .ena(1'b1), .in(div_zero_fC), .out(div_zero_f));

    logic [WIDTH-1:0] dividendo_;
    logic [WIDTH-1:0] divisor_;

    logic sign_c_;
    logic sign_r_;

    assign div_zero_fC = (srcbR == '0);

    assign sign_c_ = is_signedR &&
                     (srcaR[WIDTH-1] ^ srcbR[WIDTH-1]);

    assign sign_r_ = is_signedR &&
                     srcaR[WIDTH-1];

    assign dividendo_ =
        (is_signedR && srcaR[WIDTH-1]) ?
        (~srcaR + 1'b1) :
        srcaR;

    assign divisor_ =
        (is_signedR && srcbR[WIDTH-1]) ?
        (~srcbR + 1'b1) :
        srcbR;

    always_comb begin

        logic [WIDTH-1:0] cociente_;
        logic [WIDTH-1:0] residuo_;
        logic [WIDTH-1:0] Q;

        logic [WIDTH:0] A;
        logic [WIDTH:0] M;

        resultC    = '0;
        remC       = '0;

        cociente_  = '0;
        residuo_   = '0;

        Q          = '0;
        A          = '0;
        M          = '0;

        if (div_zero_fC) begin

            resultC = '1;
            remC    = srcaR;

        end

        else if (dividendo_ < divisor_) begin

            cociente_ = '0;
            residuo_  = dividendo_;

            if (sign_c_)
                cociente_ = ~cociente_ + 1'b1;

            if (sign_r_)
                residuo_ = ~residuo_ + 1'b1;

            resultC = cociente_;
            remC    = residuo_;

        end

        else begin

            A = '0;
            Q = dividendo_;
            M = {1'b0, divisor_};

            for (int i = 0; i < WIDTH; i = i + 1) begin

                {A, Q} = {A[WIDTH-1:0], Q, 1'b0};

                A = A - M;

                if (A[WIDTH]) begin

                    A = A + M;
                    Q[0] = 1'b0;

                end

                else begin

                    Q[0] = 1'b1;

                end

            end

            cociente_ = Q;
            residuo_  = A[WIDTH-1:0];

            if (sign_c_)
                cociente_ = ~cociente_ + 1'b1;

            if (sign_r_)
                residuo_ = ~residuo_ + 1'b1;

            resultC = cociente_;
            remC    = residuo_;

        end

    end

endmodule