class Bezier {
  PVector[] pts = new PVector[4] ;  // the four points in a Bezier curve
  float epsilon = 10 ;              // the maximum distance from a point that allows it to be selected
  int selectedPoint = 0 ;           // the currently selected point
  boolean pointSelected = false ;   // whether a point is currently selected

  Bezier( float x0, float y0, float x1, float y1, float x2, float y2, float x3, float y3 ) {
    for ( int i=0; i < 4; i++ ) {
      pts[i]=new PVector();
    }
    pts[0].x = x0 ;
    pts[0].y = y0 ;
    pts[1].x = x1 ;
    pts[1].y = y1 ;
    pts[2].x = x2 ;
    pts[2].y = y2 ;
    pts[3].x = x3 ;
    pts[3].y = y3 ;
  }
  Bezier( PVector p0, PVector p1, PVector p2, PVector p3 ) {
    pts[0]=p0;
    pts[1]=p1;
    pts[2]=p2;
    pts[3]=p3;
  }

  void lineV( PVector P0, PVector P1 ) { //helper function to draw a line between two PVectors
    line( P0.x, P0.y, P1.x, P1.y ) ;
  }

  void boxV( PVector P ) { // helper function to draw a little box centred on P
    rect( P.x -epsilon/2, P.y-epsilon/2, epsilon, epsilon) ;
  }

  void drawTests() { // draw the line between points 0 and 3, and the lines used in the calculation of the test distances
    PVector nearest ;
    PVector endToEnd = PVector.sub( pts[3], pts[0] ) ;
    float s ;

    lineV( pts[0], pts[3] ) ;

    s = PVector.dot( endToEnd, PVector.sub( pts[1], pts[0] ) ) / endToEnd.magSq() ;
    if ( s < 0.0 ) { 
      nearest = pts[0] ;
    } else if ( s > 1.0 ) { 
      nearest = pts[3] ;
    } else nearest = PVector.lerp( pts[0], pts[3], s ) ;
    lineV( pts[1], nearest ) ;

    s = PVector.dot( endToEnd, PVector.sub( pts[2], pts[0] ) ) / endToEnd.magSq() ;
    if ( s < 0.0 ) { 
      nearest = pts[0] ;
    } else if ( s > 1.0 ) { 
      nearest = pts[3] ;
    } else nearest = PVector.lerp( pts[0], pts[3], s ) ;
    lineV( pts[2], nearest ) ;
  }

  void drawControls() {
    for ( int i=0; i<3; i++ ) { // draw lines pts[0]-pts[1] and pts[2]-pts[3] 
      lineV( pts[i], pts[i+1] ) ;
    }
    for ( int i=0; i<4; i++ ) { // draw little boxes at each point
      boxV( pts[i] ) ;
    }
  }

  void drawConstruction( float t ) {
    PVector p01=PVector.lerp(pts[0], pts[1], t);
    PVector p12=PVector.lerp(pts[1], pts[2], t);
    PVector p23=PVector.lerp(pts[2], pts[3], t);
    PVector p012=PVector.lerp(p01, p12, t);
    PVector p123=PVector.lerp(p12, p23, t);
    PVector p0123=PVector.lerp(p012, p123, t);

    noFill();
    strokeWeight(1);
    stroke(255, 0, 0);
    lineV(pts[0], pts[1]);
    lineV(pts[1], pts[2]);
    lineV(pts[2], pts[3]);
    boxV(pts[0]);
    boxV(pts[1]);
    boxV(pts[2]);
    boxV(pts[3]);
    stroke(255, 128, 0);
    lineV(p01, p12);
    lineV(p12, p23);
    boxV(p01);
    boxV(p12);
    boxV(p23);
    stroke(128, 128, 0);
    lineV(p012, p123);
    boxV(p012);
    boxV(p123);
    stroke(0, 128, 0);
    boxV(p0123);
  }

  void draw() {
    bezier( pts[0].x, pts[0].y, pts[1].x, pts[1].y, pts[2].x, pts[2].y, pts[3].x, pts[3].y ) ;
  }

  boolean selectPoint( PVector mpos ) {
    for ( int i=0; i<4; i++ ) { // search through the points to see if any is close enough to mouse to be selected
      if ( pts[i].dist( mpos ) < epsilon ) {
        selectedPoint = i ;
        pointSelected = true ;
        return true ; // once we have found one point we return, we cannot select more than one point at a time
      }
    }
    return false ;
  }

  void moveSelectedPoint( PVector delta ) {
    pts[selectedPoint].add( delta ) ;
  }

  Bezier[] split( float t ) {
    PVector p01=PVector.lerp(pts[0], pts[1], t);
    PVector p12=PVector.lerp(pts[1], pts[2], t);
    PVector p23=PVector.lerp(pts[2], pts[3], t);
    PVector p012=PVector.lerp(p01, p12, t);
    PVector p123=PVector.lerp(p12, p23, t);
    PVector p0123=PVector.lerp(p012, p123, t);
    Bezier[] newBez = new Bezier[2] ;
    newBez[0] = new Bezier(pts[0], p01, p012, p0123) ;
    newBez[1] = new Bezier(p0123, p123, p23, pts[3]) ;
    return newBez ;
  }
}