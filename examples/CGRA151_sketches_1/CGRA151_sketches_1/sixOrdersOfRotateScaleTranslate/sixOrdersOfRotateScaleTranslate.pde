/* this shows the six possible orderings of rotate() scale() and translate()
 * applied to a simple rectangle
 * each order produces a different result
 * move the mouse left-right to see the effect of different rotation angles
 */
 
void setup(){
  size(500,500);
}

void draw(){
//  background(200);
  translate(250,250) ; //move origin to centre of window
  
  fill(128,0,0); //SRT
  pushMatrix();
    scale(2,0.5);
    rotate(mouseX/50.0);
    translate(50,0);
    rect(-25,-25,50,50);
  popMatrix();

  fill(128,128,0); // STR
  pushMatrix();
    scale(2,0.5);
    translate(50,0);
    rotate(mouseX/50.0);
    rect(-25,-25,50,50);
  popMatrix();

  fill(0,128,0); //TSR
  pushMatrix();
    translate(50,0);
    scale(2,0.5);
    rotate(mouseX/50.0);
    rect(-25,-25,50,50);
  popMatrix();

  fill(0,128,128); //TRS
  pushMatrix();
    translate(50,0);
    rotate(mouseX/50.0);
    scale(2,0.5);
    rect(-25,-25,50,50);
  popMatrix();

  fill(0,0,128); //RTS
  pushMatrix();
    rotate(mouseX/50.0);
    translate(50,0);
    scale(2,0.5);
    rect(-25,-25,50,50);
  popMatrix();

  fill(128,0,128); //RST
  pushMatrix();
    rotate(mouseX/50.0);
    scale(2,0.5);
    translate(50,0);
    rect(-25,-25,50,50);
  popMatrix();
}