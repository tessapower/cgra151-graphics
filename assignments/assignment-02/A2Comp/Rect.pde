public class Rect {
    protected Dimension dimension;
    protected Point origin;

    public Rect(Point origin, Dimension dimension) {
        this.origin = origin;
        this.dimension = dimension;
    }

    public void draw() {
        pushMatrix();
        translate(origin.x, origin.y);
        rect(0, 0, dimension.width, dimension.height);
        popMatrix();
    }

    public Point origin() {
        return origin;
    }

    public void setOrigin(Point origin) {
        this.origin = origin;
    }

    public int width() {
        return dimension.width;
    }

    public int height() {
        return dimension.height;
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
        return new Point(origin.x, origin.y + dimension.height);
    }

    /**
     * Returns the point that corresponds to the top-right corner.
     */
    public Point topRight() {
        return new Point(origin.x + dimension.width, origin.y);
    }

    /**
     * Returns the point that corresponds to the bottom-right corner.
     */
    public Point bottomRight() {
        return new Point(origin.x + dimension.width, origin.y + dimension.height);
    }

    /**
     * Returns whether the specified point is found within or on the border
     * of this rect.
     */
    public boolean contains(Point p) {
        return p.x >= origin.x && p.x <= origin.x + dimension.width
            && p.y >= origin.y && p.y <= origin.y + dimension.height;
    }
}
