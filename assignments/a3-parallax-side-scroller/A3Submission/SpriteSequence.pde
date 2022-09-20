import java.awt.*;

/**
 * An animated sequence for a sprite.
 */
public class SpriteSequence {
    private Dimension dimension;
    private PImage[] sprites;
    private int currentFrame = 0;
    private int numFrames;
    private int lastFrame;
    private int frameRate = 3;
    boolean loops;

    public SpriteSequence(PImage spriteSheet, Dimension frameDimension, int rowNum, int numFrames,
        boolean loops) {
        this.dimension = frameDimension;
        this.numFrames = numFrames;
        lastFrame = numFrames - 1;
        this.loops = loops;

        sprites = new PImage[numFrames];
        loadSprites(spriteSheet, rowNum, numFrames);
    }

    public void update(int frameCount) {
        if (loops || currentFrame != lastFrame) {
            currentFrame = (frameCount / frameRate) % numFrames;
        }
    }

    public PImage currentFrame() {
        return sprites[currentFrame];
    }

    public boolean animationEnded() {
        return !loops && currentFrame == lastFrame;
    }
    
    public void reset() {
        currentFrame = 0;
    }

    private void loadSprites(PImage spriteSheet, int rowNum, int numFrames) {
        for (int i = 0; i < numFrames; i++) {
            sprites[i] = spriteSheet.get(i * dimension.width, rowNum * dimension.height,
             dimension.width, dimension.height);
        }
    }
}
