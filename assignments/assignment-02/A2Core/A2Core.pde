/// Assignment 2
/// Tessa Power (300633153)
/// A2Core

/// This sketch shows how to simulate basic physics using a ball and a bat.
/// Turn your sound on to hear when the ball collides with the bat or a wall!

import java.awt.Point;
import java.awt.Dimension;
import processing.sound.*;

SoundFile bounce;
Ball ball;
Bat bat;

void setup() {
    // Window setup
    size(500, 500);
    frameRate(60);
    noStroke();

    // Ball
    ellipseMode(CENTER);
    ball = new Ball(new Point(40, 40), 4, 3);

    // Our little bat
    bat = new Bat(new Point(width / 2, height - (height / 5)));

    // Bounce sound
    bounce = new SoundFile(this, "bounce.wav");
    bounce.amp(0.1);
}

void draw() {
    background(#0D181C);

    ball.update();
    handleCollisions();
    ball.draw();
    bat.draw();
}

//-------------------------------------------------------------- MOUSE EVENTS --//

void mouseMoved() {
    clampBatPosition(new Point(mouseX, mouseY));
}

void clampBatPosition(Point mousePos) {
    var newX = mousePos.x - bat.width() / 2;
    // Clamp new x pos within horizontal window bounds
    var maxX = width - bat.width();
    if (newX <= 0) {
        newX = 0;
    } else if (newX >= maxX) {
        newX = maxX;
    }

    var newY = mousePos.y - bat.height() / 2;
    // Clamp new y pos within vertical window bounds
    var maxY = height - bat.height();
    if (newY <= 0) {
        newY = 0;
    } else if (newY >= maxY) {
        newY = maxY;
    }

    bat.setOrigin(new Point(newX, newY));
}

//---------------------------------------------------------------- COLLISIONS --//

/**
 * Determine if the ball has collided with the walls or the bat,
 * and if it has, make the ball bounce.
 */
void handleCollisions() {
    var didCollide = false;
    if ((didCollide = handleWallCollision(ball))
        || (didCollide = handleBatCollision(ball, bat))) {
        bounce.play();
    }
}

boolean handleWallCollision(Ball ball) {
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

    // If we have collided with any wall, then rebound the ball to the
    // correct position
    if (collisionHandled) {
        ball.move(2 * diffX, 2 * diffY);
    }

    return collisionHandled;
}

boolean handleBatCollision(Ball ball, Bat bat) {
    var collisionHandled = false;

    // Approach: Test 4x points on the circumference of the ball to see if it
    //           has collided with the bat.
    //
    // Detection: Same as for the walls, but this time we check if these test
    //            points are inside the bat using overlap detection.
    //
    // Resolve Collision: If the ball has collided with the top or bottom of the
    //                    bat we invert the x-component of the velocity, and
    //                    similarly if ithas  collided with the left or right
    //                    side of the bat, we invert the y-component of the
    //                    velocity. To account for the ball possibly moving fast
    //                    enough to go "inside" the bat, we rebound it back to
    //                    where the ball should have been in that frame had it
    //                    rebounded cleanly.
    //
    var diffX = 0;
    var diffY = 0;

    // Test Ball bounding box edges
    if ((collisionHandled = bat.contains(ball.top()))) {
        ball.reflectVy();
        diffY = (bat.origin().y + bat.height()) - ball.top().y;
    } else if ((collisionHandled = bat.contains(ball.bottom()))) {
        ball.reflectVy();
        diffY = bat.origin().y - ball.bottom().y;
    } else if ((collisionHandled = bat.contains(ball.left()))) {
        ball.reflectVx();
        diffX = (bat.origin().x + bat.width()) - ball.left().x;
    } else if ((collisionHandled = bat.contains(ball.right()))) {
        ball.reflectVx();
        diffX = bat.origin().x - ball.right().x;
    }

    // If we have collided with any side of the bat, then rebound the ball to the
    // correct position
    if (collisionHandled) {
        ball.move(2 * diffX, 2 * diffY);
    }

    return collisionHandled;
}
