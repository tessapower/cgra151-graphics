Game game;

void setup() {
    size(720, 720);
    game = new Game();
}

void draw() {
    game.update(frameCount);
}

void keyPressed() {
    game.handleKeyPressed(keyCode);
}

void keyReleased() {
    game.handleKeyReleased(keyCode);
}
