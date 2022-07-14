int r = 0;
int g = 0;
int b = 0;

int redR = 250;
int redG = 50;
int redB = 0;

int blueR = 0;
int blueG = 100;
int blueB = 230;

void setup() {
  size(400, 300);
  frameRate(60);
  setColor(blueR, blueG, blueB);
}

void draw() {
  background(0);
  fill(r, g, b);
  ellipse(mouseX, mouseY, 40, 40);
}

void mousePressed() {
  setColor(250, 50, 0);
}

void mouseReleased() {
  setColor(0, 100, 230);
}

void setColor(int red, int green, int blue) {
  r = red;
  g = green;
  b = blue;
}
