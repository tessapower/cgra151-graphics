public class Geometeroid {
    private final int OFF_SCREEN_BUFFER = 5;
    private final int ROTATION = int(random(0, 360));
    private final int ANGLE_INCREMENT = int(random(-1, 1));
    private final int ALPHA = 200;
    private final PShape polygon;

    private PolygonType type;
    private int sideLength;
    private PVector position = new PVector(random(width), random(height));
    private PVector velocity = PVector.fromAngle(radians(random(360))).mult(int(random(1, 3)));
    private boolean isDestroyed = false;

    public Geometeroid() {
        this(PolygonType.values()[int(random(PolygonType.values().length))]);
    }

    public Geometeroid(PolygonType type) {
        this.type = type;

        sideLength = int(type.getSideLength());

        polygon = createShape();
        polygon.beginShape();
        var angle = TWO_PI / type.numSides();
        for (float a = 0; a < TWO_PI; a += angle) {
            var x = cos(a) * sideLength;
            var y = sin(a) * sideLength;
            polygon.vertex(x, y);
        }
        polygon.noStroke();
        polygon.fill(type.getColor());
        polygon.rotate(radians(ROTATION));
        polygon.endShape(CLOSE);
    }

    public void update() {
        position.add(velocity);
        polygon.rotate(radians(ANGLE_INCREMENT));

        if (position.x > width + OFF_SCREEN_BUFFER) {
            position.x = 0;
        } else if (position.x < -OFF_SCREEN_BUFFER) {
            position.x = width;
        }
        if (position.y > height + OFF_SCREEN_BUFFER) {
            position.y = 0;
        } else if (position.y < -OFF_SCREEN_BUFFER) {
            position.y = height;
        }
    }

    public void draw() {
        shapeMode(CENTER);
        ellipseMode(CENTER);
        pushMatrix();
        translate(position.x, position.y);
        shape(polygon, 0, 0);
        popMatrix();
    }

    public void hit() {
        isDestroyed = type == PolygonType.TRIANGLE;
    }

    public int numSides() {
        return type.numSides();
    }

    public int sideLength() {
        return sideLength;
    }

    public boolean isDestroyed() {
        return isDestroyed;
    }
}
