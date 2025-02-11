module light(
    input downstairs, upstairs,// Declare downstairs and upstairs input
    output stair_light// Declare stair light output
);

    // Enter logic equation here
    assign stair_light = downstairs ^ upstairs;

endmodule