// Program to show how to use keyPressed() and keyReleased() to control movement
// this is a worked example to be used in class

void setup(){
  size(1000,100) ; // wide short window
}

int ballX = 500 ; // we'll have a ball that starts in the middle of the window
int ballY = 50 ;
boolean moveLeft  = false ; // is the key that makes the ball move left pressed down?
boolean moveRight = false ; // is the key that makes the ball move right pressed down?

void draw(){
  background(0);
  if( moveLeft  && ballX > 0 ) ballX-- ; // notice use of && and --
  if( moveRight && ballY < width ) ballX++ ; // and here ++
  ellipse( ballX, ballY, 75, 75 ) ; // draw the ball
}

// the colours are used for debugging purposes: so that we can see how control works 
  
void keyPressed(){
  if( key == 'a' ) { moveLeft  = true ; fill( 255, 0, 0 ) ; }
  if( key == 'd' ) { moveRight = true ; fill( 0, 0, 255 ) ; }
  if( key == 's' ) {                    fill( 0, 255, 0 ) ; }
}

void keyReleased(){
  if( key == 'a' ) { moveLeft  = false ; fill( 255, 192, 192 ) ; }
  if( key == 'd' ) { moveRight = false ; fill( 192, 192, 255 ) ; }
}