/* test harness to draw lines using line() and
   supposedly identical lines using my own line function
 */
void setup(){
  size(300,300);
  noLoop(); // call draw() only once
  noSmooth(); // don't draw smooth lines
}

void testLines( int x0, int y0, int x1, int y1 ){
  stroke(255,0,0); // red
  myLine(x0,y0,x1,y1);
  stroke(0,0,255); // blue
  line(x0,y0,x1,y1);
}

void draw(){
  background(255);
  stroke(0);
  for( int i=0;i<100;i+=3){
    // draw about 33 lines of slope between 0 and 1 
    int startx = 10 ;
    int starty = 10+i ;
    float slope = (0.01*i) ;
    int endx = 290 ;
    int endy = (int) (starty+slope*(endx-startx) ) ;
    testLines(startx,starty,endx,endy) ;
  }
}

void myLine( int x0, int y0, int x1, int y1 ){
  /* write your code here */
}