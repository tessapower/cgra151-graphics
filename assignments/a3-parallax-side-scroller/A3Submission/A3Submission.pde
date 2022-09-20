Character player;
Background parallax;
Camera camera;
Point playerStartPos;

void setup() {
    // Window Setup
    size(640, 180);
    noSmooth();
    frameRate(24);
    imageMode(CORNER);

    // Game Setup
    camera = new Camera();
    player = new Character();
    player.setStartPosition(new Point(int(width * 0.1), int(height - player.dimension().height - 5)));
    parallax = new Background();
}

void draw() {
    background(255);

    parallax.draw(camera); //<>//
    player.draw(frameCount, camera);
    camera.update(player);
}

void keyPressed() {
    player.handleKeyPress(keyCode);
}

void keyReleased() {
    player.handleKeyRelease(keyCode);
}


// ---------------------------------------------------------------- Global Helper Functions --//

public final int worldToScreenX(Camera c, int x) {
    return (x - c.position().x);
}

public final int worldToScreenX(Camera c, int x, int y, int z) {
    return (x - c.position().x) / z;
}
