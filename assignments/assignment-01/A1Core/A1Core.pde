/// Assignment 1
/// Tessa Power (300633153)
/// A1Core

//----------------------------------------------------------- WINDOW SETUP --//
size(400, 400);
background(255);

//------------------------------------------------------------ BLUE SQUARE --//
fill(0, 0, 255);
rect(25, 25, 150, 75);

//----------------------------------------------------------- YELLOW ARROW --//
fill(255, 255, 0);
beginShape();
vertex(225, 50);
vertex(260, 50);
vertex(260, 20);
vertex(325, 75);
vertex(260, 130);
vertex(260, 100);
vertex(225, 100);
endShape(CLOSE);

//---------------------------------------------------------- GREEN ELLIPSE --//
fill(0, 255, 0);
ellipseMode(CORNER);
ellipse(25, 150, 150, 75);

//----------------------------------------------------------  RED TRIANGLE --//
fill(255, 0, 0);
triangle(25, 300, 100, 250, 175, 325);

//------------------------------------------------------------------ LINES --//

// Line variables
var lineXStart = 220;
var lineYStart = 200;
var lineXEnd = 270;
var lineYEnd = 375;
var spacer = 40;
var strokeWeight = 5;
var strokeWeightMultiplier = 1.75;

// Orange Line
strokeWeight(strokeWeight);
stroke(255, 128, 0);
line(lineXStart, lineYStart, lineXEnd, lineYEnd);

// Green Line
lineXStart += spacer;
lineXEnd += spacer;
strokeWeight *= strokeWeightMultiplier;

strokeWeight(strokeWeight);
stroke(0, 255, 128);
line(lineXStart, lineYStart, lineXEnd, lineYEnd);

// Purple Line
lineXStart += spacer;
lineXEnd += spacer;
strokeWeight *= strokeWeightMultiplier;

strokeWeight(strokeWeight);
stroke(128, 0, 255);
line(lineXStart, lineYStart, lineXEnd, lineYEnd);
