import java.awt.*;

/**
 * Represents the player character that a user can move with their keyboard.
 */
public class Character {
    private final Dimension DIMENSION = new Dimension(56, 56);
    private final PImage SPRITE_SHEET = loadImage("./character/char_blue_sm.png");
    protected State state = new Idling();
    protected Point pos = new Point(0, 0);

    public Character() {}
    
    public void setStartPosition(Point startPos) {
      pos = startPos;
    }

    public void draw(int frameCount, Camera c) {
        state.draw(frameCount, c);
    }
    
    public Dimension dimension() {
      return DIMENSION;
    }

    public void handleKeyPress(int keyCode) {
        state.handleKeyPress(this, keyCode);
    }

    public void handleKeyRelease(int keyCode) {
        state.handleKeyRelease(this, keyCode);
    }

    private int worldToScreenX(Camera c, int x) {
        return (x - c.position().x);
    }

    abstract class State {
        abstract void handleKeyPress(Character self, int keyCode);
        abstract void handleKeyRelease(Character self, int keyCode);
        abstract void draw(int frameCount, Camera c);
        void hit(Character self) {
//            self.state = new Dead();
        }
    }

    class Idling extends State {
        private final SpriteSequence SPRITE_SEQUENCE = new SpriteSequence(
            SPRITE_SHEET,
            DIMENSION,
            0,
            6,
            true
        );

        Idling() {}

        @Override
        public void handleKeyPress(Character self, int keyCode) {
            // TODO: Handle
            println("Key pressed: " + keyCode);
        }

        @Override
        public void handleKeyRelease(Character self, int keyCode) {
            // TODO: Handle
            println("Key released: " + keyCode);
        }

        @Override
        public void draw(int frameCount, Camera c) {
            SPRITE_SEQUENCE.update(frameCount);
            image(SPRITE_SEQUENCE.frame(), worldToScreenX(c, pos.x), pos.y);
        }
    }
//
//    class Attacking implements State {
//        private static final SpriteSequence SPRITE_SEQUENCE = new SpriteSequence(
//            SPRITE_SHEET,
//            DIMENSION,
//            1,
//            8,
//            true
//        );
//
//        Attacking() {
//
//        }
//
//        public void handleInput(Character self, KeyEvent keyEvent) {
//
//        }
//
//        public void draw(int frameCount, Camera c) {
//
//        }
//    }
//
//    class Running implements State {
//        private static final SpriteSequence SPRITE_SEQUENCE = new SpriteSequence(
//            SPRITE_SHEET,
//            DIMENSION,
//            2,
//            8,
//            true
//        );
//
//        Running() {}
//
//        public void handleInput(Character self, KeyEvent keyEvent) {
//
//        }
//
//        public void draw(int frameCount, Camera c) {
//
//        }
//    }
//
//    class Jumping implements State {
//        private static final SpriteSequence SPRITE_SEQUENCE = new SpriteSequence(
//            SPRITE_SHEET,
//            DIMENSION,
//            3,
//            10,
//            true
//        );
//
//        Jumping() {
//
//        }
//
//        public void handleInput(Character self, KeyEvent keyEvent) {
//
//        }
//
//        public void draw(int frameCount, Camera c) {
//
//        }
//
//        @Override
//        public void hit(Character self) {
//            // TODO: handle dying while in mid-air
//            self.state = new Dead();
//        }
//    }
//
//    class Dead implements State {
//        private static final SpriteSequence SPRITE_SEQUENCE = new SpriteSequence(
//            SPRITE_SHEET,
//            DIMENSION,
//            4,
//            12,
//            true
//        );
//
//        Dead() {
//        }
//
//        public void handleInput(Character self, KeyEvent keyEvent) {
//            // No-op: doesn't respond to key events
//        }
//
//        public void draw(int frameCount, Camera c) {
//
//        }
//
//        @Override
//        public void hit(Character self) {
//            // No-op: already dead!
//        }
//    }
}
