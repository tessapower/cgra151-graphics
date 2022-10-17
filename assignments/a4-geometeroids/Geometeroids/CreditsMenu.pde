// A menu to display attributions
class CreditsMenu extends Menu {
    private static final float TITLE_FONT_SIZE = 36.0f;
    private static final String SUBMENU_TITLE = "Credits";
    private static final String CREDIT_TEXT =
        "\"Retro Gaming\" font by Damyrius. (CC0)"
        + "\n\n\"Outer Space\" font by Hoverglow.(CC0)";

    private final Button close = new Button("close");
    private final PFont titleFont = createFont("retro-gaming.ttf", TITLE_FONT_SIZE);

    private int helpTextX;
    private int helpTextY;
    private int helpTextMaxWidth;
    private int helpTextMaxHeight;

    public CreditsMenu(Consumer<SubMenuOption> subMenuSelectionNotifier) {
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
        drawCreditsText();
        close.draw();
    }

    private void drawSubMenuTitle() {
        fill(Colors.Text.SECONDARY);
        textFont(titleFont);
        textAlign(CENTER, CENTER);
        text(SUBMENU_TITLE, width / 2, height / 3);
    }

    private void drawCreditsText() {
        fill(Colors.Text.TERTIARY);
        textFont(TEXT_FONT);
        textAlign(CENTER, CENTER);
        text(CREDIT_TEXT, helpTextX, helpTextY, helpTextMaxWidth, helpTextMaxHeight);
    }
}
