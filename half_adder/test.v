module top();
   reg CLK, RST;
   reg A;
   reg B;
   wire S;
   wire C;

   half_adder ha(A, B, S, C);

   initial begin
      CLK = 0;
      forever #10 CLK = ~CLK;
   end

   initial begin
      RST = 0;
      #30 RST = 1;
   end

   /* give A and B */
   initial begin
      A = 0;
      forever #20 A = ~A;
   end
   initial begin
      B = 0;
      forever #40 B = ~B;
   end

   initial begin
      #500 $finish();
   end

   always @(posedge CLK) begin
      $write("[%t] A=%b B=%b C=%b S=%b\n", $time, A, B, C, S);
   end
   
   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, ha);
   end

endmodule
