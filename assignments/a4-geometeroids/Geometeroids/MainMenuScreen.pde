import java.util.function.Consumer;

// Represents everything that appears on the main menu screen
public class MainMenuScreen implements Screen {
    private final Game game;
    private final Consumer<ScreenIdentifier> onScreenChange;

    private static final String TITLE = "GEOMETEROIDS";
    private static final float TITLE_FONT_SIZE = 36.0f;

    private final List<Geometeroid> geometeroids = new ArrayList<>();

    private final PFont titleFont = createFont("outer-space.ttf", TITLE_FONT_SIZE);
    private static final int SHADOW_OFFSET = 1;

    private Point titlePos;
    private Menu displayedSubMenu;

    private final Menu mainMenu;
    private final Menu howToPlay;
    private final Menu highScores;
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
        highScores = new HighScoresMenu(this::onSubMenuSelection);

        // Credits menu
        credits = new CreditsMenu(this::onSubMenuSelection);

        displayedSubMenu = mainMenu;

        titlePos = new Point(width / 2, height / 5);

        // Add geometeroids
        // TODO: Add factory method that generates given # of random geometeroids
        //   given a randomSeed
        for (int i = 0; i < 10; i++) {
            geometeroids.add(new Geometeroid());
        }
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

    @Override
    void update() {
        geometeroids.forEach(Geometeroid::update);

        background(Colors.BACKGROUND);
        geometeroids.forEach(Geometeroid::draw);
        drawTitle();
        displayedSubMenu.update();
    }

    private void drawTitle() {
        textAlign(CENTER, CENTER);
        textFont(titleFont);
        // Draw the title shadow to make it stand out against
        // anything moving behind it
        drawFontStroke();

        fill(Colors.Text.PRIMARY);
        text(TITLE, titlePos.x, titlePos.y);
    }

    private void drawFontStroke() {
        fill(Colors.BACKGROUND);
        text(TITLE, titlePos.x + SHADOW_OFFSET, titlePos.y + SHADOW_OFFSET);
        text(TITLE, titlePos.x - SHADOW_OFFSET, titlePos.y + SHADOW_OFFSET);
        text(TITLE, titlePos.x + SHADOW_OFFSET, titlePos.y - SHADOW_OFFSET);
        text(TITLE, titlePos.x - SHADOW_OFFSET, titlePos.y - SHADOW_OFFSET);
    }

    private void onSubMenuSelection(SubMenuOption subMenuOption) {
        // Set displayed menu
        switch(subMenuOption) {
            case PLAY: {
                onScreenChange.accept(ScreenIdentifier.PLAYING);
                break;
            }
            case CREDITS: {
                displayedSubMenu = credits;
                break;
            }
            case HIGH_SCORES: {
                displayedSubMenu = highScores;
                // println("Displaying high scores.");
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
