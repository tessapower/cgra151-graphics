public class HighScores {
    private static final int MAX_TO_SAVE = 5;
    private IntList scores = new IntList();

    public HighScores() {
        loadScoresFromFile();
    }

    private void loadScoresFromFile() {
        // load scores from file
        var entries = loadJSONArray("highscores.json");
        scores.clear();

        if (entries != null) {
            for (int i = 0; i < entries.size(); i++) {
                scores.append(entries.getInt(i));
            }
            scores.sortReverse();
        }
    }

    public IntList getScores() {
        return scores.copy();
    }

    public boolean isHighScore(int score) {
        return score > scores.min();
    }

    public void addScore(int score) {
        scores.append(score);
        scores.sortReverse();
        while (scores.size() > MAX_TO_SAVE) {
            scores.remove(MAX_TO_SAVE);
        }
        saveScoresToFile();
    }

    private void saveScoresToFile() {
        // save scores to file
        var entries = new JSONArray();
        for (int i = 0; i < scores.size(); i++) {
            entries.append(scores.get(i));
        }

        saveJSONArray(entries, "highscores.json");
    }
}
