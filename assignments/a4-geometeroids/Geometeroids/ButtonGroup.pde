import java.util.stream.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * This is a quick and dirty "radio-group-like" management for buttons, where only a single
 * button can be focussed at a time. This suffices for all the use cases in Geometeroids.
 */
public class ButtonGroup {
    private final List<Button> buttons;
    private int focusIdx;
    private float verticalButtonGap = Button.FONT_SIZE * 1.5f;

    public ButtonGroup(Button... buttons) {
        this.buttons = new ArrayList<>(buttons.length);
        this.buttons.addAll(Arrays.asList(buttons));

        // Shift position of each button down to create a "stack" effect
        for (int i = 0; i < this.buttons.size(); i++) {
            this.buttons.get(i).setPosition(new Point(width / 2, int((height / 2) + i * verticalButtonGap)));
        }

        // Set first button as default focussed
        setFocussed(this.buttons.get(0));
        focusIdx = 0;
    }

    public void next() {
        if (focusIdx < buttons.size() - 1) {
            buttons.get(focusIdx).setFocussed(false);
            focusIdx++;
            buttons.get(focusIdx).setFocussed(true);
        }
    }

    public void previous() {
        if (focusIdx > 0) {
            buttons.get(focusIdx).setFocussed(false);
            focusIdx--;
            buttons.get(focusIdx).setFocussed(true);
        }
    }

    public Button getFocussed() {
        return buttons.get(focusIdx);
    }

    private void setFocussed(Button button) {
        buttons.stream().filter(b -> b != button).forEach(b -> b.setFocussed(false));
        buttons.get(buttons.indexOf(button)).setFocussed(true);
    }

    public List<Button> buttons() {
        return buttons;
    }
}
