// This sketch demonstrates how the concentration of a Spot Light affects the
// objects in a scene

void setup() {
    size(300, 300, P3D);
    noStroke();
}

void draw() {
    background(0);
    float angle = map(mouseY, 0, height, PI / 8, PI / 2);
    float concentration = map(mouseX, 0, width, 1, 20);
    spotLight(255,        255, 255,     // Color
                0, height / 2,   0,     // Position
                1,          0,   0,     // Direction
                angle, concentration);
    translate(width, height / 2, -10);
    sphere(150);
}
