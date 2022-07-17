final int NUM_DIAGONALS = 20;
Diagonals[] diagonals = new Diagonals[20];

void setup() {
    size(100, 100);
    // Inputs: x, y, speed, thickness, gray level
    for (var i = 0; i < NUM_DIAGONALS; ++i) {
        diagonals[i] = new Diagonals(i * 5, 12 + i * 6, 1, 1, 0);
    }
}

void draw() {
    background(204);
    for (var i = 0; i < NUM_DIAGONALS; ++i) {
        diagonals[i].update();
    }
}

class Diagonals {
    private int x;
    private int y;
    private int speed;
    private int thickness;
    private int grayLevel;

    public Diagonals(int x, int y, int speed, int thickness, int grayLevel) {
        this.x = x;
        this.y = y;
        this.speed = speed;
        this.thickness = thickness;
        this.grayLevel = grayLevel;
    }

    public void update() {
        strokeWeight(thickness);
        stroke(grayLevel);
        line(x,      y, x + 20, y - 40);
        line(x + 10, y, x + 30, y - 40);
        line(x + 20, y, x + 40, y - 40);
        if (++x > 100) {
            x = -100;
        }
    }
}
