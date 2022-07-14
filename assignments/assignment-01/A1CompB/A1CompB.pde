/// Assignment 1
/// Tessa Power (300633153)
/// A1CompB

//----------------------------------------------------------- WINDOW SETUP --//
size(750, 750);
strokeWeight(1.5);
background(127, 127, 127);

//------------------------------------------------------- RANDOM TRIANGLES --//

final var minDeltaX = 10;
final var maxDeltaX = 100;
final var minDeltaY = 10;
final var maxDeltaY = 100;
final var numTriangles = random(150, 1000);

for (var i = 0; i < numTriangles; ++i) {
  // randomly select first vertex
  var x = random(0, width);
  var y = random(0, height);
  
  // randomly select second vertex a certain distance away
  var randomDeltaX = (random(1) > 0.5 ? -1 : 1) * random(minDeltaX, maxDeltaX);
  var x2 = random(x, randomDeltaX);
  var randomDeltaY = (random(1) > 0.5 ? -1 : 1) * random(minDeltaY, maxDeltaY);
  var y2 = random(y, randomDeltaY);
  
  // randomly select third vertex a certain distance away
  randomDeltaX = (random(1) > 0.5 ? -1 : 1) * random(minDeltaX, maxDeltaX);
  var x3 = random(x2, randomDeltaX);
  randomDeltaY = (random(1) > 0.5 ? -1 : 1) * random(minDeltaY, maxDeltaY);
  var y3 = random(y2, randomDeltaY);
  
  // draw triangle
  triangle(x, y, x2, y2, x3, y3);
  println("" + x + ", " + y + ", "  + x2 + ", " + y2 + ", " + x3 + ", " + y3);
}
