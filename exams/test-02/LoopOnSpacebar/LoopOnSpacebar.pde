int animationFrame = 0;
PImage[] attack = new PImage[8]; 
PImage characterSpritesheet;
int spriteSize = 56;
boolean attacking = false;

void setup() {
    size(100, 100);
    frameRate(24);
    
    characterSpritesheet = loadImage("attack_r.png");
    for (int i = 0; i < attack.length; i++) {
        attack[i] = characterSpritesheet.get(i * spriteSize, 0, spriteSize, spriteSize);
    }
}

void draw() {
    background(0);
    
    if (attacking) {
        image(attack[animationFrame], 20, 20);
        
        if (!(attacking = ++animationFrame < 8)) {
            animationFrame = 0;
        }
    } else {
        image(attack[0], 20, 20);
    }
}

void keyPressed () {
  if (key == ' ') {
    attacking = true;
  }
}
