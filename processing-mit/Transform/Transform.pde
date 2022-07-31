// Demonstrates how to use transforms to change the output of a sketch.
// In particular, this sketch demonstrates how to map one value to another,
// specifically the mouse location to a range between 0 and 2 * PI, which
// results in a conversion of the mouse coordinate to a radian angle.

void setup() {
    size(100, 100);
    strokeWeight(8);
}

void draw() {
    background(204);
    // Remaps a value (mouseX) from one range (0 - width) to another (0 - TWO_PI)
    float angle = map(mouseX, 0, width, 0, TWO_PI);

    translate(50, 50);
    rotate(angle);
    line(0, 0, 40, 0);

    // The translate and scale functions can be used to put the origin in the
    // lower-left corner of the screen. Scaling the y-axis by -1.0 causes the
    // y-coordinates t increment in the opposite direction, which could be
    // useful when converting between coordinates from a different system to
    // the coordinate system used by Processing (instead of converting every
    // y-coordinate).
    // translate(0, height);
    // scale(1.0, -1.0);
}
