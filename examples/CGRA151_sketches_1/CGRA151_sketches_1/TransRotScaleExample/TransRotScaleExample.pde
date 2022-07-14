/* the translation, rotation, scale example from slide 129 (2016 notes)
 */
 
void setup(){
  size(200,200);
}
void drawThing(){
  rect(-30,-30,60,60);
  ellipse( 0,0,40,40);
  line(0,0,40,40);
}
void draw(){
  drawThing();
  translate(100,60);
  drawThing();
  translate(-10,70);
  rotate( 1.0 ) ; // one radian
  scale( 2.0 ); // double size 
  drawThing();
}