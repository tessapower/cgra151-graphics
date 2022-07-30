
float r = 40;
float px = r, py = 200;
float vx = 4, vy = 0;
float ax = 0, ay = 1;

void setup(){
  size(500,500);
}

void draw(){
  background(0);
  stroke(255);
  ellipse(px, py, 2*r, 2*r);
  
  
  vx = vx + ax;
  vy = vy + ay;
  px = px + vx; // px += vx
  py = py + vy;
  
  if(py > height - r)
  {
    py = height-r-(py-(height - r));
    vy = -1 * vy;
  }
  if( py < r )        
  {
      py = r - (py-r) ;                
      vy*=-1 ; 
  }
  if( px > width-r )  
  { 
      px = width-r  - (px-(width-r)) ;  
      vx*=-1 ; 
  }
  if( px < r )        
  { 
      px = r - (px-r) ;                 
      vx*=-1 ; 
  }

}

void mousePressed()
{
  px = mouseX;
  py = mouseY;
  vx = 4;
  vy = 0;
}
