// 3D Shapes

void setup() {
    size(400, 400, P3D);
    background(0);
    noStroke();
}

void draw() {
    lights();

    // BOX:
    translate(0, height / 2, height / -2);
    fill(153);
    box(240, 320, 240);

    // SPHERE:
    translate(width, 0, 0);
    fill(255);
    sphere(200);
}
