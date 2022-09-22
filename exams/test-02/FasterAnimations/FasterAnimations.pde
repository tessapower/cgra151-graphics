int animationFrame = 0;

int characterSize = 56;
PImage idleSheet;
PImage[] idle;

void setup() {
    size(100, 100);
    noSmooth();
    imageMode(CORNER);
    frameRate(24);
    
    idleSheet = loadImage("idle.png");
    idle = new PImage[6];

    for (int i=0; i<idle.length; i++) {
        idle[i] = idleSheet.get(i * characterSize, 0, characterSize, characterSize);
    }
}

void draw(){
    animationFrame++;
    image(idle[animationFrame % idle.length], 20, 20);
}

void keyPressed (){
    animationFrame++;
    if (key == 'd') {
        println("d Pressed");
    }
}
