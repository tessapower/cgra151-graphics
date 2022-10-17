// This represents all of the different polygon shapes
public enum PolygonType {
    TRIANGLE(3, Colors.Polygons.TRIANGLE),
    SQUARE(4,   Colors.Polygons.SQUARE),
    PENTAGON(5, Colors.Polygons.PENTAGON),
    HEXAGON(6,  Colors.Polygons.HEXAGON),
    HEPTAGON(7, Colors.Polygons.HEPTAGON),
    OCTAGON(8,  Colors.Polygons.OCTAGON);

    private int numSides;
    private color c;

    PolygonType(int numSides, int c) {
        this.numSides = numSides;
        this.c = c;
    }

    public int numSides() {
        return numSides;
    }

    public color getColor() {
        return c;
    }

    public int getSideLength() {
        return numSides * 3;
    }
}
