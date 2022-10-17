public class HighScoresMenu extends Menu {
    private static final float TITLE_FONT_SIZE = 36.0f;
    private static final String SUBMENU_TITLE = "Highscores";
    private static final int SCORE_BUFFER = 20;

    private final Point titlePos;
    private final Point scoresPos;
    private final Button close = new Button("close");
    // TODO: Move titleFont and drawSubMenuTitle into Menu
    private final PFont titleFont = createFont("retro-gaming.ttf", TITLE_FONT_SIZE);
    private final HighScores highScores;

    public HighScoresMenu(Consumer<SubMenuOption> subMenuSelectionNotifier) {
        super(subMenuSelectionNotifier);

        close.setPosition(new Point(width / 2, int(height - Button.FONT_SIZE * 2)));
        close.setFocussed(true);

        titlePos = new Point(width / 2, height / 3);
        scoresPos = new Point(width / 2, height / 2);
        highScores = new HighScores();
    }

    @Override
    public void handleKeyPressed(int keyCode) {
        if (keyCode == KeyEvent.VK_ENTER) {
            subMenuSelectionNotifier.accept(SubMenuOption.CLOSE);
        }
    }

    public void update() {
        drawSubMenuTitle();
        drawHighScores();
        close.draw();
    }

    private void drawSubMenuTitle() {
        fill(Colors.Text.SECONDARY);
        textFont(titleFont);
        textAlign(CENTER, CENTER);
        text(SUBMENU_TITLE, titlePos.x, titlePos.y);
    }

    private void drawHighScores() {
        fill(Colors.Text.TERTIARY);
        textFont(TEXT_FONT);
        textAlign(CENTER, CENTER);

        var scores = highScores.getScores();
        if (scores.size() == 0) {
            text("No highscores yet :(", scoresPos.x, scoresPos.y);
        } else {
            var y = scoresPos.y;
            for (var score : scores) {
                text(score, scoresPos.x, y);
                y += SCORE_BUFFER;
            }
        }
    }
}
