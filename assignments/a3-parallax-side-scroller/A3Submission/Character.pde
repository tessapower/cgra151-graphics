import java.awt.*;
import java.awt.event.KeyEvent;

/**
 * Represents the player character that a user can move with their keyboard.
 */
public class Character {
    private final Dimension DIMENSION = new Dimension(56, 56);
    private final PImage SPRITE_SHEET = loadImage("./character/char_blue_sm.png");
    
    protected State state = new Idling(Direction.RIGHT);
    protected Point pos = new Point(0, 0);
    protected int xVel = 0;
    protected int yVel = 0;

    public Character() {}
    
    public void setStartPosition(Point startPos) {
        pos = startPos;
    }

    public void draw(int frameCount, Camera c) {
        pos.x += xVel;
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
    
    public Point position() {
        return pos;
    }

    abstract class State {
        Direction direction;
        
        public State(Direction direction) {
            this.direction = direction;
        }
        
        abstract void handleKeyPress(Character self, int keyCode);
        abstract void handleKeyRelease(Character self, int keyCode);
        abstract SpriteSequence spriteSequence();
        
        public void draw(int frameCount, Camera c) {
            spriteSequence().update(frameCount);
            PImage sprite = spriteSequence().currentFrame(); //<>//
            //if (direction == Direction.LEFT) {
            //    pushMatrix();
            //    scale(-1, 1);
            //    translate(worldToScreenX(c, pos.x) * -5, 0);
            //    image(sprite, worldToScreenX(c, pos.x), pos.y);
            //    popMatrix();
            //} else {
                image(sprite, worldToScreenX(c, pos.x), pos.y);
            //}
        }
        
        public void hit(Character self) {
//            self.state = new Dead();
        }
    }

    class Idling extends State {
        private final int RUNNING_SPEED = 7;
        private final SpriteSequence SPRITE_SEQUENCE = new SpriteSequence(
            SPRITE_SHEET,
            DIMENSION,
            0,
            6,
            true
        );

        Idling(Direction direction) {
            super(direction);
            spriteSequence().reset();
        }

        @Override
        public void handleKeyPress(Character self, int keyCode) {
            // TODO: Handle
            switch(keyCode) {
                case KeyEvent.VK_D: {
                    self.xVel = RUNNING_SPEED;
                    self.state = new Running(Direction.RIGHT);
                    break;
                }
                case KeyEvent.VK_A: {
                    self.xVel = -RUNNING_SPEED;
                    self.state = new Running(Direction.LEFT);
                    break;
                }
                case KeyEvent.VK_SPACE: println("jump!"); break;
                case KeyEvent.VK_ENTER: println("attack!"); break;
            }
        }

        @Override
        public void handleKeyRelease(Character self, int keyCode) {
            // No-op: doesn't respond to key events
        }
        
        @Override
        public SpriteSequence spriteSequence() {
            // TODO: Return sprite sequence based on facing left or right.
            return SPRITE_SEQUENCE;
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

    class Running extends State {
        private final SpriteSequence SPRITE_SEQUENCE = new SpriteSequence(
            SPRITE_SHEET,
            DIMENSION,
            2,
            8,
            true
        );

        Running(Direction direction) {
            super(direction);
            spriteSequence().reset();
        }

        @Override
        public void handleKeyPress(Character self, int keyCode) {
            switch(keyCode) {
                case KeyEvent.VK_D: direction = Direction.RIGHT; break;
                case KeyEvent.VK_A: direction = Direction.LEFT; break;
                case KeyEvent.VK_SPACE: println("jump!"); break;
                case KeyEvent.VK_ENTER: println("attack!"); break;
            }
        }

        @Override
        public void handleKeyRelease(Character self, int keyCode) {
            switch(keyCode) {
                case KeyEvent.VK_D: {
                    self.xVel = 0;
                    self.state = new Idling(Direction.RIGHT);
                    break;
                }
                case KeyEvent.VK_A: {
                    self.xVel = 0;
                    self.state = new Idling(Direction.LEFT);
                    break;
                }
                case KeyEvent.VK_SPACE: println("jump!"); break;
                case KeyEvent.VK_ENTER: println("attack!"); break;
            }
        }
        
        @Override
        public SpriteSequence spriteSequence() {
            return SPRITE_SEQUENCE;
        }
    }
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
