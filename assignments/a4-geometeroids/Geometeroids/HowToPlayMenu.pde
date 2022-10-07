public class HowToPlayMenu extends Menu {
    private static final float TITLE_FONT_SIZE = 36.0f;
    private static final float BUFFER = 20;
    private static final String SUBMENU_TITLE = "How to Play";
    private static final String HOW_TO_PLAY =
        "Use the arrow keys to move around."
        + "\nUp to go forward, left and right to turn."
        + "\n\nFire at geometeroids with space bar."
        + "\n\nBreak as many as possible to get the highest score."
        + "\n\nIf you get hit, you lose a life. "
        + "If you lose all your lives, you lose the game.";

    private final Button close = new Button("close");
    private final PFont titleFont = createFont("retro-gaming.ttf", TITLE_FONT_SIZE);

    private int helpTextX;
    private int helpTextY;
    private int helpTextMaxWidth;
    private int helpTextMaxHeight;

    // TODO: Maybe convert this into a Submenu that just takes a Consumer onClose
    public HowToPlayMenu(Consumer<SubMenuOption> subMenuSelectionNotifier) {
        super(subMenuSelectionNotifier);

        helpTextX = int(width * 0.15);
        helpTextY = int(height * 0.33);
        helpTextMaxWidth = int(width * 0.7);
        helpTextMaxHeight = int(height * 0.6);

        close.setPosition(new Point(width / 2, int(height - Button.FONT_SIZE * 2)));
        close.setFocussed(true);
    }

    @Override
    public void handleKeyPressed(int keyCode) {
        if (keyCode == KeyEvent.VK_ENTER) {
            subMenuSelectionNotifier.accept(SubMenuOption.CLOSE);
        }
    }

    public void update() {
        drawSubMenuTitle();
        drawHelpText();
        close.draw();
    }

    private void drawSubMenuTitle() {
        fill(Colors.Text.SECONDARY);
        textFont(titleFont);
        textAlign(CENTER, CENTER);
        text(SUBMENU_TITLE, width / 2, height / 3);
    }

    private void drawHelpText() {
        fill(Colors.Text.TERTIARY);
        textFont(TEXT_FONT);
        textAlign(CENTER, CENTER);
        text(HOW_TO_PLAY, helpTextX, helpTextY, helpTextMaxWidth, helpTextMaxHeight);
    }
}
