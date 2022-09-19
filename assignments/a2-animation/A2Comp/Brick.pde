public class Brick extends Rect {
    private static final color PISTACHIO = #90BE6D;
    private static final color YELLOW_ORANGE = #F8961E;
    private static final color RED_SALSA = #F94144;

    private Dimension dimension;
    private Point origin;
    private color c = PISTACHIO;
    private int numHits = 0;
    private boolean isDestroyed = false;

    public Brick(Point origin, Dimension dimension) {
        super(origin, dimension);
    }

    public void draw() {
        if (!isDestroyed) {
            fill(c);

            super.draw();
        }
    }

    public void hit() {
        switch(++numHits) {
            case 1: { c = YELLOW_ORANGE; break; }
            case 2: { c = RED_SALSA; break; }
            case 3: { isDestroyed = true; break; }
        }
    }

    public boolean isDestroyed() {
        return isDestroyed;
    }
}
