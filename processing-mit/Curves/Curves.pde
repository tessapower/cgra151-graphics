// curveVertex() and bezierVertex() can be used to draw curves between vertices.
// These functions can only be used combined with startShape() and endShape()
// when beginShape() has no parameter.

size(200, 200);

// curveVertex():
// The first and last calls to this function within beginShape() and endShape()
// act as control points, setting the curvature for the beginning and end of
// the line. The curvature for each segment of the curve is calculated from each
// pair of points, so there must be at least four to draw a segment.

noFill();
beginShape();
curveVertex(20, 80);
curveVertex(20, 40);
curveVertex(30, 30);
curveVertex(40, 80);
curveVertex(80, 80);
endShape();

// bezierVertex():
// Each bezierVertex() defines the position of two control points, followed by one
// anchor point. Before the first time bezierVertex() is used, there must be a
// point defined by vertex().

beginShape();
vertex(62, 20);
bezierVertex(110, 10, 110, 85, 60, 85);
endShape();

// Long continuous curves can be made by adding more calls to bezierVertex()
beginShape();
vertex(95, 110);
bezierVertex(100, 75, 150, 85, 120, 115);
bezierVertex(85, 150, 125, 185, 150, 150);
endShape();
