size(400, 300);
background(255);
noStroke();

for (var i = 0; i < 100; ++i) {
  // Randomly set fill color
 fill(random(100, 255), random(100, 255), random(100, 255));
 
 // Randomly set width and height
 var rWidth = random(10, 50);
 var rHeight = random(10, 50);
 
 rect(random(0, width - rWidth), random(0, height - rHeight), rWidth, rHeight);
 
 println("width = " + rWidth + ", height = " + rHeight);
}
