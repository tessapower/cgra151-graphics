int radius = 50;
int centerX, centerY;

void setup() {
    size(300, 300);
    noFill();
    centerX = width / 2;
    centerY = height / 2;
}

void draw() {
    background(255);
    for (int i = 0; i < 4; i++) {
        pushMatrix();
        translate(centerX, centerY);
        rotate(i * HALF_PI);
        ellipse(0, -radius, 2 * radius, 2 * radius);
        beginShape();
        vertex(-radius, -radius);
        vertex(0, -2 * radius);
        vertex(radius, -radius);
        endShape(CLOSE);
        popMatrix();
    }
}
