// This sketch demonstrates how to use a texture on a simple object

PImage tex;

void setup() {
    size(300, 300, P3D);
    tex = loadImage("waves.jpg");
    noStroke();
    // Defines the mappping coordinates for the texture
    // Default: IMAGE
    textureMode(NORMAL);
}

void draw() {
    background(0);
    translate(0, 0, -height / 4);
    float ry = map(mouseX, 0, width, 0, TWO_PI);
    rotateY(ry);
    beginShape();
    texture(tex);
    vertex(  0,   0, 0, 0, 0);
    vertex(300,   0, 0, 1, 0);
    vertex(300, 300, 0, 1, 1);
    vertex(  0, 300, 0, 0, 1);
    endShape();
}
