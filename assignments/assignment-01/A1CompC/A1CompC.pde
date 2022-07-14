/// Assignment 1
/// Tessa Power (300633153)
/// A1CompC

import java.awt.Dimension;

//----------------------------------------------------------------- COLORS --//

// Constants
final color COLOR_PRESSED = color(250, 50, 0);       // A more pleasing red
final color COLOR_RELEASED = color(0, 100, 230);     // A nice blue
final color COLOR_BACKGROUND = color(127, 127, 127); // A boring old grey

//----------------------------------------------------------- WINDOW SETUP --//

final Dimension WINDOW_DIMENSION = new Dimension(750, 750);
final int FRAMERATE = 60;

void settings() {
  size(WINDOW_DIMENSION.width, WINDOW_DIMENSION.height);
}

void setup() {
  frameRate(FRAMERATE);
  fill(COLOR_RELEASED);
}

//------------------------------------------------------------------- DRAW --//

final int SIZE = 80;

void draw() {
  background(COLOR_BACKGROUND);
  ellipse(mouseX, mouseY, SIZE, SIZE);
}

//----------------------------------------------------------- MOUSE EVENTS --//

void mousePressed() {
  fill(COLOR_PRESSED);
}

void mouseReleased() {
  fill(COLOR_RELEASED);
}
