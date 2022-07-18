float r = 40;
float px = r;
float py = 200;
float vx = 4;
float vy = 5;
// float ax = -9.81;


void setup() {
    size(500, 500);
    stroke(255);
}

void draw() {
    background(0);
    ellipse(px, py, 2 * r, 2 * r);

    px += vx;
    py += vy;

    if (py + r >= height) {
        py = height - r - (py - (height - r));
        vy *= -1;
    }
}