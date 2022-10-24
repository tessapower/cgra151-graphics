// This sketch demonstrates how to use the second(), minute(), and hour()
// functions to create a simple digital clock.

PFont font;

void setup() {
    size(300, 300);
    font = createFont("Rec Mono Linear", 48);
    textFont(font);
    textAlign(CENTER);
}

void draw() {
    background(0);


    int s = second();
    int m = minute();
    int h = hour();

    String t = nf(h, 2) + ":" + nf(m, 2) + ":" + nf(s, 2);
    text(t, width / 2, height / 2);
}
