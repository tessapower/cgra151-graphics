// draw some lines with random start and end points
size(300,300);
background(255);
stroke(0);
for( int i=0;i<100;i++){
  line(random(10,290),random(10,290),
       random(10,290),random(10,290));
}