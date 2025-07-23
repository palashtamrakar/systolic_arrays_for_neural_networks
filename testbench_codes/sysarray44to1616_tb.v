// test bench

/* 16x16 Matrix Multiplication using 4x4 Systolic Array */

module testbench;
  reg clk, rst;
  reg [31:0] inp_west0, inp_west1, inp_west2, inp_west3;
  reg [31:0] inp_north0, inp_north1, inp_north2, inp_north3;
  wire done;

  // Instantiate the systolic array
  systolic_array uut(
    .inp_west0(inp_west0), .inp_west4(inp_west1), .inp_west8(inp_west2), .inp_west12(inp_west3),
    .inp_north0(inp_north0), .inp_north1(inp_north1), .inp_north2(inp_north2), .inp_north3(inp_north3),
    .clk(clk), .rst(rst), .done(done)
  );

  // 16x16 matrix A and B with simple values for easy observation
  reg [31:0] A[0:15][0:15];
  reg [31:0] B[0:15][0:15];
  reg [63:0] C[0:15][0:15];

  integer i, j, m, n, u;

  initial begin
    // Clock and Reset
    clk = 0; rst = 1;
    #5 rst = 0;
  end

  always #5 clk = ~clk;

  // Fill matrices with known values for validation (A[i][j] = i+j, B[i][j] = i-j)
  initial begin
    for (i = 0; i < 16; i++) begin
      for (j = 0; j < 16; j++) begin
        A[i][j] = i + j;
        B[i][j] = (i >= j) ? i - j : 0;
        C[i][j] = 0;
      end
    end
  end

  task inject_tile;
    input integer row, col;
    begin
      // Reset systolic array to flush old data
      rst = 1; @(posedge clk);
      rst = 0;

      // Inject values diagonally into 4x4 array
      for (u = 0; u < 2 * 4 - 1 + 4; u = u + 1) begin
        inp_west0 = (u < 4) ? A[row + u][col + 0] : 0;
        inp_west1 = (u >= 1 && u < 5) ? A[row + u - 1][col + 1] : 0;
        inp_west2 = (u >= 2 && u < 6) ? A[row + u - 2][col + 2] : 0;
        inp_west3 = (u >= 3 && u < 7) ? A[row + u - 3][col + 3] : 0;

        inp_north0 = (u < 4) ? B[row + 0][col + u] : 0;
        inp_north1 = (u >= 1 && u < 5) ? B[row + 1][col + u - 1] : 0;
        inp_north2 = (u >= 2 && u < 6) ? B[row + 2][col + u - 2] : 0;
        inp_north3 = (u >= 3 && u < 7) ? B[row + 3][col + u - 3] : 0;

        @(posedge clk);
      end

      // Wait until systolic array finishes computation
      wait(done);
      @(posedge clk);

      // Store results from each PE
      C[row + 0][col + 0] = uut.result0;
      C[row + 0][col + 1] = uut.result1;
      C[row + 0][col + 2] = uut.result2;
      C[row + 0][col + 3] = uut.result3;

      C[row + 1][col + 0] = uut.result4;
      C[row + 1][col + 1] = uut.result5;
      C[row + 1][col + 2] = uut.result6;
      C[row + 1][col + 3] = uut.result7;

      C[row + 2][col + 0] = uut.result8;
      C[row + 2][col + 1] = uut.result9;
      C[row + 2][col + 2] = uut.result10;
      C[row + 2][col + 3] = uut.result11;

      C[row + 3][col + 0] = uut.result12;
      C[row + 3][col + 1] = uut.result13;
      C[row + 3][col + 2] = uut.result14;
      C[row + 3][col + 3] = uut.result15;
    end
  endtask

  initial begin
    @(negedge rst);
    // Inject all 4x4 tiles across 16x16 matrix (4 tiles per row/col)
    for (m = 0; m < 16; m += 4) begin
      for (n = 0; n < 16; n += 4) begin
        inject_tile(m, n);
      end
    end

    // Print result matrix C
    $display("\nMatrix C = A x B\n");
    for (i = 0; i < 16; i++) begin
      for (j = 0; j < 16; j++) begin
        $write("%0d ", C[i][j]);
      end
      $write("\n");
    end
    $finish;
  end

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, testbench);
  end
endmodule
