Game game;

// This is the main entrypoint for the game!
void setup() {
    size(720, 720);
    game = new Game();
    noSmooth();  // We turn this off so the final output is pixelated/retro-looking
}

void draw() {
    game.update();
}

void keyPressed() {
    game.handleKeyPressed(keyCode);
}

void keyReleased() {
    game.handleKeyReleased(keyCode);
}
