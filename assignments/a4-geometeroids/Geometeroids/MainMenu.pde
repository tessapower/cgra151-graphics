import java.util.function.Consumer;
import java.util.Map;
import java.awt.*;
import java.awt.event.KeyEvent;

class MainMenu extends Menu {
    private final Button play = new Button("Play");
    private final Button howToPlay = new Button("How to Play");
    private final Button highScores = new Button("High Scores");
    private final Button credits = new Button("Credits");
    private final ButtonGroup buttonGroup = new ButtonGroup(play, howToPlay, highScores, credits);
    private final Map<Button, SubMenuOption> buttonActions = Map.of(
            play, SubMenuOption.PLAY,
            howToPlay, SubMenuOption.HOW_TO_PLAY,
            highScores, SubMenuOption.HIGH_SCORES,
            credits, SubMenuOption.CREDITS
    );

    public MainMenu(Consumer<SubMenuOption> subMenuSelectionNotifier) {
        super(subMenuSelectionNotifier);
    }

    @Override
    public void handleKeyPressed(int keyCode) {
        // Handle selecting a menu or moving up and down
        switch(keyCode) {
            case KeyEvent.VK_UP: buttonGroup.previous(); break;
            case KeyEvent.VK_DOWN: buttonGroup.next(); break;
            case KeyEvent.VK_ENTER: {
                Button focussed = buttonGroup.getFocussed();
                if (focussed != null) {
                    SubMenuOption option = buttonActions.get(focussed);
                    if (option != null) {
                        subMenuSelectionNotifier.accept(option);
                    }
                }
                break;
            }
        }
    }

    @Override
    public void update() {
        buttonGroup.buttons().forEach(Button::draw);
    }
}
