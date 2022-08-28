int radius = 100;
int delta = radius / 10;
int centerX, centerY;

void setup() {
    size(300, 300);
    centerX = width / 2;
    centerY = height / 2;
}

void draw() {
    background(255);
    ellipse(centerX, centerY, 2 * radius, 2 * radius);
    for (int i = 0; i < 10; i++) {
        var x = i * delta;
        var y = sqrt(sq(radius) - sq(x));
        line(centerX - x, centerY - y, centerX - x, centerY + y);
        pushMatrix();
        translate(centerX, centerY);
        rotate(-HALF_PI);
        translate(-centerX, -centerY);
        line(centerX - x, centerY - y, centerX - x, centerY + y);
        popMatrix();
    }
}
