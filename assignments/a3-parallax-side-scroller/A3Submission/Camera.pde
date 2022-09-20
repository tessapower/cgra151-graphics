import java.awt.Point;

public class Camera {
    private Point position = new Point(0, 0);
    private Dimension bounds;

    public Camera(Dimension screenDimension) {
        bounds = screenDimension;
    }

    public void update(Point characterPos) {
        // check bounds
    }

    public Point position() {
        return position;
    }
}
