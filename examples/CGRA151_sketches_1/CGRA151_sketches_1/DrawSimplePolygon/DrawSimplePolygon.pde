/* draws a polygon with numSides sides
   the polygon is drawn with vertices on a circle that just
   fits inside the window
 */

int numSides = 7 ;

void setup(){
  size( 300, 300 ) ;
}

void draw() {
  beginShape() ;
  for( int i = 0 ; i < numSides ; i++ ) {
    // notice that the vertices are generated inside a loop
    // the formula for the vertex creates vertices that lie on an ellipse
    // with radii width/2 and height/2 and centred on point (width/2, height/2)
    vertex( ( cos(i * TWO_PI / numSides) + 1 ) * width/2,
            ( sin(i * TWO_PI / numSides) + 1 ) * height/2 ) ;
  }
  endShape( CLOSE ) ;
}