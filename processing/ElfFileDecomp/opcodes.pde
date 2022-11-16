ArrayList<opCode> codes = new ArrayList<opCode>();

void initCodes(){
  Block[] ops = new Block[4];
  
  ops[0] = new Block("offset",  "x"    , 00, 15);
  ops[1] = new Block("Name"  ,  "00000", 16, 20);
  ops[2] = new Block("BC0"   ,  "01000", 21, 25);
  ops[3] = new Block("COP0"  , "010000", 00, 00);
  codes.add(new opCode("BC0F", ops));
  
  ops[2] = new Block("BC1"   , "01000", 21, 25);
  ops[3] = new Block("COP1"  , "10001", 00, 00);
  codes.add(new opCode("BC1F", ops));
  
  ops = new Block[6];
  ops[0] = new Block("Name", "000000", 00, 05);
  ops[1] = new Block("fd"  , "x"     , 06, 10);
  ops[2] = new Block("fs"  , "x"     , 11, 15);
  ops[3] = new Block("ft"  , "x"     , 16, 20);
  ops[4] = new Block("s"   , "10000" , 21, 25);
  ops[5] = new Block("COP1", "010001", 26, 31);
  codes.add(new opCode("ADD.S", ops));
  
  ops[1] = new Block("Zero",  "00000", 06, 10);
  ops[2] = new Block("rd"  , "x"     , 11, 15);
  ops[3] = new Block("rt"  , "x"     , 16, 20);
  ops[4] = new Block("rs"  , "x"     , 21, 25);
  ops[5] = new Block("MMI" , "011100", 26, 31);
  codes.add(new opCode("MADD", ops));
  
  ops[0] = new Block("MMI0", "001000", 00, 05);
  ops[1] = new Block("Name",  "00000", 06, 10);
  codes.add(new opCode("PADDW", ops));
  
  ops[0] = new Block("MMI3", "101001", 00, 05);
  codes.add(new opCode("PMADDUW", ops));
  
  ops[0] = new Block("MMI2", "001001", 00, 05);
  codes.add(new opCode("PMADDW", ops));
  
  ops[0] = new Block("Name", "000000", 00, 05);
  ops[1] = new Block("Sa"  , "x"     , 06, 10);
  ops[2] = new Block("rd"  , "x"     , 11, 15);
  ops[3] = new Block("rt"  , "x"     , 16, 20);
  ops[4] = new Block("Zero", "00000", 21, 25);
  ops[5] = new Block("Special", "000000", 00, 05);
  codes.add(new opCode("SLL", ops));
  
  
  //ops[1] = new Block("", "", 00);
  //codes.add();
}




//opCode[] codes = {
//   new opCode("","00000000000000000000000000000000", 00),
   
//   new opCode("SLL",       "000000", 00),
//   new opCode("MADD",      "000000", 00),
//   new opCode("ADD.S",     "000000", 00),
//   new opCode("PADDW",      "00000", 06),
//   new opCode("PMADDW",     "00000", 06),
//   new opCode("PMADDUW",    "00000", 06),
//   new opCode("BC1F",       "00000", 16),
//   new opCode("BC0F",       "00000", 16),
   
//   new opCode("MADDU",     "000001", 00),
//   new opCode("SUB.S",     "000001", 00),
//   new opCode("TLBR",      "000001", 00),
//   new opCode("PSUBW",      "00001", 06),
//   new opCode("PADSW",      "00001", 06),
//   new opCode("BGEZ",       "00001", 16),
//   new opCode("BC1T",       "00001", 16),
//   new opCode("BCOT",       "00001", 16),
   
//   new opCode("SRL",       "000010", 00),
//   new opCode("MUL.S",     "000010", 00),
//   new opCode("TLBWI",     "000010", 00),
//   new opCode("J",         "000010", 26),
//   new opCode("PCGTW",      "00010", 06),
//   new opCode("PCEQW",      "00010", 06),
//   new opCode("PSLLVW",     "00010", 06),
//   new opCode("PSRAVW",     "00010", 06),
//   new opCode("BLTZL",      "00010", 16),
//   new opCode("BC1FL",      "00010", 16),
//   new opCode("BC0FL",      "00010", 16),
//   new opCode("CFC1",       "00010", 21),
   
//   new opCode("SRA",       "000011", 00),
//   new opCode("DIV.S",     "000011", 00),
//   new opCode("JAL",       "000011", 26),
//   new opCode("PMAXW",      "00011", 06),
//   new opCode("PMINW",      "00011", 06),
//   new opCode("PSRLVW",     "00011", 06),
//   new opCode("BGEZL",      "00011", 16),
//   new opCode("BLTZ",       "00011", 16),
//   new opCode("BC1TL",      "00011", 16),
//   new opCode("BC0TL",      "00011", 16),
   
//   new opCode("SLLV",      "000100", 00),
//   new opCode("PLZCW",     "000100", 00),
//   new opCode("SQRT.S",    "000100", 00),
//   new opCode("PADDH",      "00100", 06),
//   new opCode("PADSBH",     "00100", 06),
//   new opCode("PMSUBW",     "00100", 06),
//   new opCode("MTC1",       "00100", 21),
   
//   new opCode("ABS.S",     "000101", 00),
//   new opCode("BNE",       "000101", 26),
//   new opCode("PSUBH",      "00101", 06),
//   new opCode("PABSH",      "00101", 06),
   
//   new opCode("SRLV",      "000110", 00),
//   new opCode("MOV.S",     "000110", 00),
//   new opCode("TLBWR",     "000110", 00),
//   new opCode("BLEZ",      "000110", 26),
//   new opCode("PCGTH",      "00110", 06),
//   new opCode("PCEQH",      "00110", 06),
//   new opCode("CTC1",       "00110", 21),
   
//   new opCode("SRAV",      "000111", 00),
//   new opCode("NEG.S",     "000111", 00),
//   new opCode("BGTZ",      "000111", 26),
//   new opCode("BEQ",       "000111", 26),
//   new opCode("PMAXH",      "00111", 06),
//   new opCode("PMIN",       "00111", 06),
   
//   new opCode("JR",        "001000", 00),
//   new opCode("TLBP",      "001000", 00),
//   new opCode("PADDB",      "01000", 06),
//   new opCode("PMFHI",      "01000", 06),
//   new opCode("PMTHI",      "01000", 06),
//   new opCode("TGEI",       "01000", 16),
   
//   new opCode("JALR",      "001001", 00),
//   new opCode("ADDIU",     "001001", 26),
//   new opCode("PSUBB",      "01001", 06),
//   new opCode("PMFLO",      "01001", 06),
//   new opCode("PMTLO",      "01001", 06),
//   new opCode("TGEIU",      "01001", 16),
   
//   new opCode("MOVZ",      "001010", 00),
//   new opCode("SLTI",      "001010", 26),
//   new opCode("PCGTB",      "01010", 06),
//   new opCode("PCEQB",      "01010", 06),
//   new opCode("PINTH",      "01010", 06),
//   new opCode("PINTEH",     "01010", 06),
//   new opCode("TLTI",       "01010", 16),
   
//   new opCode("MOVN",      "001011", 00),
//   new opCode("SLTIU",     "001011", 26),
//   new opCode("TLTIU",      "01011", 16),
   
//   new opCode("SYSCALL",   "001100", 00),
//   new opCode("ANDI",      "001100", 26),
//   new opCode("TEQI",       "01100", 16),
//   new opCode("PMULTW",     "01100", 06),
//   new opCode("PMULTUW",    "01100", 06),
   
//   new opCode("Break",     "001101", 00),
//   new opCode("ORI",       "001101", 26),
//   new opCode("PDIVW",     "001101", 06),
//   new opCode("PDIVUW",     "01101", 06),
   
//   new opCode("XORI",      "001110", 26),
//   new opCode("PCPYLD",     "01110", 06),
//   new opCode("PCPYUD",     "01110", 06),
//   new opCode("TNEI",       "01110", 16),
   
//   new opCode("SYNC.stype", "001111", 00),
//   new opCode("LUI",        "001111", 26),
   
//   new opCode("MFHI",      "010000", 00),
//   new opCode("MFHI1",     "010000", 00),
//   new opCode("PADDSW",     "10000", 06),
//   new opCode("PADDUW",     "10000", 06),
//   new opCode("PMADDH",     "10000", 06),
//   new opCode("BLTZAL",     "10000", 16),
   
//   new opCode("MTHI",      "010001", 00),
//   new opCode("MTHI1",     "010001", 00),
//   new opCode("MTLO1",     "010001", 00),
//   new opCode("PSUBSW",     "10001", 06),
//   new opCode("PSUBUW",     "10001", 06),
//   new opCode("PHMADH",     "10001", 06),
//   new opCode("BGEZAL",     "10001", 16),
   
//   new opCode("MFLO",      "010010", 00),
//   new opCode("MFLO1",     "010010", 00),
//   new opCode("PEXTLW",     "10010", 06),
//   new opCode("PEXTUW",     "10010", 06),
//   new opCode("PAND",       "10010", 06),
//   new opCode("POR",        "10010", 06),
//   new opCode("BLTZALL",    "10010", 16),
   
//   new opCode("MTLO",      "010011", 00),
//   new opCode("PPACW",      "10011", 06),
//   new opCode("PXOR",       "10011", 06),
//   new opCode("PNOR",       "10011", 06),
//   new opCode("BGEZALL",    "10011", 16),
   
//   new opCode("DSLLV",     "010100", 00),
//   new opCode("BEQL",      "010100", 26),
//   new opCode("PADDSH",     "10100", 06),
//   new opCode("PADDUH",     "10100", 06),
//   new opCode("PMSUBH",     "10100", 06),
   
//   new opCode("BNEL",      "010101", 26),
//   new opCode("PSUBSH",     "10101", 06),
//   new opCode("PSUBUH",     "10101", 06),
//   new opCode("PHMSBH",     "10101", 06),
   
//   new opCode("DSRLV",     "010110", 00),
//   new opCode("RSQRT.S",   "010110", 00),
//   new opCode("BLEZL",     "010110", 26),
//   new opCode("PEXTLH",     "10110", 06),
//   new opCode("PEXTUH",     "10110", 06),
   
//   new opCode("DSRAV",     "010111", 00),
//   new opCode("BGTZL",     "010111", 26),
//   new opCode("PPACH",      "10111", 06),
   
//   new opCode("MULT",      "011000", 00),
//   new opCode("MULT",      "011000", 00),
//   new opCode("MULT1",     "011000", 00),
//   new opCode("ADDA.S",    "011000", 00),
//   new opCode("CVT.S.W",   "011000", 00),
//   new opCode("ERET",      "011000", 00),
//   new opCode("DADDI",     "011000", 26),
//   new opCode("PADDSB",     "11000", 06),
//   new opCode("PADDUB",     "11000", 06),
//   new opCode("MTSAB",      "11000", 16),
   
//   new opCode("MULTU",     "011001", 00),
//   new opCode("MULTU",     "011001", 00),
//   new opCode("MULTU1",    "011001", 00),
//   new opCode("SUBA.S",    "011001", 00),
//   new opCode("DADDIU",    "011001", 26),
//   new opCode("PSUBSB",     "11001", 06),
//   new opCode("PSUBUB",     "11001", 06),
//   new opCode("MTSAH",      "11001", 16),
   
//   new opCode("DIV",       "011010", 00),
//   new opCode("DIV1",      "011010", 00),
//   new opCode("MULA.S",    "011010", 00),
//   new opCode("LDL",       "011010", 26),
//   new opCode("PEXTLB",     "11010", 06),
//   new opCode("PEXTUB",     "11010", 06),
//   new opCode("PEXEH",      "11010", 06),
//   new opCode("PEXCH",      "11010", 06),
   
//   new opCode("DIVU",      "011011", 00),
//   new opCode("DIVU1",     "011011", 00),
//   new opCode("LDR",       "011011", 26),
//   new opCode("PPACB",      "11011", 06),
//   new opCode("QFSRV",      "11011", 06),
//   new opCode("PREVH",      "11011", 06),
//   new opCode("PCPYH",      "11011", 06),
   
//   new opCode("MADD.S",    "011100", 00),
//   new opCode("PMULTH",     "11100", 06),
   
//   new opCode("MSUB.S",    "011101", 00),
//   new opCode("PDIVBW",     "11101", 06),
   
//   new opCode("MADDA.S",   "011110", 00),
//   new opCode("LQ",        "011110", 26),
//   new opCode("PEXEW",      "11110", 06),
//   new opCode("PEXT5",      "11110", 06),
//   new opCode("PEXCW",      "11110", 06),
   
//   new opCode("MSUBA.S",   "011111", 00),
//   new opCode("SQ",        "011111", 26),
//   new opCode("PPAC5",      "11111", 06),
//   new opCode("PROT3W",     "11111", 06),
   
//   new opCode("ADD",       "100000", 00),
//   new opCode("MADD1",     "100000", 00),
//   new opCode("LB",        "100000", 26),
   
//   new opCode("ADDU",      "100001", 00),
//   new opCode("MADDU1",    "100001", 00),
//   new opCode("LH",        "100001", 26),
   
//   new opCode("SUB",       "100010", 00),
//   new opCode("LWL",       "100010", 26),
   
//   new opCode("SUBU",      "100011", 00),
//   new opCode("LW",        "100011", 26),
   
//   new opCode("AND",       "100100", 00),
//   new opCode("CVT.W.S",   "100100", 00),
//   new opCode("LBU",       "100100", 26),
   
//   new opCode("OR",        "100101", 00),
//   new opCode("LHU",       "100101", 26),
   
//   new opCode("XOR",       "100110", 00),
//   new opCode("LWR",       "100110", 26),
   
//   new opCode("NOR",       "100111", 00),
//   new opCode("LWU",       "100111", 26),
   
//   new opCode("MFSA",      "101000", 00),
//   new opCode("MAX.S",     "101000", 00),
//   new opCode("SB",        "101000", 26),
   
//   new opCode("MTSA",      "101001", 00),
//   new opCode("SH",        "101001", 26),
   
//   new opCode("MIN.S",     "101001", 00),
//   new opCode("SLT",       "101010", 00),
//   new opCode("SWL",       "101010", 26),
   
//   new opCode("SLTU",      "101011", 00),
//   new opCode("SW",        "101011", 26),
   
//   new opCode("DADD",      "101100", 00),
//   new opCode("SDL",       "101100", 26),
   
//   new opCode("DADDU",     "101101", 00),
//   new opCode("SDR",       "101101", 26),
   
//   new opCode("DSUB",      "101110", 00),
//   new opCode("SWR",       "101110", 26),
   
//   new opCode("DSUBU",       "101111", 00),
//   new opCode("CACHE IXLTG", "101111", 26),
//   new opCode("CACHE IXLDT", "101111", 26),
//   new opCode("CACHE BXLBT", "101111", 26),
//   new opCode("CACHE IXSTG", "101111", 26),
//   new opCode("CACHE BXSBT", "101111", 26),
//   new opCode("CACHE IXIN",  "101111", 26),
//   new opCode("CACHE IXSDT", "101111", 26),
//   new opCode("CACHE BHINBT","101111", 26),
//   new opCode("CACHE BFH",   "101111", 26),
//   new opCode("CACHE IFL",   "101111", 26),
//   new opCode("CACHE IHIN",  "101111", 26),
//   new opCode("CACHE DHIN",  "101111", 26),
//   new opCode("CACHE DHWBIN","101111", 26),
//   new opCode("CACHE DHWOIN","101111", 26),
//   new opCode("CACHE DXIN",  "101111", 26),
//   new opCode("CACHE DXLDT", "101111", 26),
//   new opCode("CACHE DXLTG", "101111", 26),
//   new opCode("CACHE DXSDT", "101111", 26),
//   new opCode("CACHE DXSTG", "101111", 26),
//   new opCode("CACHE DXWBIN","101111", 26),
   
   
//   new opCode("TGE",       "110000", 00),
//   new opCode("PMFHL.LW",  "110000", 00),
//   new opCode("PMFHL.UW",  "110000", 00),
//   new opCode("PMFHL.SLW", "110000", 00),
//   new opCode("PMFHL.LH",  "110000", 00),
//   new opCode("PMFHL.SH",  "110000", 00),
   
//   new opCode("TGEU",      "110001", 00),
//   new opCode("PHTHL.LW",  "110001", 00),
   
//   new opCode("TLT",       "110010", 00),
   
//   new opCode("TLTU",      "110011", 00),
//   new opCode("PREF",      "110011", 26),
   
//   new opCode("TEQ",       "110100", 00),
//   new opCode("PSLLH",     "110100", 00),
   
//   new opCode("TNE",       "110110", 00),
//   new opCode("PSRLH",     "110110", 00),
   
//   new opCode("PSRAH",     "110111", 00),
//   new opCode("LD",        "110111", 26),
   
//   new opCode("DSLL",      "111000", 00),
//   new opCode("EI",        "111000", 00),
   
//   new opCode("DI",        "111001", 00),
//   new opCode("SWC1",      "111001", 26),
   
//   new opCode("DSRL",      "111010", 00),
   
//   new opCode("DSRA",      "111011", 00),
   
//   new opCode("DSLL32",    "111100", 00),
//   new opCode("PSLLW",     "111100", 00),
   
//   new opCode("DSRL32",    "111110", 00),
//   new opCode("PSRLW",     "111110", 00),
   
//   new opCode("DSRA32",    "111111", 00),
//   new opCode("SD",        "111111", 26),
//   new opCode("PSRAW",     "111111", 00),
   
//   new opCode("ADDI",    "", -1),
//   new opCode("MFC1",    "", -1),
//   new opCode("C.EQ.S",  "", -1),
//   new opCode("C.F.S",   "", -1),
//   new opCode("C.LE.S",  "", -1),
//   new opCode("C.LT.S",  "", -1),
//   new opCode("LWC1",    "", -1),
//   new opCode("MFC0",    "", -1),
//   new opCode("MFBPC",   "", -1),
//   new opCode("MFDAB",   "", -1),
//   new opCode("MFDABM",  "", -1),
//   new opCode("MFDVB",   "", -1),
//   new opCode("MFDVBM",  "", -1),
//   new opCode("MFIAB",   "", -1),
//   new opCode("MFIABM",  "", -1),
//   new opCode("MTC0",    "", -1),
//   new opCode("MTBPC",   "", -1),
//   new opCode("MTDAB",   "", -1),
//   new opCode("MTDABM",  "", -1),
//   new opCode("MTDVB",   "", -1),
//   new opCode("MTDVBM",  "", -1),
//   new opCode("MTIAB",   "", -1),
//   new opCode("MTIABM",  "", -1),
//   new opCode("MPFS",    "", -1),
//   new opCode("MTPC",    "", -1),
//   new opCode("MTPS",    "", -1),
//   new opCode("MFPC",    "", -1)
// };
