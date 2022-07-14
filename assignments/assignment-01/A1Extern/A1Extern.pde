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

// TODO: document that the creates a gradient using a spread of nice colors
int r = minR;
int g = minG;
int b = minB;
boolean rAscending = true;
boolean gAscending = true;
boolean bAscending = true;

int numTriangles = 0;
int angle = 325;
int side = windowDim.width;

// Lets us wait for the user to click before running
boolean running;

//----------------------------------------------------------- WINDOW SETUP --//

void settings() {
  size(windowDim.width, windowDim.height);
}

void setup() {
  // TODO: change this back to 45;
  frameRate(120);
  background(255);
  noFill();
}

void draw() {
  // Don't do anything if the user hasn't clicked yet
  if (!running) {
    return;
  }

  if (abs(side) <= windowDim.width) {
    stroke(r, g, b, opacity);
    drawRotatedTriangle(center, side, angle);

    // Rotate the triangle
    angle += rotation;
    angle %= maxDegrees;
    // Make it slightly smaller
    side -= sideDecrease;

    // Change color
    cycleColor();
  } else {
    background(255);
    side = windowDim.width;
  }
}

void mouseClicked() {
  running = true;
}

void drawRotatedTriangle(Point origin, int side, int thetaDegrees) {
  // Store current transform
  pushMatrix();
  
  // Move to origin and rotate
  translate(origin.x, origin.y);
  rotate(radians(thetaDegrees));
  
  triangle(-side,  side,
               0, -side,
            side,  side);

  // Restore previous transform
  popMatrix();
}

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
