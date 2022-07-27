/// Assignment 2
/// Tessa Power (300633153)
/// A2Core

/// This sketch shows how to simulate basic physics using a ball and a bat.

import java.awt.Point;
import java.awt.Dimension;

Ball ball;
Bat bat;

void settings() {
    size(500, 500);
}

void setup() {
    frameRate(60);
    noStroke();

    ellipseMode(CENTER);
    ball = new Ball(new Point());
    int ballStartPos = ball.radius();
    ball.setOrigin(new Point(ballStartPos, ballStartPos));

    // Randomly set velocity
    ball.setVx(4);
    ball.setVy(3);

    rectMode(CENTER);
    bat = new Bat(new Point(width / 2, height - (height / 5)));
}

void draw() {
    background(#0D181C);

    // Update the ball's position
    ball.update();

    // Check for and resolve collisions
    handleCollisions();

    ball.draw();
    bat.draw();
}

//------------------------------------------------------------ MOUSE EVENTS --//

void mouseMoved() {
    // Offsets used to keep the bat within the window
    var batHorizontalOffset = bat.width() / 2;
    var batVerticalOffset = bat.height() / 2;

    // Ensure the bat's new x, y coordinates are within the window
    var newX = mouseX;
    if (mouseX >= width - batHorizontalOffset) {
        newX = width - batHorizontalOffset;
    } else if (mouseX <= batHorizontalOffset) {
        newX = batHorizontalOffset;
    }

    var newY = mouseY;
    if (mouseY >= width - batVerticalOffset) {
        newY = height - batVerticalOffset;
    } else if (mouseY <= batVerticalOffset) {
        newY = batVerticalOffset;
    }

    bat.setOrigin(new Point(newX, newY));
}

//---------------------------------------------------------- HELPER METHODS --//

/**
 * Determine if the ball has collided with the walls or the bat,
 * and if it has, make the ball bounce.
 */
void handleCollisions() {
    // Used to determine position of ball in window compared to walls and bat
    var origin = ball.origin();
    var ballX = origin.x;
    var ballY = origin.y;
    var ballRadius = ball.radius();

    // Check if the ball has hit the walls
    // North or South Walls
    if (ballY - ballRadius < 0 || ballY + ballRadius > height) {
        ball.setVy(ball.vy() * -1);
    }

    // East or West Walls
    if (ballX - ballRadius < 0 || ballX + ballRadius > width) {
        ball.setVx(ball.vx() * -1);
    }

    // Check if ball has hit bat and if so handle collision
    if (didBallBatCollide(ball, bat)) {
        println("Handle collision");
        // handleBallBatCollision(ball, bat);
    }
}

enum BatSide {
    LEFT, RIGHT, TOP, BOTTOM
}

boolean didBallBatCollide(Ball ball, Bat bat) {
    // Ball testing point
    Point ballCenter = ball.origin();

    // Bat testing points
    Point batCenter = bat.origin();
    var batXSize = bat.width() / 2;
    var batLeft = batCenter.x - batXSize;
    var batRight = batCenter.x + batXSize;
    var batYSize = bat.height() / 2;
    var batTop = batCenter.y - batYSize;
    var batBottom = batCenter.y + batYSize;

    // Temp values for testing edges
    var distX = ballCenter.x;
    var distY = ballCenter.y;

    // Find horizontal side of bat closest to ball center
    if (ballCenter.x <= batLeft) {
        distX = ballCenter.x - batLeft;
    } else if (ballCenter.x >= batRight) {
        distX = ballCenter.x - batRight;
    }

    if (ballCenter.y <= batTop) {
        distY = ballCenter.y - batTop;
    } else if (ballCenter.y >= batBottom) {
        distY = ballCenter.y - batBottom;
    }

    // Calc if the distance to the closest edges is less than the radius.
    // If true, the ball is overlapping the bat.
    return sqrt((distX * distX) + (distY * distY)) <= ball.radius();
}

boolean circleRect(float cx, float cy, float radius, float rx, float ry, float rw, float rh) {

  // temporary variables to set edges for testing
  float testX = cx;
  float testY = cy;

  // which edge is closest?
  if (cx < rx)         testX = rx;      // test left edge
  else if (cx > rx+rw) testX = rx+rw;   // right edge
  if (cy < ry)         testY = ry;      // top edge
  else if (cy > ry+rh) testY = ry+rh;   // bottom edge

  // get distance from closest edges
  float distX = cx-testX;
  float distY = cy-testY;
  float distance = sqrt( (distX*distX) + (distY*distY) );

  // if the distance is less than the radius, collision!
  if (distance <= radius) {
    return true;
  }
  return false;
}

//-------------------------------------------------------------- BALL & BAT --//

class Ball {
    private final int RADIUS = 10;
    private final color COLOR = color(#F1F7F9);
    private Point origin;
    private int vx;
    private int vy;

    public Ball(Point origin) {
        this.origin = origin;
    }

    public void setOrigin(Point origin) {
        this.origin = origin;
    }

    public Point origin() {
        return origin;
    }

    public int radius() {
        return RADIUS;
    }

    public void draw() {
        fill(COLOR);

        pushMatrix();
        translate(origin.x, origin.y);
        ellipse(0, 0, RADIUS * 2, RADIUS * 2);
        popMatrix();
    }

    public void setVx(int vx) {
        this.vx = vx;
    }

    public int vx() {
        return vx;
    }

    public void setVy(int vy) {
        this.vy = vy;
    }

    public int vy() {
        return vy;
    }

    public void update() {
        origin.translate(vx, vy);
    }
}

class Bat {
    private color COLOR = color(#F1F7F9);
    private final Dimension DIMENSION = new Dimension(120, 30);

    private Point origin;

    public Bat(Point origin) {
        this.origin = origin;
    }

    public void draw() {
        fill(COLOR);

        pushMatrix();
        translate(origin.x, origin.y);
        rect(0, 0, DIMENSION.width, DIMENSION.height);
        popMatrix();
    }

    public Point origin() {
        return origin;
    }

    public void setOrigin(Point origin) {
        this.origin = origin;
    }

    public int width() {
        return DIMENSION.width;
    }

    public int height() {
        return DIMENSION.height;
    }
}

