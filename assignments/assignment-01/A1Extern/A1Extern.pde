/// Assignment 1
/// Tessa Power (300633153)
/// A1Extern

/// This sketch draws a fractal using triangles that are rotated and
/// drawn slightly smaller each tick.

import java.awt.Dimension;
import java.awt.Point;

//----------------------------------------------------------- FRACTAL VARS --//

// Constants
final Dimension windowDim = new Dimension(750, 750);
final Point center = new Point((int)(windowDim.width * 0.5), (int)(windowDim.height * 0.5));

// Rotation
final int maxDegrees = 360;
final int rotation = 2;

// Triangle Limits
final int maxTriangles = 500;
final int sideDecrease = 2;
final int minSize = 1;

// Colors
final int colorStep = 2;
final int maxColor = 256;
final int opacity = 150;
final int minR = 50;
final int minG = 100;
final int minB = 200;

int r = minR;
int g = minG;
int b = minB;
boolean rAscending = true;
boolean gAscending = true;
boolean bAscending = true;

int numTriangles = 0;
int angle = 325;
int side = windowDim.width;

//----------------------------------------------------------- WINDOW SETUP --//

void settings() {
  size(windowDim.width, windowDim.height);
}

void setup() {
  frameRate(45);
  background(255);
  stroke(r, g, b, opacity);
  noFill();
}

void draw() {
  if (++numTriangles < maxTriangles && side > minSize) {
    drawRotatedTriangle(center, side, angle);
    
    // Rotate the triangle
    angle += rotation;
    angle %= maxDegrees;
    // Make it slightly smaller
    side -= sideDecrease;
    
    // Change color
    cycleColor();
    // Set new color
    stroke(r, g, b);
  }
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

  // Undo transforms
  popMatrix();
}

void cycleColor() {
  if (rAscending) {
    r += colorStep;
    rAscending = r < maxColor;
  } else {
    r -= colorStep;
    rAscending = r <= minR;
  }
  
  if (gAscending) {
    g += colorStep;
    gAscending = g < maxColor;
  } else {
    g -= colorStep;
    gAscending = g <= minG;
  }

  if (bAscending) {
    b += colorStep;
    bAscending = b < maxColor;
  } else {
    b -= colorStep;
    bAscending = b <= minB;
  }
}
