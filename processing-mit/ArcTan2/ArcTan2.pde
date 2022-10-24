// This sketch demonstrates how to use the atan2 function to calculate the angle
// between any point and the coordinate (0, 0);

void setup() {
  size(200, 200);
  fill(0);
}

void draw() {
    float angle = atan2(mouseY, mouseX);
    float deg = degrees(angle);
    background(204);
    text(int(deg), 50, 50);
    ellipse(mouseX, mouseY, 8, 8);
    rotate(angle);
    line(0, 0, 300, 0);
}
