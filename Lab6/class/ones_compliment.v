module full_adder (
    input A, B, Cin,
    output Y, Cout
);

    wire Sum;
    assign Sum = A ^ B;
    assign Y = Sum ^ Cin;
    assign Cout = (Sum & Cin) | (A & B);
    
endmodule

module ones_comp_add (
    input [3:0] A,
    input [3:0] B,
    output [3:0] ones_comp_add_result
);
    
    wire [3:0] APlusBOnesComp;
    wire [2:0] carry;
    wire around;
    wire [2:0] second_carry;
    
    full_adder lsb_inter (
        .A(A[0]),
        .B(B[0]),
        .Y(APlusBOnesComp[0]),
        .Cin(1'b0),
        .Cout(carry[0])
    );
    
    full_adder secondBit_inter (
        .A(A[1]),
        .B(B[1]),
        .Y(APlusBOnesComp[1]),
        .Cin(carry[0]),
        .Cout(carry[1])
    );
    
    full_adder thirdBit_inter (
        .A(A[2]),
        .B(B[2]),
        .Y(APlusBOnesComp[2]),
        .Cin(carry[1]),
        .Cout(carry[2])
    );
    
    full_adder msb_inter (
        .A(A[3]),
        .B(B[3]),
        .Y(APlusBOnesComp[3]),
        .Cin(carry[2]),
        .Cout(around)
    );
    
    //Around addition
    full_adder lsb (
        .A(APlusBOnesComp[0]),
        .B(1'b0),
        .Y(ones_comp_add_result[0]),
        .Cin(around),
        .Cout(second_carry[0])        
    );
    
    full_adder secondBit (
        .A(APlusBOnesComp[1]),
        .B(1'b0),
        .Y(ones_comp_add_result[1]),
        .Cin(second_carry[0]),
        .Cout(second_carry[1])        
    );
    
    full_adder thirdBit (
        .A(APlusBOnesComp[2]),
        .B(1'b0),
        .Y(ones_comp_add_result[2]),
        .Cin(second_carry[1]),
        .Cout(second_carry[2])        
    );
    
    full_adder msb (
        .A(APlusBOnesComp[3]),
        .B(1'b0),
        .Y(ones_comp_add_result[3]),
        .Cin(second_carry[2])
    );

endmodule