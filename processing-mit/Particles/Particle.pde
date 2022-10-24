public class Particle {
    protected PVector position = new PVector();
    protected PVector velocity = new PVector();
    protected float radius = 0;
    protected float gravity = 0.1;

    public Particle(PVector position, PVector velocity, float radius) {
        this.position = position;
        this.velocity = velocity;
        this.radius = radius;
    }

    public void update() {
        velocity.y += gravity;
        position.add(velocity);
    }

    public void display() {
        ellipse(position.x, position.y, radius * 2, radius * 2);
    }
}
