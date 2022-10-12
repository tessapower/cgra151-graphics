public class HeadsUpDisplay {
    private static final String SCORE = "SCORE: ";
    private static final String LIVES = "LIVES: ";
    private static final float HUD_FONT_SIZE = 30.0f;
    private static final float HELP_FONT_SIZE = 14.0f;
    private static final int BUFFER = 10;

    private final PFont hudFont = createFont("retro-gaming.ttf", HUD_FONT_SIZE);
    private final PFont helpFont = createFont("retro-gaming.ttf", HELP_FONT_SIZE);

    public HeadsUpDisplay() {}

    public void draw() {
        fill(0, 155);
        noStroke();
        rect(0, 0, 475, 50);
        fill(255);

        textFont(hudFont);
        textAlign(LEFT, TOP);
        textSize(HUD_FONT_SIZE);
        var scoreboard = SCORE + padZeroes(GameState.INSTANCE.score(), 5) + "  ";
        scoreboard += LIVES + padZeroes(GameState.INSTANCE.livesLeft(), 2);
        text(scoreboard, BUFFER, BUFFER);

        textFont(helpFont);
        textAlign(RIGHT, BOTTOM);
        textSize(HELP_FONT_SIZE);
        text("Press 'P' to pause", width - BUFFER, height - BUFFER);
    }

    private String padZeroes(int number, int length) {
        String numberStr = Integer.toString(number);
        while (numberStr.length() < length) {
            numberStr = "0" + numberStr;
        }
        return numberStr;
    }
}
