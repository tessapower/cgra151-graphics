/// Assignment 2
/// Tessa Power (300633153)
/// A2Extern

/// This sketch demonstrates how a custom line drawing algorithm based on
/// Bresenham's midpoint line drawing algorithm compares to the built-in line()
/// function from Processing.

final color CUSTOM = #048A81;

void setup() {
    size(500, 500);
    frameRate(60);
    noSmooth(); // Make sure to turn off anti-aliasing so we can see raw pixels
}

void draw() {
    background(255);
    stroke(CUSTOM);
    midpointLine(0, 1, 6, 3);
    noLoop();
}

//----------------------------------------- MIDPOINT LINE DRAWING ALGORITHM --//

void midpointLine(int x0, int y0, int x1, int y1) {
    int stepX = 1;
    int stepY = 1;
    int dx = x1 - x0;
    int dy = y1 - y0;

    // Adjust step direction for negative slope in x-direction
    if (dx < 0) {
        dx *= -1;
        stepX *= -1;
    }

    // Adjust step direction for negative slope in y-direction
    if (dy < 0) {
        dy *= -1;
        stepY *= -1;
    }

    // dx and dy are now 2dx and 2dy respectively
    dx <<= 1;
    dy <<= 1;
    int x = round(x0);
    int y = y0;

    // Choose whether to increment by x or y.
    // We'll use y to handle slopes greater than 1 or less than -1
    if (dx > dy) {
        // Calculate fractional portion that we need to move by
        int fraction = dy - (dx >> 1);
        while (x != x1) {
            println("(" + x + ", " + y + ")");
            point(x, y);
            x += stepX;

            if (fraction >= 0) {
                y += stepY;
                fraction -= dx;
            }

            fraction += dy;
        }
    } else {
        int fraction = dx - (dy >> 1);
        while (y != y1) {
            println("(" + x + ", " + y + ")");
            point(x, y);

            if (fraction >= 0) {
                x += stepX;
                fraction -= dy;
            }

            y += stepY;
            fraction += dx;
        }
    }

    println("(" + x + ", " + y + ")");
    point(x, y);
}
