import java.awt.*;

/**
 * A parallax background that extends infinitely in both directions.
 */
public class Background {
    private final PImage BACKGROUND = loadImage("./background/background_layer_1_sm.png");
    private final PImage MIDGROUND = loadImage("./background/background_layer_2_sm.png");
    private final PImage FOREGROUND = loadImage("./background/background_layer_3_sm.png");

    private final Dimension windowSize;
    private Point position;

    Background(Dimension windowSize) {
        this.windowSize = windowSize;
        position = new Point(0, 0);
    }

    public void draw(Camera c) {
        int cX = c.position().x;

        image(BACKGROUND,
              worldToScreenX(c, BACKGROUND.width * (cX / BACKGROUND.width), 0, 3),
              0);
        image(BACKGROUND,
              worldToScreenX(c, BACKGROUND.width * ((cX / BACKGROUND.width) + 1), 0, 3),
              0);

        image(MIDGROUND,
              worldToScreenX(c, MIDGROUND.width  * (cX / MIDGROUND.width), 0,2),
              0);
        image(MIDGROUND,
              worldToScreenX(c, MIDGROUND.width  * ((cX / MIDGROUND.width) + 1), 0, 2),
              0);

        image(FOREGROUND,
              worldToScreenX(c, FOREGROUND.width * (cX / FOREGROUND.width), 0, 1),
              0);
        image(FOREGROUND,
              worldToScreenX(c, FOREGROUND.width * ((cX / FOREGROUND.width) + 1), 0, 1),
              0);
    }

    // TODO: Remove y?
    private int worldToScreenX(Camera c, int x, int y, int z) {
        return (x - c.position().x) / z;
    }
 }
