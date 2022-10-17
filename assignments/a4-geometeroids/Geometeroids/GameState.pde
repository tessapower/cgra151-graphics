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

    public boolean playerDied() {
        return livesLeft() == 0;
    }

    public void addPoints(int score) {
        this.score += score;
        if (score % 100 == 0) {
            livesLeft++;
        }
    }

    public void loseALife() {
        livesLeft--;
    }

    public void reset() {
        score = 0;
        livesLeft = 3;
    }

    public boolean isGameOver() {
        return livesLeft == 0;
    }
}
