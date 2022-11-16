String bins[];
String hexs[];
String funs[];
String invbins[];
String ops[];

PrintWriter output;

String Currentpc = "000FFF00";
int headerlength = 256;

int translate(String[] binary){
  
  return -1;
}

void start(){
  initCodes();
  
  byte b[] = loadBytes("elf");
  bins = new String[b.length];
  hexs = new String[b.length];
  funs = new String[b.length];
  ops  = new String[b.length];
  
  output = createWriter("file.ignore");
  String hexline = "";
  String binline = "";
  String opline  = "";
  String binNoSpace = "";
  
  for(int i=0; i<b.length; i++){
     hexs[i] = hex(b[i]);
     bins[i] = binary(b[i]);
     
     if(i==headerlength)
       output.println("End of header");
     
     binNoSpace +=bins[i];
     
     hexline += hexs[i]+" ";
     binline += bins[i]+" ";
     
    if(i%4==3){
     //ops[i] = binNoSpace;
     //if(binNoSpace.equals("10000000001100000110001100100100"))
     
     //for(int j=0; j<codes.size(); j++){
     //   if(codes.get(j).equals(binNoSpace)){
     //     opline = codes.get(j).name;
          
     //     break; 
     //   }
     //}
     
     
      //opline = binNoSpace;
      
      output.println(Currentpc +" || "+hexline+"|| "+binline+" || "+opline);
      
      hexline    = "";
      binline    = "";
      binNoSpace = "";
      opline     = "";
      
      Currentpc = hex(unhex(Currentpc)+4);
    }
  }
  
  for(int i=0; i<bins.length/4; i++){
    int result = translate(bins);
    if(result == -1)
      funs[i] = "";
     else
       funs[i] = codes.get(result).name;
  }
    
  output.flush();
  
  println("Done!!!");
}

void draw(){
  
}
