import java.util.function.Consumer;

public abstract class Menu {
    protected final Consumer<SubMenuOption> subMenuSelectionNotifier;
    protected final PFont TEXT_FONT;

    public Menu(Consumer<SubMenuOption> subMenuSelectionNotifier) {
        this.subMenuSelectionNotifier = subMenuSelectionNotifier;
        TEXT_FONT = createFont("retro-gaming.ttf", 20.0f);
    }

    // TODO: Check if this is ever used
    public void handleKeyReleased(int keyCode) {
        // No-op
    }

    abstract public void handleKeyPressed(int keyCode);

    abstract public void update();
}
