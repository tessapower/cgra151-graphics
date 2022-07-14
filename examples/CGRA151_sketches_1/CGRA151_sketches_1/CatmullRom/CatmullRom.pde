/* draw a Catmull-Rom curve
 * with control points (orange) and the equivalent Bezier control polygon (red)
 */
 
PVector[] CRpts = new PVector[4] ;
PVector[] Bezpts = new PVector[4] ;
float epsilon = 10 ;
int selectedPoint = 0 ;
boolean pointSelected = false ;

void setup(){
  size(500,500);
  for( int i=0; i < 4; i++ ){
    CRpts[i]=new PVector( random(100,400), random(100,400) ) ;
    Bezpts[i]=new PVector( 0,0 ) ;
  }
}

void draw() {
  // work out the Bezier control polygon that draws the same curve as the Catmull-Rom control points - see slides 116-117 (2016 notes) 
  Bezpts[0].set( CRpts[1] ) ;
  Bezpts[1].set( PVector.add( CRpts[1], PVector.mult( PVector.sub( CRpts[2], CRpts[0] ), 1/6.0 ) ) ) ;
  Bezpts[2].set( PVector.add( CRpts[2], PVector.mult( PVector.sub( CRpts[1], CRpts[3] ), 1/6.0 ) ) ) ;
  Bezpts[3].set( CRpts[2] ) ;
  
  background(255) ;
  noFill();
  stroke(255,102,0); // orange lines
  
  // draw Catmull-Rom control points and control polygon
  strokeWeight( 3 );
  for( int i=0 ; i<3 ; i++ ) {
    line( CRpts[i].x, CRpts[i].y, CRpts[i+1].x, CRpts[i+1].y ) ;
  }
  strokeWeight( 1 ) ;
  for( int i=0 ; i<4 ; i++ ) {
    rect( CRpts[i].x - epsilon/2, CRpts[i].y - epsilon/2, epsilon, epsilon ) ;
  }
  // draw Catmull-Rom cubic curve
  strokeWeight( 3 ) ;
  stroke(0,0,102); // blue Catmull-Rom
  curve( CRpts[0].x, CRpts[0].y, CRpts[1].x, CRpts[1].y, CRpts[2].x, CRpts[2].y, CRpts[3].x, CRpts[3].y ) ;

  // draw Bezier cubic curve, to demonstrate that they truly are the same curve
  strokeWeight( 1 ) ;
  stroke(0,255,0); // green Bezier
  bezier( Bezpts[0].x, Bezpts[0].y, Bezpts[1].x, Bezpts[1].y, Bezpts[2].x, Bezpts[2].y, Bezpts[3].x, Bezpts[3].y ) ;
  
  // draw Bezier control polygon
  noFill();
  stroke(255,0,0); // red lines
  strokeWeight( 1 );
  for( int i=0 ; i<3 ; i++ ) {
    line( Bezpts[i].x, Bezpts[i].y, Bezpts[i+1].x, Bezpts[i+1].y ) ;
  }
}

void mousePressed(){
  PVector mpos = new PVector( mouseX, mouseY ) ;
  for( int i=0 ; i<4 ; i++ ) {
    if( CRpts[i].dist( mpos ) < epsilon ) {
        selectedPoint = i ;
        pointSelected = true ;
        return ;
    }
  }
  pointSelected = false ;
}


void mouseDragged() {
  PVector deltaPos = new PVector( mouseX-pmouseX, mouseY-pmouseY ) ;
  if( pointSelected ) {
    CRpts[selectedPoint].add( deltaPos ) ;
  }
}