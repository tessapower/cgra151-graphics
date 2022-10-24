// This sketch demonstrates how to use the random function to create a randomly
// generated maze like structure

size(300, 300);
int u = 10;
float threshold = 0.5;
noSmooth();

for (int y = 0; y < 300; y += u) {
    for (int x = 0; x < 300; x += u) {
        float r = random(1.0);
        if (r > threshold) {
            line(x, y, x + u, y + u);
        } else {
            line(x, y + u, x + u, y);
        }
    }
}
