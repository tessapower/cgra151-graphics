public class Bat extends Rect {
    private static final color COLOR = #F1F7F9;

    private Point origin;

    public Bat(Point origin) {
        super(origin, new Dimension(120, 30));
    }

    public void draw() {
        fill(COLOR);

        super.draw();
    }
}
