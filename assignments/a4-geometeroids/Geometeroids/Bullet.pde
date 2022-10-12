public class Bullet {
    private final PShape BULLET;
    private final int ROTATION;
    private final PVector VELOCITY;

    private PVector position;

    public Bullet(PVector position, PVector playerVel, int rotation) {
        BULLET = createShape(RECT, -5, 0, 10, 2);
        BULLET.setFill(color(255, 0, 0));
        BULLET.setStroke(false);

        this.ROTATION = rotation;

        this.position = position.copy();

        VELOCITY = PVector.fromAngle(radians(ROTATION)).mult(10);
    }

    public void update() {
        position.add(VELOCITY);
    }

    public void draw() {
        shapeMode(CENTER);
        pushMatrix();
        translate(position.x, position.y);
        rotate(radians(ROTATION));
        shape(BULLET, 0, 0);
        popMatrix();
    }

    public PVector position() {
        return position;
    }

    public boolean isOffScreen() {
        return position.x < 0 || position.x > width || position.y < 0 || position.y > height;
    }
}
