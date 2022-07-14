size(200, 100);

background(255);
fill(0, 150, 200);
noStroke();

// Positions of the vertices of a triangle:
//       x1, y1, x2, y2, x3, y3
triangle(100, 20, 180, 50, 130, 80);

// Create a polygon by specifying the vertices
// between calls to beginShape() and endShape()
beginShape();
vertex(10, 20);
vertex(40, 10);
vertex(90, 50);
vertex(80, 60);
vertex(40, 80);
vertex(20, 70);
// CLOSE joins the last vertex to the first to create a closed shape
endShape(CLOSE);
