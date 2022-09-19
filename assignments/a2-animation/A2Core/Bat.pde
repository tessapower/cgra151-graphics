public class Bat {
    private static final color COLOR = #F1F7F9;
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

    /**
     * Returns the point that corresponds to the top-left corner.
     */
    public Point topLeft() {
        return origin;
    }

    /**
     * Returns the point that corresponds to the bottom-left corner.
     */
    public Point bottomLeft() {
        return new Point(origin.x, origin.y + DIMENSION.height);
    }

    /**
     * Returns the point that corresponds to the top-right corner.
     */
    public Point topRight() {
        return new Point(origin.x + DIMENSION.width, origin.y);
    }

    /**
     * Returns the point that corresponds to the bottom-right corner.
     */
    public Point bottomRight() {
        return new Point(origin.x + DIMENSION.width, origin.y + DIMENSION.height);
    }

    /**
     * Returns whether the specified point is found within or on the border
     * of this bat.
     */
    public boolean contains(Point p) {
        return p.x >= origin.x && p.x <= origin.x + DIMENSION.width
            && p.y >= origin.y && p.y <= origin.y + DIMENSION.height;
    }
}
