`timescale 1ns/1ns

module tb_clz;

  // ================================
  // Parámetros
  // ================================
  parameter int WIDTH = 8;
  localparam int LOG  = $clog2(WIDTH) + 1;

  // ================================
  // Señales
  // ================================
  logic [WIDTH-1:0] in;
  logic [LOG-1:0]   out;

  int num_pass;
  int num_errors;

  // ================================
  // Instancia del DUT
  // ================================
  CLZ #(.WIDTH(WIDTH)) dut (
    .in(in),
    .out(out)
  );

  // ================================
  // Modelo de referencia (golden)
  // ================================
  function automatic int clz_ref(input logic [WIDTH-1:0] value);
    int count;
    begin
      count = 0;
      for (int i = WIDTH-1; i >= 0; i--) begin
        if (value[i] == 1'b0)
          count++;
        else
          break;
      end
      return count;
    end
  endfunction

  // ================================
  // Test principal
  // ================================
  initial begin
    int expected;
    bit pass;

    num_pass   = 0;
    num_errors = 0;

    $display("=====================================");
    $display("   INICIO TEST CLZ (WIDTH = %0d)", WIDTH);
    $display("=====================================");

    // ----------------------------
    // Casos dirigidos (edge cases)
    // ----------------------------
    in = 0;
    #1;
    expected = clz_ref(in);
    $display("EDGE | in=0x%0h | expected=%0d | got=%0d", in, expected, out);

    in = 1;
    #1;
    expected = clz_ref(in);
    $display("EDGE | in=0x%0h | expected=%0d | got=%0d", in, expected, out);

    in = 1 << (WIDTH-1);
    #1;
    expected = clz_ref(in);
    $display("EDGE | in=0x%0h | expected=%0d | got=%0d", in, expected, out);

    in = {WIDTH{1'b1}};
    #1;
    expected = clz_ref(in);
    $display("EDGE | in=0x%0h | expected=%0d | got=%0d", in, expected, out);

    // ----------------------------
    // Pruebas random
    // ----------------------------
    for (int idx = 0; idx < 200; idx++) begin
      #1; // 🔴 asegura avance de tiempo

      // Random (válido para cualquier WIDTH)
      if (WIDTH <= 32)
        in = $urandom;
      else
        in = {$urandom, $urandom};

      #1; // esperar salida combinacional

      expected = clz_ref(in);

      pass = (expected == out);

      // 👇 imprime SIEMPRE
      $display("idx=%0d | in=0x%0h | expected=%0d | got=%0d",
               idx, in, expected, out);

      if (pass) begin
        num_pass++;
      end else begin
        $error("ERROR idx=%0d | in=0x%0h | expected=%0d | got=%0d",
               idx, in, expected, out);
        num_errors++;
      end
    end

    // ----------------------------
    // Resultados
    // ----------------------------
    $display("\n=====================================");
    $display("RESULTADOS:");
    $display("PASS   = %0d", num_pass);
    $display("ERRORS = %0d", num_errors);

    if (num_errors == 0)
      $display("✅ TEST PASS");
    else
      $display("❌ TEST FAILED");

    $display("=====================================");

    $finish;
  end

endmodule