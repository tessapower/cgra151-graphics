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

    bat = new Bat(new Point(width / 2, height - (height / 5)));
}

void draw() {
    background(#0D181C);

    // Update the ball's position
    ball.update();

    // Handle collisions
    handleCollisions();

    ball.draw();
    bat.draw();
}

//------------------------------------------------------------ MOUSE EVENTS --//

void mouseMoved() {
    var newX = mouseX - bat.width() / 2;
    // Clamp new x pos within horizontal window bounds
    var maxX = width - bat.width();
    if (mouseX <= 0) {
        newX = 0;
    } else if (mouseX >= maxX) {
        newX = maxX;
    }

    var newY = mouseY - bat.height() / 2;
    // Clamp new y pos within vertical window bounds
    var maxY = height - bat.height();
    if (mouseY <= 0) {
        newY = 0;
    } else if (mouseY >= maxY) {
        newY = maxY;
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
    var ballOrigin = ball.origin();
    var ballRadius = ball.radius();
    var ballTop    = new Point(ballOrigin.x,              ballOrigin.y - ballRadius);
    var ballBottom = new Point(ballOrigin.x,              ballOrigin.y + ballRadius);
    var ballLeft   = new Point(ballOrigin.x - ballRadius, ballOrigin.y);
    var ballRight  = new Point(ballOrigin.x + ballRadius, ballOrigin.y);

    // BALL VS. WALLS
    // North or South Walls
    if (ballTop.y <= 0 || ballBottom.y >= height) {
        ball.setVy(ball.vy() * -1);
    }

    // East or West Walls
    if (ballLeft.x <= 0 || ballRight.x >= width) {
        ball.setVx(ball.vx() * -1);
    }

    // BALL VS. BAT
    // 4x test points on ball top, bottom, left, right
    // if bat contains any of them, reflect in x or y
    if (bat.contains(ballTop) || bat.contains(ballBottom)) {
        // reflect
        // move by 2x overlap amount
        println("reflect y");
    } else if (bat.contains(ballLeft) || bat.contains(ballRight)) {
        // reflect
        // move by 2x overlap amount
        println("reflect x");
    }

    // 4x test points on bat corners
    // if ball contains any of them, reflect x, y
    var batTopLeft     = bat.origin();
    var batTopRight    = new Point(batTopLeft.x + bat.width(), batTopLeft.y);
    var batBottomLeft  = new Point(batTopLeft.x,               batTopLeft.y + bat.height());
    var batBottomRight = new Point(batTopRight.x,              batBottomLeft.y);
    if (ball.contains(batTopLeft) || ball.contains(batTopRight)
            || ball.contains(batBottomLeft) || ball.contains(batBottomRight)) {
        // reflect in x and y
        // move by 2x overlap amount
        println("reflect x and y");
    }
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

    public boolean contains(Point p) {
        // Check if distance between point and origin is less than radius,
        // if yes then the ball contains the point
        var distX = p.x - origin.x;
        var distY = p.y - origin.y;
        return sqrt((distX * distX) + (distY * distY)) <= RADIUS;
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

    public boolean contains(Point p) {
        return p.x >= origin.x && p.x <= origin.x + DIMENSION.width
            && p.y >= origin.y && p.y <= origin.y + DIMENSION.height;
    }
}
