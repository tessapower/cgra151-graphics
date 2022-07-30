void setup(){
  size(500,500);
//  noStroke(); // add in stage 3
}

int total = 100; 
int x[] = new int[total];
int y[] = new int[total];
int current = 0;

void draw(){
  background(0);
  int k = 0;
  for(int i = 0; i < total; i++){
    if (current + i >= total)
      k = current + i - total;
    else
      k = current + i;
    
    ellipse(x[k], y[k], 50, 50);
    
  }
}

void mouseMoved(){
  x[current] = mouseX;
  y[current] = mouseY;
  current++;
  if(current == total)
      current = 0;
}
