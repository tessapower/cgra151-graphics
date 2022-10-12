public enum GameState {
    INSTANCE;

    private int score = 0;
    private int livesLeft = 3;

    public int score() {
        return score;
    }

    public int livesLeft() {
        return livesLeft;
    }

    public void updateScore(int score) {
        this.score += score;
    }

    public void updateLivesLeft(int livesLeft) {
        this.livesLeft += livesLeft;
    }

    public void reset() {
        score = 0;
        livesLeft = 3;
    }
}
