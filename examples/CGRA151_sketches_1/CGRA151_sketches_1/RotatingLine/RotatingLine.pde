// draws a single black line on a white background
// the line's ends lie on points 50 and 150 pixels away from the centre of the window
// the line rotates around the centre of the window

float angle = 0.0 ; // the angle at which the line is drawn, in radians

void setup(){
  size(400,400);
//  frameRate(60);
}

void draw(){
  float c, s ;
  background(255) ;
  c = cos(angle) ;
  s = sin(angle) ;
  strokeWeight(5) ;
  line( c*50+200, s*50+200, c*150+200, s*150+200 ) ;
  /* this draws a line starting at a point on a circle of radius 50 units
     centred at (200,200) and ending at a point on a circle of radius 150
     units, centred in the same place. The window size is 400x400, so
     (200,200) is the centre of the window.
   */
  angle = angle + 0.02 ; // change to 0.2 to see what happens
}