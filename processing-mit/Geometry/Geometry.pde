// We can create arbitrary polygons using the beginShape(), vertex(), and
// endShape() functions.

size(350, 300);
noFill();

// Drawing a simple open polygon:
beginShape();
vertex(30, 20);
vertex(85, 20);
vertex(85, 75);
vertex(30, 75);
endShape();

// Drawing a simple closed polygon:
beginShape();
vertex(100, 20);
vertex(155, 20);
vertex(155, 75);
vertex(100, 75);
endShape(CLOSE);


// beginShape():
// Can take parameters to specify how the vertex data should be used, e.g.
// POINTS:
strokeWeight(4);
beginShape(POINTS);
vertex(170, 20);
vertex(225, 20);
vertex(225, 75);
vertex(170, 75);
endShape();

// LINES:
strokeWeight(2);
beginShape(LINES);
vertex(240, 20);
vertex(295, 20);
vertex(295, 75);
vertex(240, 75);
endShape();

// TRIANGLES: Connect each grouping of three vertices as a triangle
strokeWeight(1);
beginShape(TRIANGLES);
vertex(75, 100);
vertex(10, 90);
vertex(75, 120);

vertex(20, 130);
vertex(90, 140);
vertex(35, 155);
endShape();

// TRIANGLE_STRIP: Starting with the third vertex, connect each subsequent
// vertex to the previous two.
beginShape(TRIANGLE_STRIP);
vertex(145, 100);
vertex(80, 90);
vertex(145, 120);

vertex(90, 130);
vertex(160, 140);
vertex(105, 155);
endShape();

// TRIANGLE_FAN: Connect the first vertex to each following group of two
beginShape(TRIANGLE_FAN);
vertex(215, 100);
vertex(275, 130);
vertex(275, 150);
vertex(290, 170);
vertex(215, 100);
endShape();

// QUADS: Connect each grouping of four vertices as an individual quad
// QUAD_STRIP: Connect each grouping of four vertices as a connected group of
// quads. Depending on the order of the vertices, they may be drawn as "bows".
