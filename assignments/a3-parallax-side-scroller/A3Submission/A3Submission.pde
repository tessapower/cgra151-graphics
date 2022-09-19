 Character player;
 Background parallax;
 Camera camera;
 Point playerStartPos;

void setup() {
    // Window Setup
    size(640, 180);
    noSmooth();
    frameRate(24);

     // Game Setup
     var screenDim = new Dimension(width, height);
     camera = new Camera(screenDim);
     player = new Character();
     player.setStartPosition(new Point(20, int(height - player.dimension().height * 1.05)));
     parallax = new Background(screenDim);

    // idleSheet = loadImage("./character/idle_r.png");
    // idle = new PImage[6];
    // for (int i = 0; i < idle.length; i++) {
    //     idle[i] = idleSheet.get(i * characterDim, 0, characterDim, characterDim);
    // }
}

void draw() {
    background(255);

    // playerX = frameCount;
    // if (worldToScreenX(playerX) >= 0.8 * width) {
    //     cameraX += worldToScreenX(playerX) - 0.8 * width;
    // }

    // drawParallax(cameraX);
     parallax.draw(camera);

    // drawCharacter(int((frameCount / 3) % 6));
     player.draw(frameCount, camera);
}

void keyPressed() {
     player.handleKeyPress(keyCode);
}

void keyReleased() {
     player.handleKeyRelease(keyCode);
}

// int worldToScreenX(int x, int y, int z) {
//     return (x - cameraX) / z;
// }

// int worldToScreenX(int x) {
//     return (x - cameraX);
// }

// void drawParallax(int cX) {
//     image(background, worldToScreenX(background.width *  (cX / background.width),      0, 3), 0);
//     image(background, worldToScreenX(background.width * ((cX / background.width) + 1), 0, 3), 0);
//     image(midground,  worldToScreenX(midground.width *   (cX / midground.width),       0, 2), 0);
//     image(midground,  worldToScreenX(midground.width *  ((cX / midground.width) + 1),  0, 2), 0);
//     image(foreground, worldToScreenX(foreground.width *  (cX / foreground.width),      0, 1), 0);
//     image(foreground, worldToScreenX(foreground.width * ((cX / foreground.width) + 1), 0, 1), 0);
// }

// void drawCharacter(int animationFrame) {
//     image(idle[animationFrame], playerX, height - characterDim);
// }
