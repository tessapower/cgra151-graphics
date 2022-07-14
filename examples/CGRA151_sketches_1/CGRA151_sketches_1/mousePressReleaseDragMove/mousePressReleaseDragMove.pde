/* examples of the use of the mouse callback functions
   draws a different shape for each callback:
   mouseMoved: pink circle
   mouseDragged: dark blue circle
   mousePressed: large light blue circle
   mouseReleased: large red circle
   mouseClicked: green square
*/

void setup(){
  size(500,500);
}
void draw(){
  // even though we draw nothing in the draw() function
  // we need the draw() function, otherwise the callbacks will not get called
}
void mouseMoved(){
  fill(255,128,128);
  ellipse(mouseX,mouseY,50,50) ;
}
void mouseDragged(){
  fill(0,0,255);
  ellipse(mouseX,mouseY,50,50);
}
void mousePressed(){
  fill(128,128,255);
  ellipse(mouseX,mouseY,100,100);
}
void mouseReleased(){
  fill(255,0,0);
  ellipse(mouseX,mouseY,100,100);
}
void mouseClicked(){
  fill(0,255,0);
  rect(mouseX-40, mouseY-40,80,80);
}