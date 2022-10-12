public class Explosion {
    private List<Particle> particles = new ArrayList<>();
    protected color c;

    public Explosion(PVector position, int numParticles, color c) {
        this.c = c;

        for(int i = 0; i < numParticles; ++i) {
            var particle = new Particle(position);
            particles.add(particle);
        }
    }

    public void update() {
        particles.forEach(Particle::update);
    }

    public void draw() {
        particles.forEach(Particle::draw);
    }

    public boolean isDone() {
        return particles.stream().noneMatch(Particle::isVisible);
    }

    class Particle {
        private PVector position;
        private PVector velocity;
        private float radius;
        private float shrinkRate;

        private boolean visible;

        public Particle(PVector position) {
            this.position = position.copy();
            velocity = PVector.fromAngle(radians(random(360))).mult(random(0.5f, 2.0f));
            radius = random(2.0f, 5.0f);
            shrinkRate = random(-0.3f, -0.1f);
            visible = true;
        }

        public void draw() {
            if (visible) {
                noStroke();
                fill(c);
                ellipse(position.x, position.y, 2 * radius, 2 * radius);
            }
        }

        public void update() {
            position.add(velocity);
            radius += shrinkRate;
            visible = radius > 1;
        }

        public boolean isVisible() {
            return visible;
        }
    }
}
