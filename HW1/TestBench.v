
module counter_tb;
  
  reg clk, clr;
  wire [3:0] Q_behavioral, Q_structural; // Assuming n = 4

  beh_counter #(4) bc (clr, clk, Q_behavioral);
  str_counter #(4) sc (clr, clk, Q_structural);

  initial begin 
    clk = 1'b0;
    clr = 1'b0; 
    #100; 

    clr = 1'b1;
    repeat(40) begin //2000ms
      #50; 
      clk = ~clk;
    end
  end

  always @(posedge clk) begin 
    $display("Time: %d, Behavioral: %b, Structural: %b", $time, Q_behavioral, Q_structural);
    end

endmodule
