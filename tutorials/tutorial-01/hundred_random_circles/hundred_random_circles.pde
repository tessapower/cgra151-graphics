size(400, 300);
background(255);
noStroke();

for (var i = 0; i < 100; ++i) {
  // Randomly set fill color
 fill(random(100, 255), random(100, 255), random(100, 255));
 
 // Randomly set width and height
 var eWidth = random(10, 50);
 var eHeight = random(10, 50);
 
 // Bound the position of the ellipse to the visual part of the window
 var eXMin = eWidth * 0.5;
 var eXMax = width - eWidth * 0.5;
 var eYMin = eWidth * 0.5;
 var eYMax = height - eHeight * 0.5;
 
 ellipse(random(eXMin, eXMax), 
         random(eYMin, eYMax),
         eWidth,
         eHeight);
 
 println("width = " + eWidth + ", height = " + eHeight);
}
