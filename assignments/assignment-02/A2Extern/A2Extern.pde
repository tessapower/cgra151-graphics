/// Assignment 2
/// Tessa Power (300633153)
/// A2Extern

/// This sketch demonstrates how a custom line drawing algorithm based on
/// Bresenham's midpoint line drawing algorithm compares to the built-in line()
/// function from Processing.

final color CUSTOM = #048A81;
final color BUILTIN = #F49F0A;

int x0 = 0;
int y0 = 0;
int x1 = 0;
int y1 = 0;
boolean drawCustomFirst = false;

void setup() {
    size(500, 500);
    frameRate(60);
    textSize(16.0);
    noSmooth(); // Make sure to turn off anti-aliasing so we can see raw pixels
}

void draw() {
    background(255);

    drawLabels();
    // The drawing order changes if the user types enter. By drawing on top of
    // eachother, we can compare how the algorithm performs and see if there
    // are any off-by-one errors.
    if (drawCustomFirst) {
        drawCustomLine();
        drawBuiltInLine();
    } else {
        drawBuiltInLine();
        drawCustomLine();
    }
}

// -------------------------------------------------------- DRAWING HELPERS --//

void drawLabels() {
    fill(0);
    textAlign(CENTER, TOP);
    text("Click and drag to draw a line. Press [ Enter ] to change drawing order.", 0, 0, width, height);

    fill(CUSTOM);
    textAlign(LEFT, BOTTOM);
    text("Midpoint Line Drawing Algorithm", 8, 0, width, height);

    fill(BUILTIN);
    textAlign(RIGHT, BOTTOM);
    text("Built-in Line Drawing Algorithm", -8, 0, width, height);
}

void drawBuiltInLine() {
    stroke(BUILTIN);
    line(x0, y0, x1, y1);
}

void drawCustomLine() {
    stroke(CUSTOM);
    // Don't draw anything unless points are min distance away from eachother.
    if (abs(x0 - x1) > 0 || abs(y0 - y1) > 0) {
        midpointLine(x0, y0, x1, y1);
    }
}

//------------------------------------------------------------ MOUSE EVENTS --//

void mouseMoved() {
    x0 = x1 = mouseX;
    y0 = y1 = mouseY;
}

void mouseDragged() {
    x1 = mouseX;
    y1 = mouseY;
}

void mouseReleased() {
    x0 = x1 = mouseX;
    y0 = y1 = mouseY;
}

//--------------------------------------------------------- KEYBOARD EVENTS --//

void keyTyped() {
    if (key == ENTER || key == RETURN) {
        drawCustomFirst = !drawCustomFirst;
    }
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
            point(x, y);

            if (fraction >= 0) {
                x += stepX;
                fraction -= dy;
            }

            y += stepY;
            fraction += dx;
        }
    }
}
