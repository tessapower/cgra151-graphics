/// Assignment 1
/// Tessa Power (300633153)
/// A1CompA

//----------------------------------------------------------- WINDOW SETUP --//

size(750, 750);
strokeWeight(1.5);
background(127, 127, 127);

//------------------------------------------------------------- CONSTANTS --//

final int NUM_ROWS = 25;
final int RECT_HEIGHT = height / NUM_ROWS;
final int RECT_MIN_WIDTH = 1;
final int RECT_MAX_WIDTH = 35;
final int SPACER = 5;

//------------------------------------------------------------- VARIABLES --//

var x = 0;
var y = 0;

for (var row = 0; row < NUM_ROWS; ++row) {
  while (x < width) {
    // Set the width of the rect randomly
    var rectWidth = random(RECT_MIN_WIDTH, RECT_MAX_WIDTH);
    rect(x, y, rectWidth, RECT_HEIGHT);
    // Move along the row
    x += rectWidth + SPACER;
  }
  // Reset x to beginning of row
  x = 0;
  // Move to next row
  y += RECT_HEIGHT;
}
