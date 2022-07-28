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
    var newX = mouseX - bat.width() / 2;
    // Clamp new x pos within horizontal window bounds
    var maxX = width - bat.width();
    if (newX <= 0) {
        newX = 0;
    } else if (newX >= maxX) {
        newX = maxX;
    }

    var newY = mouseY - bat.height() / 2;
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
    boolean didCollide = handleWallCollision(ball);
    if (!didCollide) {
        didCollide = handleBatCollision(ball, bat);
    }

    if (didCollide) {
        bounce.play();
    }
}

boolean handleWallCollision(Ball ball) {
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
        ball.reflectVy();
        diffY = height - ball.bottom().y;

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

    // If we have collided with any wall, then rebound the ball to the
    // correct position
    if (collisionHandled) {
        ball.move(2 * diffX, 2 * diffY);
    }

    return collisionHandled;
}

boolean handleBatCollision(Ball ball, Bat bat) {
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
    if (bat.contains(ball.top())) {
        ball.reflectVy();
        diffY = (bat.origin().y + bat.height()) - ball.top().y;

        collisionHandled = true;
    } else if (bat.contains(ball.bottom())) {
        ball.reflectVy();
        diffY = bat.origin().y - ball.bottom().y;

        collisionHandled = true;
    } else if (bat.contains(ball.left())) {
        ball.reflectVx();
        diffX = (bat.origin().x + bat.width()) - ball.left().x;

        collisionHandled = true;
    } else if (bat.contains(ball.right())) {
        ball.reflectVx();
        diffX = bat.origin().x - ball.right().x;

        collisionHandled = true;
    }

    // If we have collided with any side of the bat, then rebound the ball to the
    // correct position
    if (collisionHandled) {
        ball.move(2 * diffX, 2 * diffY);
    }

    return collisionHandled;
}
