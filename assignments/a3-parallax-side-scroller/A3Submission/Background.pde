import java.awt.*;

/**
 * A parallax background that extends infinitely in both directions.
 */
public class Background {
    private final PImage BACKGROUND = loadImage("./background/background.png");
    private final PImage MIDGROUND = loadImage("./background/midground.png");
    private final PImage FOREGROUND = loadImage("./background/foreground.png");

    Background() {}

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
}
