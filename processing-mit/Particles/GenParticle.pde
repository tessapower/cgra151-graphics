public class GenParticle extends Particle {
    private PVector origin = new PVector();

    GenParticle(PVector pos, PVector velocity, float radius) {
        super(pos, velocity, radius);
        this.origin = pos.copy();
    }

    public void regenerate() {
        if ((position.x > width + radius)
            || (position.x < -radius)
            || (position.y > height + radius)) {
            position = origin.copy();
            velocity = new PVector(random(-0.7, 0.7), random(-2, 0));
        }
    }
}
