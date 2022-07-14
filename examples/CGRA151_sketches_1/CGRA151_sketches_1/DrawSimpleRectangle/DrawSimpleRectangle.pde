/* draws a rectangle with one corner at the point where the mouse is pressed
   and the other corner at where the mouse has been dragged to
   when the mouse is released, it no longer updates the variables until the
   mouse is pressed again
 */

int a, b, c, d ; // the four parameters of the rectangle

void setup(){
  size(500,500) ;
}

void draw(){
  background(255) ;
  rectMode( CORNERS ) ;
  rect( a, b, c, d ) ; // draw the rectangle
}

void mousePressed(){
  a = mouseX ; // when mouse is pressed down we reset (a,b) to be the current mouse position
  b = mouseY ;
  c = a ;      // and reset (c,d) to be the same as (a,b)
  d = b ;
}

void mouseDragged(){
  c = mouseX ; // when the mouse is dragged (that is, the mouse moves while the button is pressed down
  d = mouseY ; // we update (c,d)
}