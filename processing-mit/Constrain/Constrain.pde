// This sketch demonstrates how to use the constrain method to limit numbers
// to a range. This can be used to restrict drawing to parts of the screen.

void setup() {
    size(300, 300);
    noStroke();
}

void draw() {
    background(0);
    // Limits variable mx between 35 and 265
    int mx = constrain(mouseX, 35, 265);
    // Limits variable my between 40 and 260
    int my = constrain(mouseY, 40, 260);

    fill(102);
    rect(20, 25, 260, 250);

    fill(255);
    ellipse(mx, my, 30, 30);
}
