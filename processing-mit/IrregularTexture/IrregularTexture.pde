// This sketch demonstrates how to use a texture on an irregular object

PImage tex;

void setup() {
    size(300, 300, P3D);
    tex = loadImage("waves.jpg");
    noStroke();
}

void draw() {
    background(0);
    translate(0, 0, -height / 4);
    float ry = map(mouseX, 0, width, 0, TWO_PI);
    rotateY(ry);
    beginShape();
    texture(tex);
    vertex(  0,   6, 0,   0,  12);
    vertex(300,  45, 0, 200,  90);
    vertex(300, 240, 0, 200, 160);
    vertex(  0,  44, 0,   0,  88);
    endShape();
}
