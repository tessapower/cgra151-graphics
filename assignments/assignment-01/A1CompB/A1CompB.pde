/// Assignment 1
/// Tessa Power (300633153)
/// A1CompB

//----------------------------------------------------------- WINDOW SETUP --//
size(750, 750);
strokeWeight(1.5);
background(127, 127, 127);

//------------------------------------------------------- RANDOM TRIANGLES --//
final var MIN_DELTA_X = 30;
final var MAX_DELTA_X = 120;
final var MIN_DELTA_Y = 20;
final var MAX_DELTA_Y = 110;
final var NUM_TRIANGLES = 150;

for (var i = 0; i < NUM_TRIANGLES; ++i) {
  // randomly select first vertex somewhere in the window
  var x = random(0, width);
  var y = random(0, height);
  
  // randomly select second vertex a certain distance away from first vertex
  var x2 = x + (random(1) > 0.5 ? 1 : -1) * random(MIN_DELTA_X, MAX_DELTA_X);
  var y2 = y + (random(1) > 0.5 ? 1 : -1) * random(MIN_DELTA_Y, MAX_DELTA_Y);
  
  // randomly select third vertex a certain distance away from second vertex
  var x3 = x2 + (random(1) > 0.5 ? 1 : -1) * random(MIN_DELTA_X, MAX_DELTA_X);
  var y3 = y2 + (random(1) > 0.5 ? 1 : -1) * random(MIN_DELTA_Y, MAX_DELTA_Y);
  
  // draw the triangle
  triangle(x, y, x2, y2, x3, y3);
}
