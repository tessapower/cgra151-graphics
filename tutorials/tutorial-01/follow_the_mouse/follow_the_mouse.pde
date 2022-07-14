void setup() {
  size(400, 300);
  rectMode(CENTER);
  // Too slow to react to mouse movement
  // frameRate(5);
  // Nice framerate that reacts to mouse movement
  frameRate(60);
}

void draw() {
  background(0);
  rect(mouseX, mouseY, 40, 40);
}
