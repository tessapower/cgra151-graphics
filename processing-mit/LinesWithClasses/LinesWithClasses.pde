Diagonals da, db;

void setup() {
    size(100, 100);
    // Inputs: x, y, speed, thickness, gray level
    da = new Diagonals(0, 80, 1, 2, 0);
    db = new Diagonals(0, 55, 2, 6, 255);
}

void draw() {
    background(204);
    da.update();
    db.update();
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
