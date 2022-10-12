import java.util.function.Consumer;

public class GameScreen implements Screen {
    private final Consumer<ScreenIdentifier> onScreenChange;
    private final GameState gameState = GameState.INSTANCE;
    private final GameWorld world = new GameWorld(this::onGameOver, gameState);

    public GameScreen(Consumer<ScreenIdentifier> onScreenChange) {
        // SoundEffects.shared().backgroundMusic().playOnLoop();
        this.onScreenChange = onScreenChange;
        gameState.reset();
    }

    public void onGameOver(int finalScore) {
        // TODO: set the high score?
        println("Final score: " + finalScore);
        onScreenChange.accept(ScreenIdentifier.SHOWING_GAME_OVER);
    }

    @Override
    public void handleKeyPressed(int keyCode) {
        if (keyCode == KeyEvent.VK_P) {
            // TODO: Toggle pause
        } else {
            world.handleKeyPressed(keyCode);
        }
    }

    @Override
    public void handleKeyReleased(int keyCode) {
        world.handleKeyReleased(keyCode);
    }

    @Override
    public void update(int frameCount) {
        world.update(frameCount);
    }

    @Override
    public ScreenIdentifier screen() {
        return ScreenIdentifier.PLAYING;
    }
}
