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
        state.handleKeyPress(this, keyCode);
    }

    public void handleKeyRelease(int keyCode) {
        state.handleKeyRelease(this, keyCode);
    }

    public Point position() {
        return pos;
    }

    abstract class State {
        protected final int RUNNING_SPEED = 7;
        protected final int JUMP_HEIGHT = -7;
        protected Direction direction;

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
    }

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
        public void handleKeyPress(Character self, int keyCode) {
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
                case KeyEvent.VK_SPACE: {
                    self.yVel = JUMP_HEIGHT;
                    self.state = new Jumping(direction, self);
                    break;
                }
            }
        }

        @Override
        public void handleKeyRelease(Character self, int keyCode) {
            // No-op: doesn't respond to release key events
        }

        @Override
        public SpriteSequence spriteSequence() {
            return SPRITE_SEQUENCE;
        }
    }

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
                case KeyEvent.VK_SPACE: {
                    self.yVel = JUMP_HEIGHT;
                    self.state = new Jumping(direction, self);
                    break;
                }
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
            }
        }

        @Override
        public SpriteSequence spriteSequence() {
            return SPRITE_SEQUENCE;
        }
    }

    class Jumping extends State {
        private final SpriteSequence SPRITE_SEQUENCE = new SpriteSequence(
            SPRITE_SHEET,
            DIMENSION,
            3,
            10,
            false
        );
        private final int GRAVITY = 1;

        private Character outer;

        Jumping(Direction direction, Character self) {
          super(direction);
          spriteSequence().reset();
          
          outer = self;
        }

        @Override
        public void draw(int frameCount, Camera c) {
            super.draw(frameCount, c);
            outer.yVel += GRAVITY;

            if (outer.position().y == outer.groundY) {
                outer.state = (outer.xVel != 0 ? new Running(direction) : new Idling(direction));
            }
        }

        @Override
        public void handleKeyPress(Character self, int keyCode) {
            switch(keyCode) {
                case KeyEvent.VK_D: {
                    self.xVel = RUNNING_SPEED;
                    break;
                }
                case KeyEvent.VK_A: {
                    self.xVel = -RUNNING_SPEED;
                    break;
                }
            }
        }

        @Override
        public void handleKeyRelease(Character self, int keyCode) {
            switch(keyCode) {
                case KeyEvent.VK_D: {
                    self.xVel = 0;
                    break;
                }
                case KeyEvent.VK_A: {
                    self.xVel = 0;
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
