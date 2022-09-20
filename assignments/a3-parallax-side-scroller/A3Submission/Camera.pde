import java.awt.Point;

/**
 * Represents the portion of the screen that the player sees.
 */
public class Camera {
    private Point pos = new Point(0, 0);

    public Camera() {}

    public void update(Character player) {
        int playerX = worldToScreenX(this, player.position().x);
        boolean atRightBoundary = playerX >= 0.8 * width;
        boolean atLeftBoundary = playerX <= 0.1 * width;
        boolean atStartOfLevel = pos.x == 0;
        if (atRightBoundary || (atLeftBoundary && !atStartOfLevel)) {
            pos.x += player.speed();
        }
    }

    public Point position() {
        return pos;
    }
}
