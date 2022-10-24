// This sketch demonstrates how to use simulate mechanical motion using the
// sin and cos functions

float angle = 0.0;
float speed = 0.05;
float radius = 30.0;
float sx = 2.0;
float sy = 4.0;

void setup() {
    size(100, 100);
    noStroke();
}

void draw() {
    // Create a blurred motion effect with transparency
    fill(0, 4);
    rect(0, 0, width, height);

    angle += speed; // increment angle

    // Set the position of the small circle based on new values from sin and cos
    float sinVal = sin(angle);
    float cosVal = cos(angle);

    float x = 50 + radius * cosVal;
    float y = 50 + radius * sinVal;

    // Draw the small circle
    fill(255);
    ellipse(x, y, 2, 2);

    // Set the position of the large circles based on the small circle's position
    x = x + cos(angle * sx) * radius / sx;
    y = y + sin(angle * sy) * radius / sy;
    ellipse(x, y, 6, 6);
}
