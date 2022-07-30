void setup(){
  size(500,500);
  frameRate(60);
}

float r=40 ;
float px=r, py=200 ;
float vx=4, vy=5 ;
float ax=0, ay=1 ;

void draw(){
    background(0) ;
    stroke(255);
//    line(0,400-r,width,400-r);
    ellipse(px,py,2*r,2*r) ;
//    vx+=ax;
 //   vy+=ay;
    px+=vx;
    py+=vy;
    
    
    if( py > height-r ) { 
      py = height-r - (py-(height-r)) ; 
      vy*=-1 ; 
     }
     
}
