/// Assignment 2
/// Tessa Power (300633153)
/// A2Comp

/// This sketch is a basic remake of the classic game Breakout by Steve Wozniak.

import java.util.List;
import java.awt.Point;
import java.awt.Dimension;
import processing.sound.*;

final int batBuffer = 30;
final int numBrickRows = 3;
final int numBrickCols = 5;
final int brickSpacer = 5;

List<Brick> bricks = new ArrayList<>(numBrickRows * numBrickCols);
int numBricksRemaining = numBrickRows * numBrickCols;
boolean gameLost = false;
boolean gameWon = false;
Point center;
SoundFile bounce;
Ball ball;
Bat bat;

void settings() {
    size(500, 500);
}

void setup() {
    frameRate(60);
    noStroke();
    center = new Point(width / 2, height / 2);

    // The ball!
    ellipseMode(CENTER);
    ball = new Ball(center);

    // Our little bat
    bat = new Bat(new Point(center.x, height - batBuffer));

    // Set bounce volume
    bounce = new SoundFile(this, "bounce.wav");
    bounce.amp(0.1);

    setupGame();
}

void setupGame() {
    // Randomly set ball velocity
    ball.setVx(int(random(2, 5) * (random(1) > 0.5 ? -1 : 1)));
    ball.setVy(int(random(3, 6)));

    // Load and place bricks
    // Set the brick width depending on the size of the window
    int brickHeight = 30;
    int brickWidth = (width - ((numBrickCols + 1) * brickSpacer)) / numBrickCols;
    int startX = brickSpacer;
    int y = brickSpacer;

    for (var i = 0; i < numBrickRows; ++i) {
        int x = startX;
        for (var j = 0; j < numBrickCols; ++j) {
            bricks.add(new Brick(new Point(x, y), new Dimension(brickWidth, brickHeight)));

            x += brickWidth + brickSpacer;
        }
        y += brickHeight + brickSpacer;
    }
}

void draw() {
    background(#0D181C);

    if (!((gameWon = bricks.isEmpty()) || gameLost)) {
        ball.update();
        handleCollisions();
        ball.draw();
        bat.draw();
        bricks.forEach(Brick::draw);
    } else {
        textSize(32.0);
        textAlign(CENTER, CENTER);
        if (gameWon) {
            fill(#90BE6D);
            text("YOU WIN", 0, 0, width, height);
        } else if (gameLost) {
            fill(#F94144);
            text("GAME OVER", 0, 0, width, height);
        }
    }
}

//-------------------------------------------------------------- MOUSE EVENTS --//

void mouseMoved() {
    var newX = mouseX - bat.width() / 2;
    // Clamp new x pos within horizontal window bounds
    var maxX = width - bat.width();
    if (newX <= 0) {
        newX = 0;
    } else if (newX >= maxX) {
        newX = maxX;
    }

    bat.setOrigin(new Point(newX, bat.origin().y));
}

//---------------------------------------------------------------- COLLISIONS --//

/**
 * Determine if the ball has collided with the walls or the bat,
 * and if it has, make the ball bounce.
 */
void handleCollisions() {
    // Wall Collisions
    boolean didCollide = handleWallCollision();

    // Bat Collision
    if (!didCollide) {
        didCollide = handleRectCollision(bat);
    }

    // Brick Collisions
    if (!didCollide) {
        didCollide = handleBrickCollisions();
    }

    if (didCollide) {
        bounce.play();
    }
}

boolean handleWallCollision() {
    boolean collisionHandled = false;

    // TODO: Document this better
    // Approach: 4x test points on ball top, bottom, left, right
    // Detection: if bat contains any of them, reflect in x or y
    // Resolve Collision: if bat contains any of them, reflect in x or y
    // We assume the bounce will move the ball back as much as the ball is
    // currently overlapping the wall
    var diffX = 0;
    var diffY = 0;

    if (ball.top().y <= 0) {                 // Northern wall
        ball.reflectVy();
        diffY = -ball.top().y;

        collisionHandled = true;
    } else if (ball.bottom().y >= height) {  // Southern Wall
        gameLost = true;

        collisionHandled = true;
    } else if (ball.left().x <= 0) {        // Western Wall
        ball.reflectVx();
        diffX = -ball.left().x;

        collisionHandled = true;
    } else if(ball.right().x >= width) {    // Eastern Wall
        ball.reflectVx();
        diffX = width - ball.right().x;

        collisionHandled = true;
    }

    // If we have collided with a wall, then rebound the ball to the
    // correct position
    if (collisionHandled) {
        ball.move(2 * diffX, 2 * diffY);
    }

    return collisionHandled;
}

boolean handleRectCollision(Rect r) {
    boolean collisionHandled = false;

    // BALL VS. BAT
    // TODO: Document this better
    // Approach: 4x test points on ball top, bottom, left, right
    // Detection: if bat contains any of them, reflect in x or y
    // Resolve Collision: if bat contains any of them, reflect in x or y
    // We assume the bounce will move the ball back as much as the ball is
    // currently overlapping the wall

    var diffX = 0;
    var diffY = 0;

    // Test Ball bounding box edges
    if (r.contains(ball.top())) {
        ball.reflectVy();
        diffY = (r.origin().y + r.height()) - ball.top().y;

        collisionHandled = true;
    } else if (r.contains(ball.bottom())) {
        ball.reflectVy();
        diffY = r.origin().y - ball.bottom().y;

        collisionHandled = true;
    } else if (r.contains(ball.left())) {
        ball.reflectVx();
        diffX = (r.origin().x + r.width()) - ball.left().x;

        collisionHandled = true;
    } else if (r.contains(ball.right())) {
        ball.reflectVx();
        diffX = r.origin().x - ball.right().x;

        collisionHandled = true;
    }

    // Test bat corners only if we haven't collided cleanly with any side of
    // the bat
    // TODO: Finish this
    if (!collisionHandled) {
        if (ball.contains(r.topLeft())) {
            // calculate diffX
            // calculate diffY

            collisionHandled = true;
        } else if (ball.contains(r.topRight())) {
            // calculate diffX
            // calculate diffY

            collisionHandled = true;
        } else if (ball.contains(r.bottomLeft())) {
            // calculate diffX
            // calculate diffY

            collisionHandled = true;
        } else if (ball.contains(r.bottomRight())) {
            // calculate diffX
            // calculate diffY

            collisionHandled = true;
        }

        // If we have collided with any of the corners, then reflect the ball's
        // velocity in both the x and y direction
        if (collisionHandled) {
            ball.reflectVx();
            ball.reflectVy();
        }
    }

    // If we have collided with the bat at all, then rebound the ball to the
    // correct position
    if (collisionHandled) {
        ball.move(2 * diffX, 2 * diffY);
    }

    return collisionHandled;
}

boolean handleBrickCollisions() {
    boolean collisionHandled = false;

    var it = bricks.iterator();

    while (it.hasNext()) {
        var b = it.next();

        if ((collisionHandled = handleRectCollision(b))) {
            b.hit();

            if (b.isDestroyed()) {
                it.remove();
            }

            break;
        }
    }

    return collisionHandled;
}
