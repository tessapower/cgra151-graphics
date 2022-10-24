// This sketch demonstrates how to create a kinetic texture using the
// noise() function

float inc = 0.06;
int density = 2;
float zNoise = 0.0;

void setup() {
  size(300, 300);
  noStroke();
  frameRate(10);
  noCursor();
}

void draw() {
    background(255);
    float xNoise = 0.0;
    float yNoise = 0.0;

    for (int y = 0; y < height; y += density) {
        for (int x = 0; x < width; x += density) {
            if (dist(y, x, mouseX, mouseY) > 25) {
                float n = noise(xNoise, yNoise, zNoise) * 255;
                fill(n);
                rect(y, x, density, density);
            }
            xNoise += inc;
        }

        xNoise = 0.0;
        yNoise += inc;
    }

    zNoise += inc;
}
