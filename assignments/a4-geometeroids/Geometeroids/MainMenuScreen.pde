import java.util.function.Consumer;

public class MainMenuScreen implements Screen {
    private final Game game;
    private final Consumer<ScreenIdentifier> onScreenChange;

    private static final String TITLE = "GEOMETEROIDS";
    private static final float TITLE_FONT_SIZE = 36.0f;

    private final PFont titleFont = createFont("outer-space.ttf", TITLE_FONT_SIZE);

    private Menu displayedSubMenu;

    private final Menu mainMenu;
    private final Menu howToPlay;
    // private final Menu highScores;
    private final Menu credits;

    public MainMenuScreen(Game game, Consumer<ScreenIdentifier> onScreenChange) {
        this.game = game;
        this.onScreenChange = onScreenChange;

        // Add Menu items
        // Main menu
        mainMenu = new MainMenu(this::onSubMenuSelection);

        // How to play menu
        howToPlay = new HowToPlayMenu(this::onSubMenuSelection);

        // High scores menu
        // highScores = new HighScoresMenu(this::onSubMenuSelection);

        // Credits menu
        credits = new CreditsMenu(this::onSubMenuSelection);

        displayedSubMenu = mainMenu;
    }

    public void handleKeyPressed(int keyCode) {
        // Forward key event to screen
        displayedSubMenu.handleKeyPressed(keyCode);
    }

    public void handleKeyReleased(int keyCode) {
        // Forward key event to screen
        displayedSubMenu.handleKeyReleased(keyCode);
    }

    ScreenIdentifier screen() {
        return ScreenIdentifier.SHOWING_MENU;
    }

    // TODO: maybe rename this method to draw()
    void update(int frameCount) {
        background(0);
        drawTitle();
        // TODO: Maybe rename this method to draw()
        displayedSubMenu.update();
    }

    private void drawTitle() {
        fill(Colors.Text.PRIMARY);
        textFont(titleFont);
        textAlign(CENTER, CENTER);
        text(TITLE, width / 2, height / 5);
    }

    private void onSubMenuSelection(SubMenuOption subMenuOption) {
        // Set displayed menu
        switch(subMenuOption) {
            case ONE_PLAYER: {
                // Settings.shared().setPlayerMode(MultiplayerMode.SINGLE_PLAYER);
                onScreenChange.accept(ScreenIdentifier.PLAYING);
                break;
            }
            case TWO_PLAYER: {
                // Settings.shared().setPlayerMode(MultiplayerMode.MULTIPLAYER);
                onScreenChange.accept(ScreenIdentifier.PLAYING);
                println("Playing in multiplayer mode.");
                break;
            }
            // TODO: Maybe address these in a separate method called onSubMenuClose()
            case CREDITS: {
                displayedSubMenu = credits;
                break;
            }
            case HIGH_SCORES: {
                // displayedSubMenu = highScores;
                println("Displaying high scores.");
                break;
            }
            case HOW_TO_PLAY: {
                displayedSubMenu = howToPlay;
                break;
            }
            case CLOSE: {
                displayedSubMenu = mainMenu;
                break;
            }
       }
    }
}
