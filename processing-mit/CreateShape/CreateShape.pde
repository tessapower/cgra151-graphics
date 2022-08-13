// This sketch demonstrates how to create and store custom shapes

PShape petal;

void setup() {
    size(300, 300, P3D);
    petal = createShape();
    petal.beginShape();
    petal.noStroke();
    petal.fill(0);
    petal.vertex(90, 39);
    petal.bezierVertex(90, 39, 54,  17, 26, 83);
    petal.bezierVertex(26, 83, 90, 107, 90, 39);
    petal.endShape();
    petal.translate(-50, -50);
}

void draw() {
    background(204);
    shape(petal, 150, 150);
    petal.rotateX(0.01);
}
