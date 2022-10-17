import java.util.function.Consumer;

public class GameScreen implements Screen {
    private final Consumer<ScreenIdentifier> onScreenChange;
    private final HighScores highScores;
    private final GameWorld world = new GameWorld(this::onGameOver);

    public GameScreen(HighScores highScores, Consumer<ScreenIdentifier> onScreenChange) {
        this.highScores = highScores;
        this.onScreenChange = onScreenChange;
        GameState.INSTANCE.reset();
    }

    public void onGameOver(int finalScore) {
        if (highScores.isHighScore(finalScore)) {
            highScores.addScore(finalScore);
        }

        onScreenChange.accept(ScreenIdentifier.SHOWING_GAME_OVER);
    }

    @Override
    public void handleKeyPressed(int keyCode) {
        world.handleKeyPressed(keyCode);
    }

    @Override
    public void handleKeyReleased(int keyCode) {
        world.handleKeyReleased(keyCode);
    }

    @Override
    public void update() {
        if (!gameState.isGameOver()) {
            world.update();
        } else {
            onGameOver(gameState.score());
        }
    }

    @Override
    public ScreenIdentifier screen() {
        return ScreenIdentifier.PLAYING;
    }
}
