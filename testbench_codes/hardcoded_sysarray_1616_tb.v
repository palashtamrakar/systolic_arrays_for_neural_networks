module tb_systolic_array;

	// Inputs
	reg [31:0] inp_west0, inp_west16, inp_west32, inp_west48, inp_west64, inp_west80, inp_west96, inp_west112,
	           inp_west128, inp_west144, inp_west160, inp_west176, inp_west192, inp_west208, inp_west224, inp_west240;
	reg [31:0] inp_north0, inp_north1, inp_north2, inp_north3, inp_north4, inp_north5, inp_north6, inp_north7,
	           inp_north8, inp_north9, inp_north10, inp_north11, inp_north12, inp_north13, inp_north14, inp_north15;
	reg clk, rst;

	// Outputs
	wire done;
	wire [63:0] result0, result1, result2, result3, result4, result5, result6, result7,
	            result8, result9, result10, result11, result12, result13, result14, result15,
	            result16, result17, result18, result19, result20, result21, result22, result23,
	            result24, result25, result26, result27, result28, result29, result30, result31,
	            result32, result33, result34, result35, result36, result37, result38, result39,
	            result40, result41, result42, result43, result44, result45, result46, result47,
	            result48, result49, result50, result51, result52, result53, result54, result55,
	            result56, result57, result58, result59, result60, result61, result62, result63,
	            result64, result65, result66, result67, result68, result69, result70, result71,
	            result72, result73, result74, result75, result76, result77, result78, result79,
	            result80, result81, result82, result83, result84, result85, result86, result87,
	            result88, result89, result90, result91, result92, result93, result94, result95,
	            result96, result97, result98, result99, result100, result101, result102, result103,
	            result104, result105, result106, result107, result108, result109, result110, result111,
	            result112, result113, result114, result115, result116, result117, result118, result119,
	            result120, result121, result122, result123, result124, result125, result126, result127,
	            result128, result129, result130, result131, result132, result133, result134, result135,
	            result136, result137, result138, result139, result140, result141, result142, result143,
	            result144, result145, result146, result147, result148, result149, result150, result151,
	            result152, result153, result154, result155, result156, result157, result158, result159,
	            result160, result161, result162, result163, result164, result165, result166, result167,
	            result168, result169, result170, result171, result172, result173, result174, result175,
	            result176, result177, result178, result179, result180, result181, result182, result183,
	            result184, result185, result186, result187, result188, result189, result190, result191,
	            result192, result193, result194, result195, result196, result197, result198, result199,
	            result200, result201, result202, result203, result204, result205, result206, result207,
	            result208, result209, result210, result211, result212, result213, result214, result215,
	            result216, result217, result218, result219, result220, result221, result222, result223,
	            result224, result225, result226, result227, result228, result229, result230, result231,
	            result232, result233, result234, result235, result236, result237, result238, result239,
	            result240, result241, result242, result243, result244, result245, result246, result247,
	            result248, result249, result250, result251, result252, result253, result254, result255;

	// Instantiate the systolic array
	systolic_array uut (
		.inp_west0(inp_west0), .inp_west16(inp_west16), .inp_west32(inp_west32), .inp_west48(inp_west48),
		.inp_west64(inp_west64), .inp_west80(inp_west80), .inp_west96(inp_west96), .inp_west112(inp_west112),
		.inp_west128(inp_west128), .inp_west144(inp_west144), .inp_west160(inp_west160), .inp_west176(inp_west176),
		.inp_west192(inp_west192), .inp_west208(inp_west208), .inp_west224(inp_west224), .inp_west240(inp_west240),
		.inp_north0(inp_north0), .inp_north1(inp_north1), .inp_north2(inp_north2), .inp_north3(inp_north3),
		.inp_north4(inp_north4), .inp_north5(inp_north5), .inp_north6(inp_north6), .inp_north7(inp_north7),
		.inp_north8(inp_north8), .inp_north9(inp_north9), .inp_north10(inp_north10), .inp_north11(inp_north11),
		.inp_north12(inp_north12), .inp_north13(inp_north13), .inp_north14(inp_north14), .inp_north15(inp_north15),
		.clk(clk), .rst(rst), .done(done),
		.result0(result0), .result1(result1), .result2(result2), .result3(result3),
		.result4(result4), .result5(result5), .result6(result6), .result7(result7),
		.result8(result8), .result9(result9), .result10(result10), .result11(result11),
		.result12(result12), .result13(result13), .result14(result14), .result15(result15),
		.result16(result16), .result17(result17), .result18(result18), .result19(result19),
		.result20(result20), .result21(result21), .result22(result22), .result23(result23),
		.result24(result24), .result25(result25), .result26(result26), .result27(result27),
		.result28(result28), .result29(result29), .result30(result30), .result31(result31),
		.result32(result32), .result33(result33), .result34(result34), .result35(result35),
		.result36(result36), .result37(result37), .result38(result38), .result39(result39),
		.result40(result40), .result41(result41), .result42(result42), .result43(result43),
		.result44(result44), .result45(result45), .result46(result46), .result47(result47),
		.result48(result48), .result49(result49), .result50(result50), .result51(result51),
		.result52(result52), .result53(result53), .result54(result54), .result55(result55),
		.result56(result56), .result57(result57), .result58(result58), .result59(result59),
		.result60(result60), .result61(result61), .result62(result62), .result63(result63),
		.result64(result64), .result65(result65), .result66(result66), .result67(result67),
		.result68(result68), .result69(result69), .result70(result70), .result71(result71),
		.result72(result72), .result73(result73), .result74(result74), .result75(result75),
		.result76(result76), .result77(result77), .result78(result78), .result79(result79),
		.result80(result80), .result81(result81), .result82(result82), .result83(result83),
		.result84(result84), .result85(result85), .result86(result86), .result87(result87),
		.result88(result88), .result89(result89), .result90(result90), .result91(result91),
		.result92(result92), .result93(result93), .result94(result94), .result95(result95),
		.result96(result96), .result97(result97), .result98(result98), .result99(result99),
		.result100(result100), .result101(result101), .result102(result102), .result103(result103),
		.result104(result104), .result105(result105), .result106(result106), .result107(result107),
		.result108(result108), .result109(result109), .result110(result110), .result111(result111),
		.result112(result112), .result113(result113), .result114(result114), .result115(result115),
		.result116(result116), .result117(result117), .result118(result118), .result119(result119),
		.result120(result120), .result121(result121), .result122(result122), .result123(result123),
		.result124(result124), .result125(result125), .result126(result126), .result127(result127),
		.result128(result128), .result129(result129), .result130(result130), .result131(result131),
		.result132(result132), .result133(result133), .result134(result134), .result135(result135),
		.result136(result136), .result137(result137), .result138(result138), .result139(result139),
		.result140(result140), .result141(result141), .result142(result142), .result143(result143),
		.result144(result144), .result145(result145), .result146(result146), .result147(result147),
		.result148(result148), .result149(result149), .result150(result150), .result151(result151),
		.result152(result152), .result153(result153), .result154(result154), .result155(result155),
		.result156(result156), .result157(result157), .result158(result158), .result159(result159),
		.result160(result160), .result161(result161), .result162(result162), .result163(result163),
		.result164(result164), .result165(result165), .result166(result166), .result167(result167),
		.result168(result168), .result169(result169), .result170(result170), .result171(result171),
		.result172(result172), .result173(result173), .result174(result174), .result175(result175),
		.result176(result176), .result177(result177), .result178(result178), .result179(result179),
		.result180(result180), .result181(result181), .result182(result182), .result183(result183),
		.result184(result184), .result185(result185), .result186(result186), .result187(result187),
		.result188(result188), .result189(result189), .result190(result190), .result191(result191),
		.result192(result192), .result193(result193), .result194(result194), .result195(result195),
		.result196(result196), .result197(result197), .result198(result198), .result199(result199),
		.result200(result200), .result201(result201), .result202(result202), .result203(result203),
		.result204(result204), .result205(result205), .result206(result206), .result207(result207),
		.result208(result208), .result209(result209), .result210(result210), .result211(result211),
		.result212(result212), .result213(result213), .result214(result214), .result215(result215),
		.result216(result216), .result217(result217), .result218(result218), .result219(result219),
		.result220(result220), .result221(result221), .result222(result222), .result223(result223),
		.result224(result224), .result225(result225), .result226(result226), .result227(result227),
		.result228(result228), .result229(result229), .result230(result230), .result231(result231),
		.result232(result232), .result233(result233), .result234(result234), .result235(result235),
		.result236(result236), .result237(result237), .result238(result238), .result239(result239),
		.result240(result240), .result241(result241), .result242(result242), .result243(result243),
		.result244(result244), .result245(result245), .result246(result246), .result247(result247),
		.result248(result248), .result249(result249), .result250(result250), .result251(result251),
		.result252(result252), .result253(result253), .result254(result254), .result255(result255)
	);

	// Clock generation: 10ns period
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end

	// Test stimulus
	integer i, j;
	reg [31:0] matrix_A [0:15][0:15];
	reg [31:0] matrix_B [0:15][0:15];
	reg [63:0] expected_C [0:15][0:15];

	// Array to hold result signals for easier access
	wire [63:0] results [0:255];
	assign results[0] = result0; assign results[1] = result1; assign results[2] = result2; assign results[3] = result3;
	assign results[4] = result4; assign results[5] = result5; assign results[6] = result6; assign results[7] = result7;
	assign results[8] = result8; assign results[9] = result9; assign results[10] = result10; assign results[11] = result11;
	assign results[12] = result12; assign results[13] = result13; assign results[14] = result14; assign results[15] = result15;
	assign results[16] = result16; assign results[17] = result17; assign results[18] = result18; assign results[19] = result19;
	assign results[20] = result20; assign results[21] = result21; assign results[22] = result22; assign results[23] = result23;
	assign results[24] = result24; assign results[25] = result25; assign results[26] = result26; assign results[27] = result27;
	assign results[28] = result28; assign results[29] = result29; assign results[30] = result30; assign results[31] = result31;
	assign results[32] = result32; assign results[33] = result33; assign results[34] = result34; assign results[35] = result35;
	assign results[36] = result36; assign results[37] = result37; assign results[38] = result38; assign results[39] = result39;
	assign results[40] = result40; assign results[41] = result41; assign results[42] = result42; assign results[43] = result43;
	assign results[44] = result44; assign results[45] = result45; assign results[46] = result46; assign results[47] = result47;
	assign results[48] = result48; assign results[49] = result49; assign results[50] = result50; assign results[51] = result51;
	assign results[52] = result52; assign results[53] = result53; assign results[54] = result54; assign results[55] = result55;
	assign results[56] = result56; assign results[57] = result57; assign results[58] = result58; assign results[59] = result59;
	assign results[60] = result60; assign results[61] = result61; assign results[62] = result62; assign results[63] = result63;
	assign results[64] = result64; assign results[65] = result65; assign results[66] = result66; assign results[67] = result67;
	assign results[68] = result68; assign results[69] = result69; assign results[70] = result70; assign results[71] = result71;
	assign results[72] = result72; assign results[73] = result73; assign results[74] = result74; assign results[75] = result75;
	assign results[76] = result76; assign results[77] = result77; assign results[78] = result78; assign results[79] = result79;
	assign results[80] = result80; assign results[81] = result81; assign results[82] = result82; assign results[83] = result83;
	assign results[84] = result84; assign results[85] = result85; assign results[86] = result86; assign results[87] = result87;
	assign results[88] = result88; assign results[89] = result89; assign results[90] = result90; assign results[91] = result91;
	assign results[92] = result92; assign results[93] = result93; assign results[94] = result94; assign results[95] = result95;
	assign results[96] = result96; assign results[97] = result97; assign results[98] = result98; assign results[99] = result99;
	assign results[100] = result100; assign results[101] = result101; assign results[102] = result102; assign results[103] = result103;
	assign results[104] = result104; assign results[105] = result105; assign results[106] = result106; assign results[107] = result107;
	assign results[108] = result108; assign results[109] = result109; assign results[110] = result110; assign results[111] = result111;
	assign results[112] = result112; assign results[113] = result113; assign results[114] = result114; assign results[115] = result115;
	assign results[116] = result116; assign results[117] = result117; assign results[118] = result118; assign results[119] = result119;
	assign results[120] = result120; assign results[121] = result121; assign results[122] = result122; assign results[123] = result123;
	assign results[124] = result124; assign results[125] = result125; assign results[126] = result126; assign results[127] = result127;
	assign results[128] = result128; assign results[129] = result129; assign results[130] = result130; assign results[131] = result131;
	assign results[132] = result132; assign results[133] = result133; assign results[134] = result134; assign results[135] = result135;
	assign results[136] = result136; assign results[137] = result137; assign results[138] = result138; assign results[139] = result139;
	assign results[140] = result140; assign results[141] = result141; assign results[142] = result142; assign results[143] = result143;
	assign results[144] = result144; assign results[145] = result145; assign results[146] = result146; assign results[147] = result147;
	assign results[148] = result148; assign results[149] = result149; assign results[150] = result150; assign results[151] = result151;
	assign results[152] = result152; assign results[153] = result153; assign results[154] = result154; assign results[155] = result155;
	assign results[156] = result156; assign results[157] = result157; assign results[158] = result158; assign results[159] = result159;
	assign results[160] = result160; assign results[161] = result161; assign results[162] = result162; assign results[163] = result163;
	assign results[164] = result164; assign results[165] = result165; assign results[166] = result166; assign results[167] = result167;
	assign results[168] = result168; assign results[169] = result169; assign results[170] = result170; assign results[171] = result171;
	assign results[172] = result172; assign results[173] = result173; assign results[174] = result174; assign results[175] = result175;
	assign results[176] = result176; assign results[177] = result177; assign results[178] = result178; assign results[179] = result179;
	assign results[180] = result180; assign results[181] = result181; assign results[182] = result182; assign results[183] = result183;
	assign results[184] = result184; assign results[185] = result185; assign results[186] = result186; assign results[187] = result187;
	assign results[188] = result188; assign results[189] = result189; assign results[190] = result190; assign results[191] = result191;
	assign results[192] = result192; assign results[193] = result193; assign results[194] = result194; assign results[195] = result195;
	assign results[196] = result196; assign results[197] = result197; assign results[198] = result198; assign results[199] = result199;
	assign results[200] = result200; assign results[201] = result201; assign results[202] = result202; assign results[203] = result203;
	assign results[204] = result204; assign results[205] = result205; assign results[206] = result206; assign results[207] = result207;
	assign results[208] = result208; assign results[209] = result209; assign results[210] = result210; assign results[211] = result211;
	assign results[212] = result212; assign results[213] = result213; assign results[214] = result214; assign results[215] = result215;
	assign results[216] = result216; assign results[217] = result217; assign results[218] = result218; assign results[219] = result219;
	assign results[220] = result220; assign results[221] = result221; assign results[222] = result222; assign results[223] = result223;
	assign results[224] = result224; assign results[225] = result225; assign results[226] = result226; assign results[227] = result227;
	assign results[228] = result228; assign results[229] = result229; assign results[230] = result230; assign results[231] = result231;
	assign results[232] = result232; assign results[233] = result233; assign results[234] = result234; assign results[235] = result235;
	assign results[236] = result236; assign results[237] = result237; assign results[238] = result238; assign results[239] = result239;
	assign results[240] = result240; assign results[241] = result241; assign results[242] = result242; assign results[243] = result243;
	assign results[244] = result244; assign results[245] = result245; assign results[246] = result246; assign results[247] = result247;
	assign results[248] = result248; assign results[249] = result249; assign results[250] = result250; assign results[251] = result251;
	assign results[252] = result252; assign results[253] = result253; assign results[254] = result254; assign results[255] = result255;

	initial begin
		// Initialize VCD for waveform viewing
		$dumpfile("dump.vcd");
		$dumpvars(0, tb_systolic_array);

		// Initialize inputs
		inp_west0 = 0; inp_west16 = 0; inp_west32 = 0; inp_west48 = 0;
		inp_west64 = 0; inp_west80 = 0; inp_west96 = 0; inp_west112 = 0;
		inp_west128 = 0; inp_west144 = 0; inp_west160 = 0; inp_west176 = 0;
		inp_west192 = 0; inp_west208 = 0; inp_west224 = 0; inp_west240 = 0;
		inp_north0 = 0; inp_north1 = 0; inp_north2 = 0; inp_north3 = 0;
		inp_north4 = 0; inp_north5 = 0; inp_north6 = 0; inp_north7 = 0;
		inp_north8 = 0; inp_north9 = 0; inp_north10 = 0; inp_north11 = 0;
		inp_north12 = 0; inp_north13 = 0; inp_north14 = 0; inp_north15 = 0;
		rst = 1;

		// Initialize matrices A and B
		for (i = 0; i < 16; i = i + 1) begin
			for (j = 0; j < 16; j = j + 1) begin
				matrix_A[i][j] = i + 1; // A[i,j] = i+1
				matrix_B[i][j] = j + 1; // B[i,j] = j+1
			end
		end

		// Reset pulse
		#10 rst = 0;

		// Feed matrix A rows and matrix B columns over 16 cycles
		for (i = 0; i < 16; i = i + 1) begin
			@(negedge clk);
			inp_north0 = matrix_A[i][0]; inp_north1 = matrix_A[i][1]; inp_north2 = matrix_A[i][2]; inp_north3 = matrix_A[i][3];
			inp_north4 = matrix_A[i][4]; inp_north5 = matrix_A[i][5]; inp_north6 = matrix_A[i][6]; inp_north7 = matrix_A[i][7];
			inp_north8 = matrix_A[i][8]; inp_north9 = matrix_A[i][9]; inp_north10 = matrix_A[i][10]; inp_north11 = matrix_A[i][11];
			inp_north12 = matrix_A[i][12]; inp_north13 = matrix_A[i][13]; inp_north14 = matrix_A[i][14]; inp_north15 = matrix_A[i][15];
			inp_west0 = matrix_B[0][i]; inp_west16 = matrix_B[1][i]; inp_west32 = matrix_B[2][i]; inp_west48 = matrix_B[3][i];
			inp_west64 = matrix_B[4][i]; inp_west80 = matrix_B[5][i]; inp_west96 = matrix_B[6][i]; inp_west112 = matrix_B[7][i];
			inp_west128 = matrix_B[8][i]; inp_west144 = matrix_B[9][i]; inp_west160 = matrix_B[10][i]; inp_west176 = matrix_B[11][i];
			inp_west192 = matrix_B[12][i]; inp_west208 = matrix_B[13][i]; inp_west224 = matrix_B[14][i]; inp_west240 = matrix_B[15][i];
		end

		// Clear inputs after feeding matrices
		@(negedge clk);
		inp_west0 = 0; inp_west16 = 0; inp_west32 = 0; inp_west48 = 0;
		inp_west64 = 0; inp_west80 = 0; inp_west96 = 0; inp_west112 = 0;
		inp_west128 = 0; inp_west144 = 0; inp_west160 = 0; inp_west176 = 0;
		inp_west192 = 0; inp_west208 = 0; inp_west224 = 0; inp_west240 = 0;
		inp_north0 = 0; inp_north1 = 0; inp_north2 = 0; inp_north3 = 0;
		inp_north4 = 0; inp_north5 = 0; inp_north6 = 0; inp_north7 = 0;
		inp_north8 = 0; inp_north9 = 0; inp_north10 = 0; inp_north11 = 0;
		inp_north12 = 0; inp_north13 = 0; inp_north14 = 0; inp_north15 = 0;

		// Wait for done signal and print results
		@(posedge done);
		$display("Done signal asserted at time %0t", $time);
		$display("Computed Result Matrix C:");
		for (i = 0; i < 16; i = i + 1) begin
			for (j = 0; j < 16; j = j + 1) begin
				$display("C[%0d,%0d] = %0d", i, j, results[i*16 + j]);
			end
		end
		$display("\nExpected Result Matrix C:");
		for (i = 0; i < 16; i = i + 1) begin
			for (j = 0; j < 16; j = j + 1) begin
				expected_C[i][j] = 16 * (i + 1) * (j + 1);
				$display("C[%0d,%0d] = %0d", i, j, expected_C[i][j]);
			end
		end

		// Run simulation for a few more cycles
		#100 $finish;
	end

endmodule

