plane p;

PVector CamPos, CamRot, mouse, lastmouse;
boolean keyDown;

void setup(){
  size(400, 400, P3D);
   
  CamPos = new PVector(200, 200, 0);
  mouse = new PVector(0, 0);
  lastmouse = new PVector(0, 0);
  
  CamRot = new PVector(0, 0, 0);
  
  p = new plane(0, 0, 0, 200, 200);
}

float i=0;
void draw(){
  background(255);
  mouse = new PVector(mouseX, mouseY);
  
  //rotateX((PI)+0.85);
  
  //rotateX(map(0, height, 0, PI/4, mouseX));
  //rotateX(i);
  
  CamRot.add(mouse.copy().sub(lastmouse).div(10));
  
  //float maxRot = 0.05;
  
  //if(CamRot.mag() >= maxRot)
  //  CamRot.setMag(maxRot);
  
  println(CamRot.x, CamRot.y);
  
  rotateX(CamRot.y);
  rotateY(CamRot.x);
  
  
  
  translate(CamPos.x, CamPos.y, CamPos.z);
  
  p.draw();
  
  
  //if(!mouse.equals(lastmouse)){
  //  if(mouse.x > lastmouse.x){
  //    CamRot.x -= 0.05;
  //  }
  //  else if(mouse.x < lastmouse.x){
  //    CamRot.x += 0.05;
  //  }
    
  //  if(mouse.y > lastmouse.y){
  //    CamRot.y -= 0.05;
  //  }
  //  else if(mouse.y < lastmouse.y){
  //    CamRot.y += 0.05;
  //  }
  //}
   
  
  
  
  if(keyDown){
    if(key == 'w')
      CamPos.y -= 0.5;
    else if(key == 's')
      CamPos.y += 0.5;
    if(key == 'a')
      CamPos.x += 0.5;
    else if(key == 'd')
      CamPos.x -= 0.5; 
    if(key == 'q')
      CamPos.z += 0.5; 
    else if(key == 'e')
      CamPos.z -= 0.5;
  }
 
  
  lastmouse = mouse.copy();
}

//void mouseWheel(MouseEvent event) {
//  float e = event.getCount();
//  i+=e;
//  println(i, e);
//}

void keyPressed(){
  keyDown = true;
  
}

void keyReleased(){
  keyDown = false;
}
