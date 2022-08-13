// This sketch demonstrates how to work with shapes loaded from an .svg or .obj
PShape pot;

void setup() {
    size(300, 300, P3D);
    // Load from a file; the file must be located in a dir called 'data' in the
    // root directory
    pot = loadShape("teapot.obj");
    // Every shape can be transformed individually as opposed to using global
    // transforms
    pot.scale(36);
}

void draw() {
    background(0);
    lights();
    translate(150, 150);
    // Transforms applied to shapes are cumulative as opposed to reset each tick
    pot.rotateX(0.05);
    shape(pot, 0, 0);
}
