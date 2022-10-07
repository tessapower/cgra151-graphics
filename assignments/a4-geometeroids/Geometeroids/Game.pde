import java.util.function.Consumer;

public class Game {
    private Screen activeScreen;

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
        // if (activeScreen instanceof GameScreen gameScreen) {
        //     // gameScreen.handleKeyRelease(keyCode);
        // }
    }

    public void requestScreenChange(ScreenIdentifier newScreen) {
        if (activeScreen != null && activeScreen.screen() == newScreen) return;
        if (activeScreen != null) background(0);

        switch(newScreen) {
            case SHOWING_MENU: activeScreen = new MainMenuScreen(this, this::requestScreenChange); break;
            // case PLAYING -> activeScreen = new PlayGameScreen(this, this::requestScreenChange); break;
            case SHOWING_GAME_OVER: {
                assert activeScreen != null;
                // activeScreen = new GameOverScreen(this, this::requestScreenChange, ((PlayGameScreen) activeScreen).gameState());
                break;
            }
        }
    }
}
