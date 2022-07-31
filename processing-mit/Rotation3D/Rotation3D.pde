// This sketch demonstrates rotation of shapes in 3D

void setup() {
    size(400, 400, P3D);
    noStroke();
}

void draw() {
    lights();
    background(0);

    translate(width / 2, height / 2, -height);

    float rz = map(mouseY, 0, height, 0, PI);
    float ry = map(mouseX, 0, width, 0, HALF_PI);
    rotateZ(rz);
    rotateY(ry);

    for (var y = -1; y <= 1; ++y) {
        for (var x = -1; x <= 1; ++x) {
            for (var z = -1; z <= 1; ++z) {
                pushMatrix();
                translate(200 * x, 200 * y, 200 * z);
                box(60);
                popMatrix();
            }
        }
    }
}
