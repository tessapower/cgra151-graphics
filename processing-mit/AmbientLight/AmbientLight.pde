// This sketch demonstrates how Ambient Light changes how objects look

void setup() {
    size(300, 300, P3D);
    noStroke();
}

void draw() {
    background(0);
    // The sphere is white by default so the ambient light changes its color
    float r = map(mouseX, 0, width, 0, 255);
    ambientLight(r, 255, 255);
    translate(width / 2, height / 2, 0);
    sphere(90);
}
