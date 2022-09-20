import java.awt.*;
import java.awt.event.KeyEvent;

/**
 * The character that a player can move around the screen.
 */
public class Character {
    private final Dimension DIMENSION = new Dimension(56, 56);
    private final PImage SPRITE_SHEET = loadImage("./character/char_blue_sm.png");

    protected State state = new Idling(Direction.RIGHT);

    protected Point pos = new Point(0, 0);

    protected int groundY;
    protected int xVel = 0;
    protected int yVel = 0;

    public Character() {}

    public void setStartPosition(Point startPos) {
        pos = startPos;
        groundY = startPos.y;
    }

    public void draw(int frameCount, Camera c) {
        pos.x += (pos.x + xVel < 0 ? 0 : xVel);
        pos.y += (pos.y + yVel > groundY ? 0 : yVel);
        state.draw(frameCount, c);
    }
    
    public Dimension dimension() {
        return DIMENSION;
    }

    public int speed() {
      return xVel;
    }

    public void handleKeyPress(int keyCode) {
        state.handleKeyPress(keyCode);
    }

    public void handleKeyRelease(int keyCode) {
        state.handleKeyRelease(keyCode);
    }

    public Point position() {
        return pos;
    }

    // ----------------------------------------------------------------------------- States --//

    /**
     * The state of a character, e.g. running, attacking, jumping.
     */
    abstract class State {
        protected final int RUNNING_SPEED = 7;
        protected final int JUMP_HEIGHT = -7;
        protected Direction direction;

        public State(Direction direction) {
            this.direction = direction;
        }

        abstract void handleKeyPress(int keyCode);
        abstract void handleKeyRelease(int keyCode);
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
    }

    /**
     * Represents when the character is doing nothing and handles transitions from this state.
     */
    class Idling extends State {
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
        public void handleKeyPress(int keyCode) {
            switch(keyCode) {
                case KeyEvent.VK_D: {
                    xVel = RUNNING_SPEED;
                    state = new Running(Direction.RIGHT);
                    break;
                }
                case KeyEvent.VK_A: {
                    xVel = -RUNNING_SPEED;
                    state = new Running(Direction.LEFT);
                    break;
                }
                case KeyEvent.VK_SPACE: {
                    yVel = JUMP_HEIGHT;
                    state = new Jumping(direction);
                    break;
                }
            }
        }

        @Override
        public void handleKeyRelease(int keyCode) {
            // No-op: doesn't respond to release key events
        }

        @Override
        public SpriteSequence spriteSequence() {
            return SPRITE_SEQUENCE;
        }
    }

    /**
     * Represents when the character is running and handles transitions from this state.
     */
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
        public void handleKeyPress(int keyCode) {
            switch(keyCode) {
                case KeyEvent.VK_D: direction = Direction.RIGHT; break;
                case KeyEvent.VK_A: direction = Direction.LEFT; break;
                case KeyEvent.VK_SPACE: {
                    yVel = JUMP_HEIGHT;
                    state = new Jumping(direction);
                    break;
                }
            }
        }

        @Override
        public void handleKeyRelease(int keyCode) {
            switch(keyCode) {
                case KeyEvent.VK_D: {
                    xVel = 0;
                    state = new Idling(Direction.RIGHT);
                    break;
                }
                case KeyEvent.VK_A: {
                    xVel = 0;
                    state = new Idling(Direction.LEFT);
                    break;
                }
            }
        }

        @Override
        public SpriteSequence spriteSequence() {
            return SPRITE_SEQUENCE;
        }
    }

    /**
     * Represents when the character is jumping and handles transitions from this state.
     */
    class Jumping extends State {
        private final SpriteSequence SPRITE_SEQUENCE = new SpriteSequence(
            SPRITE_SHEET,
            DIMENSION,
            3,
            10,
            false
        );
        private final int GRAVITY = 1;

        Jumping(Direction direction) {
          super(direction);
          spriteSequence().reset();
        }

        @Override
        public void draw(int frameCount, Camera c) {
            super.draw(frameCount, c);
            yVel += GRAVITY;

            if (pos.y == groundY) {
                state = (xVel != 0 ? new Running(direction) : new Idling(direction));
            }
        }

        @Override
        public void handleKeyPress(int keyCode) {
            switch(keyCode) {
                case KeyEvent.VK_D: {
                    xVel = RUNNING_SPEED;
                    break;
                }
                case KeyEvent.VK_A: {
                    xVel = -RUNNING_SPEED;
                    break;
                }
            }
        }

        @Override
        public void handleKeyRelease(int keyCode) {
            switch(keyCode) {
                case KeyEvent.VK_D: {
                    xVel = 0;
                    break;
                }
                case KeyEvent.VK_A: {
                    xVel = 0;
                    break;
                }
            }
        }

        @Override
        public SpriteSequence spriteSequence() {
            return SPRITE_SEQUENCE;
        }
    }
}
