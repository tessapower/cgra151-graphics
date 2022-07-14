/* Allows you to interact with a single Bezier curve
 * The Bezier curve is drawn as a thick green line
 * The Bezier control points are drawn as small orange boxes
 * Thick orange lines connect P0 to P1 and P2 to P3
 * the mouse callback routines are used to move the points
 */

PVector[] pts = new PVector[4] ;  // the four points in a Bezier curve
float epsilon = 10 ;              // the maximum distance from a point that allows it to be selected
int selectedPoint = 0 ;           // the currently selected point
boolean pointSelected = false ;   // whether a point is currently selected

void setup(){
  size(500,500);
  for( int i=0; i < 4; i++ ){ // assign the four points to random positions
    pts[i]=new PVector( random(100,400), random(100,400) ) ;
  }
}

void draw() {
  background(255) ;
  noFill();
  stroke(255,102,0); // orange lines
  strokeWeight( 3 );
  for( int i=0 ; i<3 ; i+=2 ) { // draw two lines: pts[0]-pts[1] and pts[2]-pts[3] 
    line( pts[i].x, pts[i].y, pts[i+1].x, pts[i+1].y ) ;
  }
  strokeWeight( 1 ) ;
  for( int i=0 ; i<4 ; i++ ) { // draw little boxes at each point
    rect( pts[i].x - epsilon/2, pts[i].y - epsilon/2, epsilon, epsilon ) ;
  }
  strokeWeight( 3 ) ;
  stroke(0,102,0); // draw a green Bezier curve
  bezier( pts[0].x, pts[0].y, pts[1].x, pts[1].y, pts[2].x, pts[2].y, pts[3].x, pts[3].y ) ;
}

void mousePressed(){
  PVector mpos = new PVector( mouseX, mouseY ) ;
  for( int i=0 ; i<4 ; i++ ) { // search through the points to see if any is close enough to mouse to be selected
    if( pts[i].dist( mpos ) < epsilon ) {
        selectedPoint = i ;
        pointSelected = true ;
        return ; // once we have found one point we return, we cannot select more than one point at a time
    }
  }
  pointSelected = false ;
}


void mouseDragged() {
  PVector deltaPos = new PVector( mouseX-pmouseX, mouseY-pmouseY ) ;
  if( pointSelected ) { // move the selected point
    pts[selectedPoint].add( deltaPos ) ;
  }
}