// This sketch demonstrates how to use the second(), minute(), and hour()
// functions.

void setup() {
  size(300, 300);
  noSmooth();
  stroke(255);
}

void draw() {
    background(0);
    float s = map(second(), 0, 59, 0, height - 1);
    float m = map(minute(), 0, 59, 0, height - 1);
    float h = map(hour(), 0, 23, 0, height - 1);

    line(s, 0, s, 100);
    line (m, width / 3, m, 200);
    line (h, width * 2 / 3, h, 300);
}
