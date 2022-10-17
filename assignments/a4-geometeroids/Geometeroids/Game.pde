import java.util.function.Consumer;

public class Game {
    private Screen activeScreen = null;
    private GameScreen activeGame = null;

    public Game() {
        activeScreen = new MainMenuScreen(this, this::requestScreenChange);
    }

    public void update(int frameCount) {
        activeScreen.update(frameCount);
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
                    activeGame = new GameScreen(this::requestScreenChange);
                }

                // TODO: not sure if this is necessary
                // setPaused(false);
                activeScreen = activeGame;
                break;
            }
            case SHOWING_GAME_OVER: {
                assert activeScreen != null;
                // activeScreen = new GameOverScreen(this, this::requestScreenChange, ((PlayGameScreen) activeScreen).gameState());
                break;
            }
        }
    }
}
