/// Assignment 2
/// Tessa Power (300633153)
/// A2Extern

/// This sketch demonstrates how a custom DDA (?) line drawing algorithm
/// compares to the built-in line drawing function from Processing.

final color CUSTOM = #048A81;
final color BUILTIN = #F49F0A;

int x0 = 0;
int y0 = 0;
int x1 = 0;
int y1 = 0;
int dx = 10;
int dy = 10;
boolean drawCustomFirst = false;

void setup() {
    size(500, 500);
    textSize(16.0);
    // Make sure to turn off anti-aliasing
    noSmooth();
}

void draw() {
    background(255);

    drawLabels();
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
    fill(CUSTOM);
    textAlign(LEFT, BOTTOM);
    text("Midpoint Line Drawing Algorithm", 0, 0, width, height);

    fill(BUILTIN);
    textAlign(RIGHT, BOTTOM);
    text("Built-in Line Drawing Algorithm", 0, 0, width, height);
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
    // Determine quadrant

    float a = -(y1 - y0);
    float b = x1 - x0;
    float c = x0 * y1 - x1 * y0;
    int x = round(x0);
    int y = round((-a * x - c) / b);
    float k = a * (x + 1) + b * (y + 0.5) + c;

    int end = round(x1);

    while (x <= end) {
        point(x, y);

        // TODO: Draw other octants
        if (k > 0) {
            k += a;
        } else {
            k += a + b;
            y += 1;
        }

        x += 1;
    }
}
