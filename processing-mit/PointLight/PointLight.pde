// This sketch demonstrates how a Point Light lights up a scene like a light
// bulb in a room

void setup() {
    size(300, 300, P3D);
    noStroke();
}

void draw() {
    background(0);
    pointLight(255, 255, 255, width / 2, mouseY, 0);
    translate(0, height / 2, 0);
    sphere(90);
    translate(width, 0, 0);
    sphere(90);
}
