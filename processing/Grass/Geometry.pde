class plane{
  PVector pos;
  float Width, Height;
  
  plane(float x, float y, float z, float Width, float Height){
    pos = new PVector(x, y, z);
    this.Width = Width;
    this.Height = Height;
  }
  
  void draw(){
    fill(0);
    //rect(this.pos.x, this.pos.y, this.Width, this.Height);
    rect(this.pos.x, this.pos.y, this.Width, this.Height);
    
    
    
    for(float x=this.pos.x; x<this.pos.x+this.Width; x++){
      for(float y=this.pos.y; y<this.pos.y+this.Height; y++){
        //DrawGrass(x, y, 1);
      }
    }
    
    fill(255);
  }
  
  void DrawGrass(float x, float y, float len){
    fill(255);
    rect(x, y, 1, 1);
  }
}

class sun{
  PVector pos;
  sun(float x, float y, float z){
     this.pos = new PVector(x, y, z);
  }
}
