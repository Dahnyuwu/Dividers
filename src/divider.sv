module divider #(
    parameter WIDTH = 64
)(
    // Inputs
        input logic [WIDTH-1:0] srca,
        input logic [WIDTH-1:0] srcb,
        input logic is_signed,
    // Outputs
        output logic [WIDTH-1:0] result,
        output logic [WIDTH-1:0] rem,
        output logic div_zero_f
);
    // Variables
        logic [WIDTH-1:0] dividendo_;
        logic [WIDTH-1:0] divisor_;
        
        logic sign_c_;
        logic sign_r_;
    
    // Assigns
        assign div_zero_f = (srcb == '0);
        assign sign_c_ = is_signed && (srca[WIDTH-1] ^ srcb[WIDTH-1]);
        assign sign_r_ = is_signed && srca[WIDTH-1];
        assign dividendo_ = (is_signed && srca[WIDTH-1]) ? (~srca + 1'b1) : srca;
        assign divisor_ = (is_signed && srcb[WIDTH-1]) ? (~srcb + 1'b1) : srcb;
    
    always_comb begin
        logic [WIDTH-1:0] cociente_;
        logic [WIDTH-1:0] residuo_;
        logic [WIDTH-1:0] Q;
        logic [WIDTH:0] A;
        logic [WIDTH:0] M;
        
        result = '0;
        rem = '0;
        cociente_ = '0;
        residuo_ = '0;
        
        Q = '0;
        A = '0;
        M = '0;
        
        if (div_zero_f) begin
            result = '1;
            rem = srca;

        end

        else if (dividendo_ < divisor_) begin
            cociente_ = '0;
            residuo_ = dividendo_;
            
            if (sign_c_)
                cociente_ = ~cociente_ + 1'b1;
            
            if (sign_r_)
                residuo_ = ~residuo_ + 1'b1;
            
            result = cociente_;
            rem = residuo_;

        end

        else begin
            // Inicializar
            A = '0;
            Q = dividendo_;
            M = {1'b0, divisor_};
            
            for (int i = 0; i < WIDTH; i = i + 1) begin
                // Shift 
                {A, Q} = {A[WIDTH-1:0], Q, 1'b0};
                
                // A-M
                A = A - M;
                
                if (A[WIDTH] == 1'b1) begin
                    A = A + M;
                    Q[0] = 1'b0;

                end else begin
                    Q[0] = 1'b1;

                end
            end
            
            cociente_ = Q;
            residuo_ = A[WIDTH-1:0];
            
            if (sign_c_)
                cociente_ = ~cociente_ + 1'b1;
            
            if (sign_r_)
                residuo_ = ~residuo_ + 1'b1;
            
            result = cociente_;
            rem = residuo_;
        end
    end
    
endmodule