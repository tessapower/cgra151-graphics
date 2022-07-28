public class Ball {
    private final int RADIUS = 10;
    private final color COLOR = color(#F1F7F9);

    private Point origin;
    private int vx;
    private int vy;

    public Ball(Point origin, int vx, int vy) {
        this.origin = origin;
        this.vx = vx;
        this.vy = vy;
    }

    public void update() {
        move(vx, vy);
    }

    /**
     * Moves the ball by it's velocity.
     */
    public void move(int dx, int dy) {
        origin.x += dx;
        origin.y += dy;
    }

    public void setOrigin(Point origin) {
        this.origin = origin;
    }

    public void draw() {
        fill(COLOR);

        pushMatrix();
        translate(origin.x, origin.y);
        ellipse(0, 0, RADIUS * 2, RADIUS * 2);
        popMatrix();
    }

    /**
     * Reflects the x-component of this ball's velocity.
     */
    public void reflectVx() {
        this.vx *= -1;
    }

    /**
     * Reflects the y-component of this ball's velocity.
     */
    public void reflectVy() {
        this.vy *= -1;
    }

    /**
     * Returns the point that corresponds to the upper-most point on the ball.
     */
    public Point top() {
        return new Point(origin.x, origin.y - RADIUS);
    }

    /**
     * Returns the point that corresponds to the lowest point on the ball.
     */
    public Point bottom() {
        return new Point(origin.x, origin.y + RADIUS);
    }

    /**
     * Returns the point that corresponds to the left-most point on the ball.
     */
    public Point left() {
        return new Point(origin.x - RADIUS, origin.y);
    }

    /**
     * Returns the point that corresponds to the right-most point on the ball.
     */
    public Point right() {
        return new Point(origin.x + RADIUS, origin.y);
    }

    /**
     * Returns whether the specified point is found within or on the
     * circumference of this ball.
     */
    public boolean contains(Point p) {
        // Check if distance between point and origin is less than radius,
        // if yes then the ball contains the point
        var distX = p.x - origin.x;
        var distY = p.y - origin.y;
        return sqrt((distX * distX) + (distY * distY)) <= RADIUS;
    }
}
