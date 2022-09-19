import java.awt.*;

/**
 * Represents an animated sequence for a sprite.
 */
public class SpriteSequence {
    private Dimension dimension;
    private PImage[] sprites;
    private int currentFrame = 0;
    private int numFrames;
    private int frameRate = 10;
    boolean loops;

    public SpriteSequence(PImage spriteSheet, Dimension frameDimension, int rowNum, int numFrames,
        boolean loops) {
        this.dimension = frameDimension;
        this.numFrames = numFrames;
        this.loops = loops;

        sprites = new PImage[numFrames];
        loadSprites(spriteSheet, rowNum, numFrames);
    }

    public void update(int frameCount) {
        // TODO: handle non-looping sprite sequences, what if last frame is skipped?
        currentFrame = (frameCount / frameRate) % numFrames;
    }

    public PImage frame() {
        return sprites[currentFrame];
    }

    private void loadSprites(PImage spriteSheet, int rowNum, int numFrames) {
        for (int i = 0; i < numFrames; i++) {
            sprites[i] = spriteSheet.get(i * dimension.width, rowNum * dimension.height,
             dimension.width, dimension.height);
        }
    }
}
