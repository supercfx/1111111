module mod_square (
    input [256:0] din,
    output [256:0] res
);
assign res[0] = din[0]^din[251];
assign res[1] = din[129];
assign res[2] = din[1]^din[252];
assign res[3] = din[130];
assign res[4] = din[2]^din[253];
assign res[5] = din[131];
assign res[6] = din[3]^din[254];
assign res[7] = din[132];
assign res[8] = din[4]^din[255];
assign res[9] = din[133];
assign res[10] = din[5]^din[256];
assign res[11] = din[134];
assign res[12] = din[6]^din[251];
assign res[13] = din[129]^din[135];
assign res[14] = din[7]^din[252];
assign res[15] = din[130]^din[136];
assign res[16] = din[8]^din[253];
assign res[17] = din[131]^din[137];
assign res[18] = din[9]^din[254];
assign res[19] = din[132]^din[138];
assign res[20] = din[10]^din[255];
assign res[21] = din[133]^din[139];
assign res[22] = din[11]^din[256];
assign res[23] = din[134]^din[140];
assign res[24] = din[12];
assign res[25] = din[135]^din[141];
assign res[26] = din[13];
assign res[27] = din[136]^din[142];
assign res[28] = din[14];
assign res[29] = din[137]^din[143];
assign res[30] = din[15];
assign res[31] = din[138]^din[144];
assign res[32] = din[16];
assign res[33] = din[139]^din[145];
assign res[34] = din[17];
assign res[35] = din[140]^din[146];
assign res[36] = din[18];
assign res[37] = din[141]^din[147];
assign res[38] = din[19];
assign res[39] = din[142]^din[148];
assign res[40] = din[20];
assign res[41] = din[143]^din[149];
assign res[42] = din[21];
assign res[43] = din[144]^din[150];
assign res[44] = din[22];
assign res[45] = din[145]^din[151];
assign res[46] = din[23];
assign res[47] = din[146]^din[152];
assign res[48] = din[24];
assign res[49] = din[147]^din[153];
assign res[50] = din[25];
assign res[51] = din[148]^din[154];
assign res[52] = din[26];
assign res[53] = din[149]^din[155];
assign res[54] = din[27];
assign res[55] = din[150]^din[156];
assign res[56] = din[28];
assign res[57] = din[151]^din[157];
assign res[58] = din[29];
assign res[59] = din[152]^din[158];
assign res[60] = din[30];
assign res[61] = din[153]^din[159];
assign res[62] = din[31];
assign res[63] = din[154]^din[160];
assign res[64] = din[32];
assign res[65] = din[155]^din[161];
assign res[66] = din[33];
assign res[67] = din[156]^din[162];
assign res[68] = din[34];
assign res[69] = din[157]^din[163];
assign res[70] = din[35];
assign res[71] = din[158]^din[164];
assign res[72] = din[36];
assign res[73] = din[159]^din[165];
assign res[74] = din[37];
assign res[75] = din[160]^din[166];
assign res[76] = din[38];
assign res[77] = din[161]^din[167];
assign res[78] = din[39];
assign res[79] = din[162]^din[168];
assign res[80] = din[40];
assign res[81] = din[163]^din[169];
assign res[82] = din[41];
assign res[83] = din[164]^din[170];
assign res[84] = din[42];
assign res[85] = din[165]^din[171];
assign res[86] = din[43];
assign res[87] = din[166]^din[172];
assign res[88] = din[44];
assign res[89] = din[167]^din[173];
assign res[90] = din[45];
assign res[91] = din[168]^din[174];
assign res[92] = din[46];
assign res[93] = din[169]^din[175];
assign res[94] = din[47];
assign res[95] = din[170]^din[176];
assign res[96] = din[48];
assign res[97] = din[171]^din[177];
assign res[98] = din[49];
assign res[99] = din[172]^din[178];
assign res[100] = din[50];
assign res[101] = din[173]^din[179];
assign res[102] = din[51];
assign res[103] = din[174]^din[180];
assign res[104] = din[52];
assign res[105] = din[175]^din[181];
assign res[106] = din[53];
assign res[107] = din[176]^din[182];
assign res[108] = din[54];
assign res[109] = din[177]^din[183];
assign res[110] = din[55];
assign res[111] = din[178]^din[184];
assign res[112] = din[56];
assign res[113] = din[179]^din[185];
assign res[114] = din[57];
assign res[115] = din[180]^din[186];
assign res[116] = din[58];
assign res[117] = din[181]^din[187];
assign res[118] = din[59];
assign res[119] = din[182]^din[188];
assign res[120] = din[60];
assign res[121] = din[183]^din[189];
assign res[122] = din[61];
assign res[123] = din[184]^din[190];
assign res[124] = din[62];
assign res[125] = din[185]^din[191];
assign res[126] = din[63];
assign res[127] = din[186]^din[192];
assign res[128] = din[64];
assign res[129] = din[187]^din[193];
assign res[130] = din[65];
assign res[131] = din[188]^din[194];
assign res[132] = din[66];
assign res[133] = din[189]^din[195];
assign res[134] = din[67];
assign res[135] = din[190]^din[196];
assign res[136] = din[68];
assign res[137] = din[191]^din[197];
assign res[138] = din[69];
assign res[139] = din[192]^din[198];
assign res[140] = din[70];
assign res[141] = din[193]^din[199];
assign res[142] = din[71];
assign res[143] = din[194]^din[200];
assign res[144] = din[72];
assign res[145] = din[195]^din[201];
assign res[146] = din[73];
assign res[147] = din[196]^din[202];
assign res[148] = din[74];
assign res[149] = din[197]^din[203];
assign res[150] = din[75];
assign res[151] = din[198]^din[204];
assign res[152] = din[76];
assign res[153] = din[199]^din[205];
assign res[154] = din[77];
assign res[155] = din[200]^din[206];
assign res[156] = din[78];
assign res[157] = din[201]^din[207];
assign res[158] = din[79];
assign res[159] = din[202]^din[208];
assign res[160] = din[80];
assign res[161] = din[203]^din[209];
assign res[162] = din[81];
assign res[163] = din[204]^din[210];
assign res[164] = din[82];
assign res[165] = din[205]^din[211];
assign res[166] = din[83];
assign res[167] = din[206]^din[212];
assign res[168] = din[84];
assign res[169] = din[207]^din[213];
assign res[170] = din[85];
assign res[171] = din[208]^din[214];
assign res[172] = din[86];
assign res[173] = din[209]^din[215];
assign res[174] = din[87];
assign res[175] = din[210]^din[216];
assign res[176] = din[88];
assign res[177] = din[211]^din[217];
assign res[178] = din[89];
assign res[179] = din[212]^din[218];
assign res[180] = din[90];
assign res[181] = din[213]^din[219];
assign res[182] = din[91];
assign res[183] = din[214]^din[220];
assign res[184] = din[92];
assign res[185] = din[215]^din[221];
assign res[186] = din[93];
assign res[187] = din[216]^din[222];
assign res[188] = din[94];
assign res[189] = din[217]^din[223];
assign res[190] = din[95];
assign res[191] = din[218]^din[224];
assign res[192] = din[96];
assign res[193] = din[219]^din[225];
assign res[194] = din[97];
assign res[195] = din[220]^din[226];
assign res[196] = din[98];
assign res[197] = din[221]^din[227];
assign res[198] = din[99];
assign res[199] = din[222]^din[228];
assign res[200] = din[100];
assign res[201] = din[223]^din[229];
assign res[202] = din[101];
assign res[203] = din[224]^din[230];
assign res[204] = din[102];
assign res[205] = din[225]^din[231];
assign res[206] = din[103];
assign res[207] = din[226]^din[232];
assign res[208] = din[104];
assign res[209] = din[227]^din[233];
assign res[210] = din[105];
assign res[211] = din[228]^din[234];
assign res[212] = din[106];
assign res[213] = din[229]^din[235];
assign res[214] = din[107];
assign res[215] = din[230]^din[236];
assign res[216] = din[108];
assign res[217] = din[231]^din[237];
assign res[218] = din[109];
assign res[219] = din[232]^din[238];
assign res[220] = din[110];
assign res[221] = din[233]^din[239];
assign res[222] = din[111];
assign res[223] = din[234]^din[240];
assign res[224] = din[112];
assign res[225] = din[235]^din[241];
assign res[226] = din[113];
assign res[227] = din[236]^din[242];
assign res[228] = din[114];
assign res[229] = din[237]^din[243];
assign res[230] = din[115];
assign res[231] = din[238]^din[244];
assign res[232] = din[116];
assign res[233] = din[239]^din[245];
assign res[234] = din[117];
assign res[235] = din[240]^din[246];
assign res[236] = din[118];
assign res[237] = din[241]^din[247];
assign res[238] = din[119];
assign res[239] = din[242]^din[248];
assign res[240] = din[120];
assign res[241] = din[243]^din[249];
assign res[242] = din[121];
assign res[243] = din[244]^din[250];
assign res[244] = din[122];
assign res[245] = din[245]^din[251];
assign res[246] = din[123];
assign res[247] = din[246]^din[252];
assign res[248] = din[124];
assign res[249] = din[247]^din[253];
assign res[250] = din[125];
assign res[251] = din[248]^din[254];
assign res[252] = din[126];
assign res[253] = din[249]^din[255];
assign res[254] = din[127];
assign res[255] = din[250]^din[256];
assign res[256] = din[128];

endmodule