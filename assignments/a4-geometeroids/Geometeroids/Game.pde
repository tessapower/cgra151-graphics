import java.util.function.Consumer;

// The main game handler class, handles changing between screens and passing along
// user input to the currently active screen
public class Game {
    private final HighScores highScores = new HighScores();
    private Screen activeScreen = null;
    private GameScreen activeGame = null;

    public Game() {
        activeScreen = new MainMenuScreen(this, this::requestScreenChange);
    }

    public void update() {
        activeScreen.update();
    }

    public void handleKeyPressed(int keyCode) {
        activeScreen.handleKeyPressed(keyCode);
    }

    public void handleKeyReleased(int keyCode) {
        if (activeScreen != null && activeScreen == activeGame) {
            activeGame.handleKeyReleased(keyCode);
        }
    }

    public void requestScreenChange(ScreenIdentifier newScreen) {
        if (activeScreen != null && activeScreen.screen() == newScreen) return;
        if (activeScreen != null) background(Colors.BACKGROUND);

        switch(newScreen) {
            case SHOWING_MENU: {
                if (activeGame != null) {
                    activeGame = null;
                }
                activeScreen = new MainMenuScreen(this, this::requestScreenChange);
                break;
            }
            case PLAYING: {
                if (activeGame == null) {
                    activeGame = new GameScreen(highScores, this::requestScreenChange);
                }
                activeScreen = activeGame;
                break;
            }
            case SHOWING_GAME_OVER: {
                assert activeScreen != null;
                if (activeGame != null) {
                    activeGame = null;
                }

                activeScreen = new GameOverScreen(this::requestScreenChange);
                break;
            }
        }
    }
}
