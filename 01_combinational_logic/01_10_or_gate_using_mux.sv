module mux
(
  input  d0, d1,
  input  sel,
  output y
);

  assign y = sel ? d1 : d0;

endmodule

//----------------------------------------------------------------------------

module or_gate_using_mux
(
    input  a,
    input  b,
    output o
);
  wire true = 1;
  wire false = 0;

  mux org(b, true, a, o);

endmodule

//----------------------------------------------------------------------------

module testbench;

  logic a, b, o;
  int i, j;

  or_gate_using_mux inst (a, b, o);

  initial
    begin
      for (i = 0; i <= 1; i++)
      for (j = 0; j <= 1; j++)
      begin
        a = i;
        b = j;

        # 1;

        $display ("TEST %b | %b = %b", a, b, o);

        if (o !== (a | b))
          begin
            $display ("%s FAIL: %h EXPECTED", `__FILE__, a | b);
            $finish;
          end
      end

      $display ("%s PASS", `__FILE__);
      $finish;
    end

endmodule
