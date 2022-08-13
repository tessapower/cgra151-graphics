// This sketch demonstrates how the Ambient function can be used to control
// the way light engages with geometry.

void setup() {
    size(300, 300, P3D);
    noStroke();
}

void draw() {
    background(0);
    lights(); // Default lights
    // The sphere is white by defalt so the ambient light changes its color
    float r = map(mouseX, 0, width, 0, 255);
    ambient(r, r, 126);
    translate(width / 2, height / 2, 0);
    sphere(100);
}
