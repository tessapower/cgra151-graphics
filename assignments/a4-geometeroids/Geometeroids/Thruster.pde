public class Thruster {
    private final PShape bigThruster;
    private final PShape mediumThruster;
    private final PShape miniThruster;

    public Thruster() {
        bigThruster = createShape(TRIANGLE, -6, 23, 6, 23, 0, 50);
        bigThruster.setFill(color(255, 0, 0));
        bigThruster.setStroke(false);

        mediumThruster = createShape(TRIANGLE, -6, 22, 5, 22, 0, 42);
        mediumThruster.setFill(color(255, 165, 0));
        mediumThruster.setStroke(false);

        miniThruster = createShape(TRIANGLE, -2, 24, 7, 24, 0, 34);
        miniThruster.setFill(color(255, 204, 0));
        miniThruster.setStroke(false);
    }

    public void draw() {
        shape(bigThruster, random(-2, 2), random(-2, 2));
        if (random(0, 1) > 0.5) {
            shape(mediumThruster, random(-2, 2), random(-2, 2));
        }

        if (random(0, 1) > 0.7) {
            shape(miniThruster, random(-2, 2), random(-2, 2));
        }
    }

    public void rotate(float angleRadians) {
        bigThruster.rotate(angleRadians);
        mediumThruster.rotate(angleRadians);
        miniThruster.rotate(angleRadians);
    }
}
