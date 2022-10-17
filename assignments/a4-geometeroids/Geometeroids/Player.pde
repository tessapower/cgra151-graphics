// A class that represents the player!
 public class Player {
    private final int OFF_SCREEN_BUFFER = 10;
    private final PShape SHIP;
    private final Thruster THRUSTER = new Thruster();
    private final int ANGLE_INCREMENT = 6;
    private final float THRUST_INCREMENT = 0.1f;
    private final float TOP_SPEED = 5;

    private PVector position = new PVector(width / 2, height / 2);
    private PVector velocity = new PVector(0, 0);
    private int rotation = -90;
    private boolean accelerating = false;

    public Player() {
        SHIP = createShape();
        SHIP.beginShape();
        SHIP.vertex(0, 0);   // Nose
        SHIP.vertex(10, 30);  // Right wing
        SHIP.vertex(0, 25);   // Rear
        SHIP.vertex(-10, 30); // Left wing
        SHIP.fill(200);
        SHIP.noStroke();
        SHIP.endShape(CLOSE);
    }

    public void update() {
        if (accelerating) {
            velocity.add(PVector.fromAngle(radians(rotation)).mult(THRUST_INCREMENT));
            velocity.limit(TOP_SPEED);
        }
        position.add(velocity);

        // Let player's position wrap around the screen
        if (position.x > width + OFF_SCREEN_BUFFER) {
            position.x = 0;
        } else if (position.x < -OFF_SCREEN_BUFFER) {
            position.x = width;
        }
        if (position.y > height + OFF_SCREEN_BUFFER) {
            position.y = 0;
        } else if (position.y < -OFF_SCREEN_BUFFER) {
            position.y = height;
        }

        velocity.mult(0.99f);
    }

    public void draw() {
        pushMatrix();
        translate(position.x, position.y);

        shapeMode(CORNER);
        if (accelerating) {
            THRUSTER.draw();
        }

        shape(SHIP, 0, 0);
        // fill(255, 0, 0);
        // circle(0, 0, 5);
        popMatrix();
    }

    public void accelerate() {
        accelerating = true;
    }

    public void decelerate() {
        accelerating = false;
    }

    public void turnLeft() {
        rotation -= ANGLE_INCREMENT;
        SHIP.rotate(radians(-ANGLE_INCREMENT));
        THRUSTER.rotate(radians(-ANGLE_INCREMENT));
    }

    public void turnRight() {
        rotation += ANGLE_INCREMENT;
        SHIP.rotate(radians(ANGLE_INCREMENT));
        THRUSTER.rotate(radians(ANGLE_INCREMENT));
    }

    public PVector position() {
        return position;
    }

    public int rotation() {
        return rotation;
    }

    public Bullet fire() {
        return new Bullet(position, velocity, rotation);
    }
}
