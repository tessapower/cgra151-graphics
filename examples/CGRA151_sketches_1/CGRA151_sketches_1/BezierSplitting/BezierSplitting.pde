/* this builds on BezierInteraction to demonstrate how Bezier curves split
 * it is intended for students to use rather than as an example of good coding
 * note that there is a second file (accessed through the second tab above) that contains
 *   all the code for handling the Bezier curves
 */
 
ArrayList<Bezier> beziers = new ArrayList<Bezier>() ; // the Bezier curves

boolean pointSelected = false ;   // whether a point is currently selected
Bezier selectedBezier ; // the currently selected curve

boolean showTests = false ; // show the straight line approximation and the distances calculated in the flatness test

boolean showConstruction = false ; // show how a point on the Bezier curve is calculated by repeated interpolation
float constructionParameter = 0.5 ; // the parameter telling where that point is on the Bezier curve

void setup() {
  size(700, 700);
  // print some help information in the black area at the bottom of the Processing window
  println( "t = toggle between showing the tests (blue lines)" ) ;
  println( "c = toggle between showing control points and construction" ) ;
  println( "    left and right arrows change split point, space restores to 0.5" ) ;
  println( "s = split the currently selected Bezier" ) ;
  println( "The software does not maintain connectivity of the split Beziers so do not move control points once the first split is done" ) ;

  // assign the four points to random positions
  beziers.add( new Bezier(random(100, 400), random(100, 400), random(100, 400), random(100, 400), random(100, 400), random(100, 400), random(100, 400), random(100, 400)) ) ;
}

void draw() {
  background(255) ;
  noFill();
  for ( Bezier b : beziers ) {
    strokeWeight( 3 ) ;
    stroke(0, 102, 0); // draw a green Bezier curve
    b.draw();
    strokeWeight(1) ;
    stroke(255, 0, 0); // red lines
    if( showConstruction ) b.drawConstruction( constructionParameter );
    else b.drawControls();
    if ( showTests ) {
      strokeWeight(2);
      stroke(0, 0, 255) ; // blue lines
      b.drawTests();
    }
  }
}

void mousePressed() {
  PVector mpos = new PVector( mouseX, mouseY ) ;
  for ( Bezier b : beziers ) {
    pointSelected = b.selectPoint( mpos ) ;
    if ( pointSelected ) { 
      selectedBezier = b ; 
      return ;
    }
  }
}


void mouseDragged() {
  PVector deltaPos = new PVector( mouseX-pmouseX, mouseY-pmouseY ) ;
  if ( pointSelected ) { // move the selected point
    selectedBezier.moveSelectedPoint( deltaPos ) ;
  }
}

void keyPressed() {
  Bezier[] newBez ;
  if ( key == 's' ) if ( pointSelected ) { 
    newBez = selectedBezier.split( constructionParameter ) ; 
    beziers.remove( selectedBezier ) ; 
    beziers.add( newBez[0] ) ; 
    beziers.add( newBez[1] ) ; 
    pointSelected=false;
  } 
  
  if ( key == 't' ) showTests = !showTests ;
  if ( key == 'c' ) showConstruction = !showConstruction ;
  
  if( keyCode == RIGHT ) { constructionParameter += 0.05 ; if(constructionParameter > 1.0) constructionParameter = 1.0 ;}
  if( keyCode == LEFT )  { constructionParameter -= 0.05 ; if(constructionParameter < 0.0) constructionParameter = 0.0 ;}
  if( key == ' ' ) { constructionParameter = 0.5 ; } ;
  
}