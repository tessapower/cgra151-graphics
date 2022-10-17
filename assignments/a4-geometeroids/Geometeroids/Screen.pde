public interface Screen {
    void handleKeyPressed(int keyCode);
    void handleKeyReleased(int keyCode);
    ScreenIdentifier screen();
    void update();
}
