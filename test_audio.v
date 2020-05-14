`timescale 1 ns/10 ps



module test_audio();
reg  CLK100MHZ;

wire  AUD_PWM, 
      AUD_SD;


//`define MEMORY_IMAGE_FILE "blk_mem_gen_0.vhd"

reg [11:0]read_data[256:0];
wire [19:0] internal_addr;

//initial begin
top BT(CLK100MHZ,AUD_PWM,  AUD_SD);

//end


initial begin
  CLK100MHZ<=0;
  
  $readmemb("blk_mem_gen_0.vhd", read_data);
  $monitor(read_data);
  $display ("adress is = %x", top.addra);
end

always begin
    #5 CLK100MHZ=~CLK100MHZ;
end

assign internal_addr = top.addra;
endmodule