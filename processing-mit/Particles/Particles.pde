import processing.sound.*;

int numParticles = 800;
GenParticle[] particles = new GenParticle[numParticles];
SoundFile waterSound;
SoundFile fairyFountain;

PImage waterfall;

void setup() {
    size(300, 300);
    noStroke();

    waterfall = loadImage("waterfall.png");

    fairyFountain = new SoundFile(this, "fairy-fountain.wav");
    fairyFountain.amp(0.5);

    waterSound = new SoundFile(this, "water.wav");
    waterSound.amp(0.2);

    for (int i = 0; i < numParticles; i++) {
        PVector velocity = new PVector(random(-1, 1), -i);
        PVector pos = new PVector(width / 2, -5);
        float radius = 5.0;

        particles[i] = new GenParticle(pos, velocity, radius);
    }

    fairyFountain.loop();
    waterSound.loop();
}

void draw() {
    image(waterfall, 0, 0, width, height + 80);
    fill(255, 10);
    rect(0, 0, width, height);

    fill(152, 210, 235, 60);

    for (var p : particles) {
        p.update();
        p.regenerate();
        p.display();
    }
}
