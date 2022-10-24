// The dist() function can be used to calculate the distance between two points

float maxDistance;

void setup() {
  size(300, 300);
  noStroke();
  fill(0);
  maxDistance = dist(0, 0, width, height);

}

void draw() {
    background(204);
    for (int i = 0; i <= width; i+= 20) {
        for (int j = 0; j <= height; j += 20) {
            var mouseDist = dist(mouseX, mouseY, i, j);
            var diameter = (mouseDist / maxDistance) * 66.0;
            ellipse(i, j, diameter, diameter);
        }
    }
}
