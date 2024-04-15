module beh_counter(clr,clk,q);
  parameter n = 4;
  input clr;
  input clk;
  output reg [n-1:0] q;
  
  always @(posedge clk, negedge clr)
    begin
      if(~clr)begin
        q <= 0;
      end else begin
        q[0] <= ~q[n-1];
        for (int i = 1; i < n; i = i + 1) begin
          q[i] <= q[i-1];
      	end
      end
    end
  
endmodule
      
module d_flip_flop (
  input clr,
  input clk,
  input d,
  output reg q  
);

  always @(posedge clk, negedge clr) begin
  if (~clr) begin
        q <= 0; 
    end else begin
        q <= d;
    end
  end

endmodule

module str_counter (clr,clk,q);
  parameter n = 4;
  input clr;
  input clk;
  output reg [n-1:0] q;

  
  d_flip_flop dff0 (.q(q[0]), .d(~q[n-1]), .clk(clk), .clr(clr)); 
  d_flip_flop dff1 (.q(q[1]), .d(q[0]), .clk(clk), .clr(clr)); 
  
  generate// how to implement clr?? in structural
    for (genvar i = 2; i < n; i = i + 1)
      d_flip_flop dffi (.q(q[i]), .d(q[i-1]), .clk(clk) , .clr(clr));
  endgenerate // after implemeting, it doesnt seem to have an effect
  //might be a visible effect if its hardware implemented?

endmodule



