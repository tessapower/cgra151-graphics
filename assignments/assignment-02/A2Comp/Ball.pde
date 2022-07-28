public class Ball {
    private static final int RADIUS = 10;
    private static final color COLOR = #F1F7F9;

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

    public void move(int dx, int dy) {
        origin.x += dx;
        origin.y += dy;
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

    public void reflectVx() {
        this.vx *= -1;
    }

    public int vx() {
        return vx;
    }

    public void setVy(int vy) {
        this.vy = vy;
    }

    public void reflectVy() {
        this.vy *= -1;
    }

    public int vy() {
        return vy;
    }

    public void update() {
        origin.translate(vx, vy);
    }

    public Point top() {
        return new Point(origin.x, origin.y - RADIUS);
    }

    public Point bottom() {
        return new Point(origin.x, origin.y + RADIUS);
    }

    public Point left() {
        return new Point(origin.x - RADIUS, origin.y);
    }

    public Point right() {
        return new Point(origin.x + RADIUS, origin.y);
    }

    public boolean contains(Point p) {
        // Check if distance between point and origin is less than radius,
        // if yes then the ball contains the point
        var distX = p.x - origin.x;
        var distY = p.y - origin.y;
        return sqrt((distX * distX) + (distY * distY)) <= RADIUS;
    }
}
