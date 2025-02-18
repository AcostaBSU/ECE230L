module full_adder (
    input A, B, Cin,
    output Y, Cout
);

    wire Sum;
    assign Sum = A ^ B;
    assign Y = Sum ^ Cin;
    assign Cout = (Sum & Cin) | (A & B);
    
endmodule

module twos_comp (
    input [7:0] A,
    output [7:0] twos_comp_result
);

    wire [7:0] ATwosComp;
    assign ATwosComp = ~A;
    
    wire [6:0] carry;
    
    //Around addition
    full_adder lsb (
        .A(ATwosComp[0]),
        .B(1'b1),
        .Y(twos_comp_result[0]),
        .Cin(1'b0),
        .Cout(carry[0])        
    );
    
    full_adder secondBit (
        .A(ATwosComp[1]),
        .B(1'b0),
        .Y(twos_comp_result[1]),
        .Cin(carry[0]),
        .Cout(carry[1])        
    );
    
    full_adder thirdBit (
        .A(ATwosComp[2]),
        .B(1'b0),
        .Y(twos_comp_result[2]),
        .Cin(carry[1]),
        .Cout(carry[2])        
    );
    
    full_adder fourthBit (
        .A(ATwosComp[3]),
        .B(1'b0),
        .Y(twos_comp_result[3]),
        .Cin(carry[2]),
        .Cout(carry[3])        
    );
    
    full_adder fifthBit (
        .A(ATwosComp[4]),
        .B(1'b0),
        .Y(twos_comp_result[4]),
        .Cin(carry[3]),
        .Cout(carry[4])        
    );
    
    full_adder sixthBit (
        .A(ATwosComp[5]),
        .B(1'b0),
        .Y(twos_comp_result[5]),
        .Cin(carry[4]),
        .Cout(carry[5])        
    );
    
    full_adder seventhBit (
        .A(ATwosComp[6]),
        .B(1'b0),
        .Y(twos_comp_result[6]),
        .Cin(carry[5]),
        .Cout(carry[6])        
    );
    
    full_adder msb (
        .A(ATwosComp[7]),
        .B(1'b0),
        .Y(twos_comp_result[7]),
        .Cin(carry[6])     
    );

endmodule