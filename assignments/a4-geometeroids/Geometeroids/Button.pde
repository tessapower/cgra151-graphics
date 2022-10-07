import java.awt.Point;

public class Button {
    public static final float FONT_SIZE = 30.0f;
    private final PFont font = createFont("retro-gaming.ttf", FONT_SIZE);

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
        fill(hasFocus ? Colors.Button.FOCUSSED : Colors.Button.PRIMARY);
        textFont(font);
        textAlign(CENTER, CENTER);
        text(text, pos.x, pos.y);
    }
}
