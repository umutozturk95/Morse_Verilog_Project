`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:22:09 01/03/2016 
// Design Name: 
// Module Name:    morse_decoder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module morse_decoder(clk,in,state,letter,counter
    );
	 
input clk;
input [1:0] in ;
output [7:0] letter;
output [ 5:0 ] state ;//= 6 'b000000 ;
output [11:0]counter;
reg [5:0]state= 6 'b0 ;
reg[11:0]counter=12'b0;
reg[7:0] letter;



parameter [1:0] DOT = 2'b01 ;
parameter [1:0] DASH = 2'b11 ;
parameter [1:0] GAP = 2'b00 ;
parameter [1:0]  TWOGAP= 2'b10;
//this parameter values are constant variables.
parameter [ 5 : 0 ] BLANK = 6 'b111111 ;
parameter [ 5 : 0 ] A = 6 'b011010 ;
parameter [ 5 : 0 ] B = 6 'b000001 ;
parameter [ 5 : 0 ] C = 6 'b000010 ;
parameter [ 5 : 0 ] D = 6 'b000011 ;
parameter [ 5 : 0 ] E = 6 'b000100 ;
parameter [ 5 : 0 ] F = 6 'b000101 ;
parameter [ 5 : 0 ] G = 6 'b000110 ;
parameter [ 5 : 0 ] H = 6 'b000111 ;
parameter [ 5 : 0 ] I = 6 'b001000 ;
parameter [ 5 : 0 ] J = 6 'b001001 ;
parameter [ 5 : 0 ] K = 6 'b001010 ;
parameter [ 5 : 0 ] L = 6 'b001011 ;
parameter [ 5 : 0 ] M = 6 'b001100 ;
parameter [ 5 : 0 ] N = 6 'b001101 ;
parameter [ 5 : 0 ] O = 6 'b001110 ;
parameter [ 5 : 0 ] P = 6 'b001111 ;
parameter [ 5 : 0 ] Q = 6 'b010000 ;
parameter [ 5 : 0 ] R = 6 'b010001 ;
parameter [ 5 : 0 ] S = 6 'b010010 ;
parameter [ 5 : 0 ] T = 6 'b010011 ;
parameter [ 5 : 0 ] U = 6 'b010100 ;
parameter [ 5 : 0 ] V = 6 'b010101 ;
parameter [ 5 : 0 ] W = 6 'b010110 ;
parameter [ 5 : 0 ] X = 6 'b010111 ;
parameter [ 5 : 0 ] Y = 6 'b011000 ;
parameter [ 5 : 0 ] Z = 6 'b011001 ;
parameter [ 5 : 0 ] ONE = 6 'b011010 ;
parameter [ 5 : 0 ] TWO = 6 'b011011 ;
parameter [ 5 : 0 ] THREE = 6 'b011100 ;
parameter [ 5 : 0 ] FOUR = 6 'b011101 ;
parameter [ 5 : 0 ] FIVE = 6 'b011110 ;
parameter [ 5 : 0 ] SIX = 6 'b011111 ;
parameter [ 5 : 0 ] SEVEN = 6 'b100000 ;
parameter [ 5 : 0 ] EIGHT = 6 'b100001 ;
parameter [ 5 : 0 ] NINE = 6 'b100010 ;
parameter [ 5 : 0 ] ZERO = 6 'b100011 ;
parameter [ 5 : 0 ] BEFORETWO = 6 'b100100 ;
parameter [ 5 : 0 ] BEFOREEIGHT = 6 'b100101 ;
parameter [ 5 : 0 ] BEFORENINE = 6 'b100110 ;
 
 always @(posedge clk)
  begin
	if(in==TWOGAP)begin
	counter <=12'b0;
	state<=6'b111111;
	//in=2'b0;
	//q<=8'b0;
	end else if(in==GAP)begin
	state <=6'b111111;
	counter <=counter+1;
	//q<=8'b0;
	//in=2'b0;
	end else begin
	counter <=counter+1;	
	end
  end
  //this fragment is used to convert  input that comes from test bench file  to character ot number.
always @(posedge clk)
 if(in==2'b00)
	begin
	end 
 else if(in==2'b10)	
	begin
	 letter=8'h20;
	end
 else begin 
  case ( state )
  BLANK: case ( in )
     DOT: state = E;
     DASH: state = T;
     default : begin 
      state = BLANK;
     end
    endcase

   E: case ( in )
    DOT: state = I ;
    DASH: state = A;
    default : begin     
     state =E;
     end
    endcase
   T: case ( in )
    DOT:  state = N;
    DASH:  state = M;
    default : begin 
    state = T;
    end
   endcase

   I : case ( in )
    DOT:  state = S ;
    DASH:  state = U;
    default : begin 
     
     state = I;
     end
    endcase
   A: case ( in )
    DOT: state = R;
    DASH: state = W;
    default : begin 
     
     state = A;
     end
    endcase

     N: case ( in )
     DOT: state = D;
     DASH: state = K;
     default : begin 
      
      state = N;
     end
    endcase
   M: case ( in )
    DOT: state = G;
    DASH: state = O;
    default : begin   
     state =M;
    end
   endcase

    S : case ( in )
     DOT: state = H;
     DASH: state = V;
     default : begin
     
      state =S;
     end
    endcase
    R: case ( in )
    DOT:state = L;
    default: begin
      
      state = R;
    end
    endcase

   U: case ( in )
    DOT: state = P;
    DASH: state = BEFORETWO;
    default : begin 
    state = U;
   end
   endcase

   W: case ( in )
   DOT: state = P;
   DASH: state = J ;
   default  : begin 
    state = W;
   end
  endcase

  D: case ( in )
   DOT: state = B;
   DASH: state= X;
   default  : begin    
    state = D;
   end
   endcase


  K: case ( in )
  DOT: state = C;
  DASH: state = Y;
  default: begin  
   state =K;
   end
  endcase
  
  G: case ( in )
   DOT: state = Z ;
   DASH: state = Q;
   default : begin 
    state = G;
   end
  endcase

  J : case ( in )
  DASH: state = ONE;
  default : begin 
   state= J;
   end
  endcase
  V: case ( in )
  DASH: state = THREE;
  default : begin
  state= V;
  end
 endcase

   H: case ( in )
   DOT: state = FIVE;
   DASH: state = FOUR;
   default : begin 
    state= H;
    end
   endcase
  B: case ( in )
  DOT:state= SIX ;
  default : begin 
   state= B;
   end
  endcase
  Z : case ( in )
   DOT: state = SEVEN;
   default : begin
    state= Z;
   end
  endcase
  O: case ( in )
   DOT: state = BEFOREEIGHT;
   DASH: state = BEFORENINE;
   default : begin 
    state= 0;
   end
  endcase

  C: case ( in )
   default : begin 
   state = C;
   end
  endcase
  
  BEFORETWO: case ( in )
   DASH: state = TWO;
   default : state =  state ;
  endcase
 
  BEFOREEIGHT: case ( in )
   DASH: state = EIGHT;
   default : state = state ;
  endcase
  
  BEFORENINE: case ( in )
   DOT: state = NINE;
   DASH: state = ZERO;
   default : state = state ;
  endcase
  
   TWO: case ( in )
     GAP: begin
       state = TWO;
       end
     default :state = state ;
   endcase
	
  default : begin
      state = BLANK;
      
     end
  
  endcase
 end
 
always @(posedge clk)
 if(in==GAP || in==TWOGAP)
   begin
   case ( state )
  
    BLANK :letter = 8 'h20 ;
    A :letter = 8 'h41 ;
    B :letter = 8 'h42 ;
    C :letter = 8 'h43 ;
    D :letter = 8 'h44 ;
    E :letter = 8 'h45 ;
    F :letter = 8 'h46 ;
    G :letter = 8 'h47 ;
    H :letter = 8 'h48 ;
    I :letter=  8 'h49 ;
    J :letter= 8 'h4A;
    K :letter =8 'h4B;
    L :letter = 8 'h4C;
    M :letter=8 'h4D;
    N :letter =8 'h4E ;
    O :letter=8 'h4F ;
    P :letter = 8 'h50 ;
    Q :letter = 8 'h51 ;
    R :letter = 8 'h52 ;
    S :letter=8 'h53 ;
    T :letter =8 'h54 ;
    U :letter=8 'h55 ;
    V :letter =8 'h56 ;
    W :letter= 8 'h57 ;
    X :letter = 8 'h58 ;
    Y :letter= 8 'h59 ;
    Z :letter = 8 'h5A;
    ONE :letter= 8 'h31 ;
    TWO :letter=8 'h32 ;
    THREE :letter = 8'h33;
    FOUR :letter = 8 'h34 ;
    FIVE :letter= 8 'h35 ;
    SIX :letter=8 'h36 ;
    SEVEN :letter = 8 'h37 ;
    EIGHT :letter = 8 'h38 ;
    NINE : letter = 8 'h39 ;
    ZERO :letter = 8 'h30 ;
   default : letter = 8 'h20;
  endcase
 end
endmodule


