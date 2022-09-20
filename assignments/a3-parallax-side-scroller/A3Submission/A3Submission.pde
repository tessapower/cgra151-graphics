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
    var screenDim = new Dimension(width, height);
    camera = new Camera(screenDim);
    player = new Character();
    player.setStartPosition(new Point(width / 5, int(height - player.dimension().height - 5)));
    parallax = new Background(screenDim);
}

void draw() {
    background(255);

    parallax.draw(camera); //<>//
    player.draw(frameCount, camera);
    camera.update(player.position());
}

void keyPressed() {
    player.handleKeyPress(keyCode);
}

void keyReleased() {
    player.handleKeyRelease(keyCode);
}
