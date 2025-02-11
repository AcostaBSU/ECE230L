// Implement module called full_adder
module full_adder (
    input [1:0] A,
    input [1:0] B,
    output [1:0] sum,
    output carry
);

    wire cout;
    adder oneBitAdder (
        .A(A[0]),
        .B(B[0]),
        .Y(sum[0]),
        .carry(cout)
    );
    
    wire cin;
    assign cin = cout;
    
    assign sum[1] = (~A[1] & B[1] & ~cin) | (A[1] & ~B[1] & ~cin) | (~A[1] & ~B[1] & cin) | (A[1] & B[1] & cin);
    assign carry = (A[1] & B[1]) | (B[1] & cin) | (A[1] & cin);
    
endmodule