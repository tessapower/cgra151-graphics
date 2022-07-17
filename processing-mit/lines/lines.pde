int x = 5;
int y = 60;

void setup() {
    size(100, 100);
}

void draw() {
    background(204);
    diagonals(x, y);
    if (++x > 100) {
        x = -40;
    }
}

void diagonals(int x, int y) {
    line(x,      y, x + 20, y - 40);
    line(x + 10, y, x + 30, y - 40);
    line(x + 20, y, x + 40, y - 40);
}
