import java.awt.Point;

public class Button {
    public static final float FONT_SIZE = 30.0f;
    private final PFont FONT = createFont("retro-gaming.ttf", FONT_SIZE);
    private static final int SHADOW_OFFSET = 2;

    private String text;
    private boolean hasFocus;
    private Point pos = new Point();

    public Button(String text) {
        this.text = text;
        setFocussed(false);
    }

    public void setPosition(Point p) {
        this.pos = p;
    }

    public void setFocussed(boolean hasFocus) {
        this.hasFocus = hasFocus;
    }

    public void draw() {
        textAlign(CENTER, CENTER);
        textFont(FONT);
        // Draw the button shadow to make it stand out against
        // anything moving behind it
        drawFontStroke();
        // Draw Button
        fill(hasFocus ? Colors.Button.FOCUSSED : Colors.Button.PRIMARY);
        text(text, pos.x, pos.y);
    }

    // TODO: Add this to a font util class
    // TODO: Do this for all text
    // Processing doesn't support a font stroke feature, and the font we use
    // doesn't come in different weights, so we fake it.
    private void drawFontStroke() {
        fill(Colors.BACKGROUND);
        text(text, pos.x + SHADOW_OFFSET, pos.y + SHADOW_OFFSET);
        text(text, pos.x - SHADOW_OFFSET, pos.y + SHADOW_OFFSET);
        text(text, pos.x + SHADOW_OFFSET, pos.y - SHADOW_OFFSET);
        text(text, pos.x - SHADOW_OFFSET, pos.y - SHADOW_OFFSET);
    }
}
