module divider #(
    // Parameters
        parameter WIDTH = 64
    )(
    // Inputs
        input  logic [WIDTH-1:0] srca,
        input  logic [WIDTH-1:0] srcb,
        input  logic             is_signed,
    
    // Outputs
        output logic [WIDTH-1:0] result,
        output logic [WIDTH-1:0] rem,
        output logic             div_zero_f
);
    
endmodule


// Modulo CLZ asistido por IA
module CLZ #(
    // Parameters
        parameter WIDTH = 64,
        parameter LOG   = $clog2(WIDTH)
    )(
    // Inputs
        input  logic [WIDTH-1:0] in,
        
    // Outputs
        output logic [LOG:0] out   // +1 para representar WIDTH
    );

    generate
        if (WIDTH == 1) begin : base_case
            assign out = (in == 1'b0) ? 1 : 0;
        end

        else begin : recursive_case
            localparam HALF = WIDTH / 2;

            logic [LOG-1:0] clz_high;
            logic [LOG-1:0] clz_low;

            logic high_zero;

            assign high_zero = (in[WIDTH-1:HALF] == 0);

            CLZ #(.WIDTH(HALF)) clz_hi (
                .in(in[WIDTH-1:HALF]),
                .out(clz_high)
            );

            CLZ #(.WIDTH(HALF)) clz_lo (
                .in(in[HALF-1:0]),
                .out(clz_low)
            );

            always_comb begin
                if (high_zero)
                    out = HALF + clz_low;
                else
                    out = clz_high;
            end
        end
    endgenerate
endmodule