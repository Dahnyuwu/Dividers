module divider #(
    parameter WIDTH = 8
)(
    input  logic [WIDTH-1:0] srca,
    input  logic [WIDTH-1:0] srcb,
    input  logic             is_signed,

    output logic [WIDTH-1:0] result,
    output logic [WIDTH-1:0] rem,
    output logic             div_zero_f
);

    // Variables
        logic [WIDTH-1:0] dividendo_;
        logic [WIDTH-1:0] divisor_;

        logic sign_c_;
        logic sign_r_;

        integer i;

    // Assigns
        assign div_zero_f = (srcb == '0);
        assign sign_c_ = is_signed && (srca[WIDTH-1] ^ srcb[WIDTH-1]);
        assign sign_r_ = is_signed && srca[WIDTH-1];

        assign dividendo_ = (is_signed && srca[WIDTH-1]) ? (~srca + 1'b1)
                                                         : srca;

        assign divisor_ = (is_signed && srcb[WIDTH-1]) ? (~srcb + 1'b1)
                                                       : srcb;

    always_comb begin

        logic [WIDTH-1:0]       cociente_;
        logic [WIDTH-1:0]       cociente_tmp_;
        logic [WIDTH-1:0]       residuo_;
        logic [WIDTH-1:0]       divisor_tmp_;
        logic signed [WIDTH:0]  acumulador_;

        result        = '0;
        rem           = '0;

        cociente_     = '0;
        cociente_tmp_ = '0;
        residuo_      = '0;
        divisor_tmp_  = '0;
        acumulador_   = '0;

        if (div_zero_f) begin
            result = '1;
            rem    = srca;

        end

        else begin

        // Inicialización
            cociente_tmp_ = dividendo_;
            divisor_tmp_  = divisor_;

        // Iteraciones
            for (i = 0; i < WIDTH; i++) begin
                acumulador_     = {acumulador_[WIDTH-1:0], cociente_tmp_[WIDTH-1]};
                cociente_tmp_   = {cociente_tmp_[WIDTH-2:0],1'b0};

                if (acumulador_ >= 0)
                    acumulador_ = acumulador_ - $signed({1'b0, divisor_tmp_});

                else
                    acumulador_  = acumulador_ + $signed({1'b0, divisor_tmp_});

                cociente_tmp_[0] = ~acumulador_[WIDTH];

            end

        // Corrección final del residuo
            if (acumulador_ < 0)
                acumulador_ =
                    acumulador_ +
                    $signed({1'b0, divisor_tmp_});

            cociente_ = cociente_tmp_;
            residuo_  = acumulador_[WIDTH-1:0];

        // Signo
            if (sign_c_)
                cociente_ = ~cociente_ + 1'b1;

            if (sign_r_)
                residuo_ = ~residuo_ + 1'b1;

            result = cociente_;
            rem    = residuo_;

        end

    end

endmodule