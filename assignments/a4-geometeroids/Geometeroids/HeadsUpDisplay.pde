// A HUD to display the current state of the game
public class HeadsUpDisplay {
    private static final String SCORE = "SCORE: ";
    private static final String LIVES = "LIVES: ";
    private static final float HUD_FONT_SIZE = 30.0f;
    private static final int BUFFER = 10;

    private final PFont hudFont = createFont("retro-gaming.ttf", HUD_FONT_SIZE);

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
    }

    private String padZeroes(int number, int length) {
        var str = Integer.toString(number);

        while (str.length() < length) {
            str = "0" + str;
        }

        return str;
    }
}
