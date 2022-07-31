// Contours give you the ability to cut wholes in shapes while drawing with
// beginShape() and endShape() by using the functions beginContour() and
// endContour().

size(100, 100);
background(0);
stroke(255);
strokeWeight(2);
line(33, 0, 85, 100);
noStroke();
fill(102);

// First specify the vertices for the exterior shape in clockwise order, then
// for internal shapes specify the vertices in anti-clockwise order.
beginShape();

// Outer triangle
vertex(5, 12);
vertex(95, 12);
vertex(50, 92);

// Inner triangle
beginContour();
vertex(33, 50);
vertex(66, 50);
vertex(50, 20);
endContour();

endShape();
