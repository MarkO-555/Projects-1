class Block{
  String name;
  String identity;
  String invidentity;
  int first, last;
  int length = 0;
  
  Block(String name, String identity, int first, int last){
    this.name = name;
    this.first = first;
    this.last = last;
    
    this.identity = identity;
    this.invidentity = "";
    this.length = (last - first) +1;
    if(!identity.equals("x")){
      for(int v=0; v<this.length; v++){
        this.invidentity += this.identity.charAt(this.length-(v+1));
      }
    }
  }
  
  boolean equals(String bins){
    String comp = "";
    
    if(this.first ==-1)
      return false;
      
    for(int i=first; i<first+this.length; i++){
        comp += bins.charAt(i);
    }
    
    return comp.equals(this.identity);
  }
}

class opCode{
  String name;
  Block[] blocks;
  
  opCode(String name, Block[] blocks){
    this.name = name;
    this.blocks = blocks;
  }
}
