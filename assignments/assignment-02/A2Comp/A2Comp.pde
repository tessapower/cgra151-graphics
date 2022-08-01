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
            bricks.add(new Brick(new Point(x, y),
                       new Dimension(brickWidth, brickHeight)));
            x += brickWidth + brickSpacer;
        }
        y += brickHeight + brickSpacer;
    }
}

void draw() {
    background(#0D181C);

    // Update
    ball.update();
    handleCollisions();

    // Draw
    ball.draw();
    bat.draw();
    bricks.forEach(Brick::draw);
}

//-------------------------------------------------------------- MOUSE EVENTS --//

void mouseMoved() {
    clampBatPosition(new Point(mouseX, mouseY));
}

void clampBatPosition(Point mousePos) {
    var newX = mousePos.x - bat.width() / 2;
    // Clamp new x pos within horizontal window bounds
    var maxX = width - bat.width();
    if (newX <= 0) newX = 0;
    else if (newX >= maxX) newX = maxX;

    var newY = mousePos.y - bat.height() / 2;
    // Clamp new y pos within vertical window bounds
    var maxY = height - bat.height();
    if (newY <= 0) newY = 0;
    else if (newY >= maxY) newY = maxY;

    bat.setOrigin(new Point(newX, newY));
}

//---------------------------------------------------------------- COLLISIONS --//

/**
 * Determine if the ball has collided with the walls or the bat,
 * and if it has, make the ball bounce.
 */
void handleCollisions() {
    var didCollide = false;
    // Play a sound on any collision
    if ((didCollide = handleWallCollision())
        || (didCollide = handleRectCollision(bat))
        || (didCollide = handleBrickCollisions())) {
        bounce.play();
    }
}

boolean handleWallCollision() {
    var collisionHandled = false;

    // Approach: Test 4x points on the circumference of the ball to see if it
    //           has collided with any of the walls.
    //
    // Detection: The position of the test points on the ball are located at the
    //            top-most, lower-most, left-most, and right-most points on the
    //            ball. This is a simple way to see if the ball has overlapped
    //            with the wall.
    //
    // Resolve Collision: If the ball has collided with the north or south wall,
    //                    we invert the x-component of the velocity, and similarly
    //                    if the ball has collided with the east or west wall,
    //                    we invert the y-component of the velocity. To account
    //                    for the ball possibly moving fast enough to go "inside"
    //                    the wall, we rebound it back to where the ball should
    //                    have been in that frame had it rebounded cleanly.
    //
    var diffX = 0;
    var diffY = 0;

    if ((collisionHandled = ball.top().y <= 0)) {                 // Northern wall
        ball.reflectVy();
        diffY = -ball.top().y;
    } else if ((collisionHandled = ball.bottom().y >= height)) {  // Southern Wall
        ball.reflectVy();
        diffY = height - ball.bottom().y;
    } else if ((collisionHandled = ball.left().x <= 0)) {        // Western Wall
        ball.reflectVx();
        diffX = -ball.left().x;
    } else if((collisionHandled = ball.right().x >= width)) {    // Eastern Wall
        ball.reflectVx();
        diffX = width - ball.right().x;
    }

    // If we have collided with a wall, then rebound the ball to the
    // correct position
    if (collisionHandled) {
        ball.move(2 * diffX, 2 * diffY);
    }

    return collisionHandled;
}

boolean handleRectCollision(Rect r) {
    var collisionHandled = false;

    // Approach: Test 4x points on the circumference of the ball to see if it
    //           has collided with a rect (brick or bat), and test the corners
    //           of the rect to see if any are located inside the ball.
    //
    // Detection: TODO:
    //
    // Resolve Collision: If the ball has collided with the top or bottom of a
    //                    rect we invert the x-component of the velocity, and
    //                    similarly if it has collided with the left or right
    //                    side of the rect, we invert the y-component of the
    //                    velocity. To account for the ball possibly moving fast
    //                    enough to go "inside" the rect, we rebound it back to
    //                    where the ball should have been in that frame had it
    //                    rebounded cleanly.
    //
    var diffX = 0;
    var diffY = 0;

    // Test Ball bounding box edges
    if ((collisionHandled = r.contains(ball.top()))) {
        ball.reflectVy();
        diffY = (r.origin().y + r.height()) - ball.top().y;
    } else if ((collisionHandled = r.contains(ball.bottom()))) {
        ball.reflectVy();
        diffY = r.origin().y - ball.bottom().y;
    } else if ((collisionHandled = r.contains(ball.left()))) {
        ball.reflectVx();
        diffX = (r.origin().x + r.width()) - ball.left().x;
    } else if ((collisionHandled = r.contains(ball.right()))) {
        ball.reflectVx();
        diffX = r.origin().x - ball.right().x;
    }

    // Test rect corners only if we haven't collided cleanly with any side of
    // the rect
    if (!collisionHandled) {
        if ((collisionHandled = ball.contains(r.topLeft()))) {
            // set x-velocity to negative of current x-velocity
            if (ball.vx() > 0) ball.reflectVx();

            // set y-velocity to negative of current y-velocity
            if (ball.vy() > 0) ball.reflectVy();
        } else if ((collisionHandled = ball.contains(r.topRight()))) {
            // set x-velocity to positive of current x-velocity
            if (ball.vx() < 0) ball.reflectVx();

            // set y-velocity to negative of current y-velocity
            if (ball.vy() > 0) ball.reflectVy();
        } else if ((collisionHandled = ball.contains(r.bottomLeft()))) {
            // set x-velocity to negative of current x-velocity
            if (ball.vx() > 0) ball.reflectVx();

            // set y-velocity to positive of current y-velocity
            if (ball.vy() < 0) ball.reflectVy();
        } else if ((collisionHandled = ball.contains(r.bottomRight()))) {
            // set x-velocity to positive of current x-velocity
            if (ball.vx() < 0) ball.reflectVx();

            // set y-velocity to positive of current y-velocity
            if (ball.vy() < 0) ball.reflectVy();
        }
    }

    // If we have collided with the bat at all, then rebound the ball to the
    // correct position
    if (collisionHandled) ball.move(2 * diffX, 2 * diffY);

    return collisionHandled;
}

boolean handleBrickCollisions() {
    var collisionHandled = false;

    var it = bricks.iterator();

    while (it.hasNext()) {
        var b = it.next();

        if ((collisionHandled = handleRectCollision(b))) {
            b.hit();
            if (b.isDestroyed()) it.remove();
            break;
        }
    }

    return collisionHandled;
}
