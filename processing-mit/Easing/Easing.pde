// This sketch demonstrates how to use the interpolation technique to smooth out
// movement of an object between two points.

float x = 0.0;
float y = 0.0;
float easing = 0.05; // Must be between 0.0 and 1.0

void setup() {
    size(300, 300);
    noStroke();
}

void draw() {
    background(0);

    float targetX = mouseX;
    float targetY = mouseY;

    if (abs(x - targetX) > 1.0) {
        x += (targetX - x) * easing;
    }

    if (abs(y - targetY) > 1.0) {
        y += (targetY - y) * easing;
    }

    fill(153);
    ellipse(mouseX, mouseY, 20, 20);

    fill(255);
    ellipse(x, y, 40, 40);
}
