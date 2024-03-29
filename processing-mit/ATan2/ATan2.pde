// This sketch demonstrates how to calculate the angle between two points.

int x = 50;
int y1 = 33;
int y2 = 66;

void setup() {
  size(100, 100);
  noStroke();
}

void draw() {
    background(0);

    // Top triangle
    float angle = atan2(mouseY - y1, mouseX - x);
    pushMatrix();
    translate(x, y1);
    rotate(angle);
    triangle(-20, -8, 20, 0, -20, 8);
    popMatrix();

    // Bottom triangle
    angle = atan2(mouseY - y2, mouseX - x);
    pushMatrix();
    translate(x, y2);
    rotate(angle);
    triangle(-20, -8, 20, 0, -20, 8);
    popMatrix();
}
