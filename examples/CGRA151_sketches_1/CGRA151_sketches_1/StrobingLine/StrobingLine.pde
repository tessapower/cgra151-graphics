/* a line moving down the window */

int y=0; // current position of the line

void setup(){
  size(200,600);
  frameRate(60);
} 

void draw(){
  background(255);
  strokeWeight(5);  
  line( 0, y%height, width, y%height );
  // the % operator takes the modulus of the value
  // the modulus is the remainder after integer division
  // so y%height always returns a number between 0 and height-1
  y=y+1;
}