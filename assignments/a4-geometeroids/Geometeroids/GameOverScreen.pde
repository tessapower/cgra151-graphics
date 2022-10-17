public class GameOverScreen implements Screen {
    private final Consumer<ScreenIdentifier> onScreenChange;

    private static final String TITLE = "GAME OVER";
    private static final float TITLE_FONT_SIZE = 36.0f;

    private final PFont titleFont = createFont("outer-space.ttf", TITLE_FONT_SIZE);

    private final Button mainMenu = new Button("Main Menu");
    private final Button playAgain = new Button("Play Again");
    private final ButtonGroup buttonGroup = new ButtonGroup(mainMenu, playAgain);
    private final Map<Button, ScreenIdentifier> buttonActions = Map.of(
            mainMenu, ScreenIdentifier.SHOWING_MENU,
            playAgain, ScreenIdentifier.PLAYING
    );

    public GameOverScreen(Consumer<ScreenIdentifier> onScreenChange) {
        this.onScreenChange = onScreenChange;
    }

    @Override
    public void handleKeyPressed(int keyCode) {
        // Handle selecting a menu or moving up and down
        switch(keyCode) {
            case KeyEvent.VK_UP: buttonGroup.previous(); break;
            case KeyEvent.VK_DOWN: buttonGroup.next(); break;
            case KeyEvent.VK_ENTER: {
                Button focussed = buttonGroup.getFocussed();
                if (focussed != null) {
                    ScreenIdentifier choice = buttonActions.get(focussed);
                    if (choice != null) {
                        onScreenChange.accept(choice);
                    }
                }
            }
            break;
        }
    }

    @Override
    public void handleKeyReleased(int keyCode) {
        // No-op
    }

    ScreenIdentifier screen() {
        return ScreenIdentifier.SHOWING_GAME_OVER;
    }

    private void drawTitle() {
        fill(Colors.Text.PRIMARY);
        textFont(titleFont);
        textAlign(CENTER, CENTER);
        text(TITLE, width / 2, height / 5);
    }

    @Override
    public void update() {
        background(Colors.BACKGROUND);
        drawTitle();
        buttonGroup.buttons().forEach(Button::draw);
    }
}
