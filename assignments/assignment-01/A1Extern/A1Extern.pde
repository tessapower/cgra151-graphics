/// Assignment 1
/// Tessa Power (300633153)
/// A1Extern

/// This sketch draws a fractal using triangles that are rotated and
/// drawn slightly smaller each tick.

import java.awt.Dimension;
import java.awt.Point;

//----------------------------------------------------------- FRACTAL VARS --//

// Window Constants
final Dimension windowDim = new Dimension(750, 750);
final Point center = new Point((int)(windowDim.width * 0.5), (int)(windowDim.height * 0.5));

// Rotation Constants
final int maxDegrees = 360;
final int rotation = 2;

// Triangle Limits
final int maxTriangles = 500;
final int sideDecrease = 2;
final int minSize = 1;

// Colors Constants
final int colorStep = 2;
final int opacity = 150;
final int minR = 25;
final int minG = 75;
final int minB = 175;

// We change the colors slightly each time a triangle is drawn, and clamp the
// range of the RGB values. The resulting colors form a gradient that will move
// back and forth in a range of aesthetically pleasing colors from min_ to 256.
int r = minR;
int g = minG;
int b = minB;
// Set whether colors first change in ascending or descending order
boolean rAscending = true;
boolean gAscending = true;
boolean bAscending = true;

// The initial values for the length of a triangle side and its rotation.
int angle = 325;
int barycenter = windowDim.width;

// Lets us wait for the user to click before running
boolean running;

//----------------------------------------------------------- WINDOW SETUP --//

void settings() {
  size(windowDim.width, windowDim.height);
}

void setup() {
  frameRate(60);
  background(255);
}

void draw() {
  // Don't do anything if the user hasn't clicked yet
  if (!running) {
    textSize(32);
    fill(minR, minG, minB);
    text("click me", 100, 100);
    return;
  }

  if (abs(barycenter) <= windowDim.width) {
    stroke(r, g, b, opacity);
    drawRotatedTriangle(center, barycenter, angle);

    // Rotate the triangle
    angle += rotation;
    angle %= maxDegrees;
    // Make it slightly smaller
    barycenter -= sideDecrease;

    // Change color
    cycleColor();
  } else {
    background(255);
    barycenter = windowDim.width;
  }
}

void mouseClicked() {
  running = true;
  background(255);
  noFill();
}

/**
 * Draw an equaliteral triangle, centered at the given <code>origin</code>
 * and rotated <code>thetaDegrees</code>. The <code>barycenter</code>
 * specifies the distance of each vertex from the center of the triangle.
 */
void drawRotatedTriangle(Point origin, int barycenter, int thetaDegrees) {
  // Store current transform
  pushMatrix();
  
  // Move to origin and rotate
  translate(origin.x, origin.y);
  rotate(radians(thetaDegrees));
  
  triangle(-barycenter,  barycenter,
                     0, -barycenter,
            barycenter,  barycenter);

  // Restore previous transform
  popMatrix();
}

/**
 * Cycle the RGB color values within their respective ranges, from min_ to 255.
 * When each color reaches the maximum possible, the color values will move
 * downwards toward their set minimum value, and vice versa.
 */
void cycleColor() {
  if (rAscending) {
    r += colorStep;
    rAscending = r < 256;
  } else {
    r -= colorStep;
    rAscending = r <= minR;
  }
  
  if (gAscending) {
    g += colorStep;
    gAscending = g < 256;
  } else {
    g -= colorStep;
    gAscending = g <= minG;
  }

  if (bAscending) {
    b += colorStep;
    bAscending = b < 256;
  } else {
    b -= colorStep;
    bAscending = b <= minB;
  }
}
