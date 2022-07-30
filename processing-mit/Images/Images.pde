PImage waves;
PImage forest;

int size = 200;
int y = 0;
int x = 0;
int col = 0;

void setup() {
    size(800, 400);
    // Load an image into a variable
    waves = loadImage("waves.jpg");
    forest = loadImage("forest.jpg");
}

void draw() {
    // Draw an image at a set position (don't include width or height to draw at
    // actual size)
    image(waves, x + size * col, y, size, size);
    image(forest, x + size * col, y + size, size, size);
    filter(BLUR, 3); // Affects only what has already been drawn

    col++;
    image(waves, x + size * col, y, size, size); // Normal Images
    image(forest, x + size * col, y + size, size, size);

    col++;
    tint(220, 214, 41); // Blue Tint
    image(waves, x + size * col, y, size, size);
    image(forest, x + size * col, y + size, size, size);

    col++;
    tint(255, 102, 0, 204); // Orange Tint with Alpha
    image(waves, x + size * col, y, size, size);
    image(forest, x + size * col, y + size, size, size);
    noLoop();
}
