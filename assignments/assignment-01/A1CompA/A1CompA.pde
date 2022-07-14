/// Assignment 1
/// Tessa Power (300633153)
/// A1CompA

//----------------------------------------------------------- WINDOW SETUP --//
size(750, 750);
strokeWeight(1.5);
background(127, 127, 127);

//------------------------------------------------------------- VARIABLES --//
var numRows = 25;
var rectHeight = height / numRows;
var rectMinWidth = 1;
var rectMaxWidth = 35;
var spacer = 5;
var x = 0;
var y = 0;

for (var row = 0; row < numRows; ++row) {
  while (x < width) {
    // Set the width of the rect randomly
    var rectWidth = random(rectMinWidth, rectMaxWidth);
    rect(x, y, rectWidth, rectHeight);
    // Move along the row
    x += rectWidth + spacer;
  }
  // Reset x to beginning of row
  x = 0;
  // Move to next row
  y += rectHeight;
}
