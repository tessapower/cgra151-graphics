// The Blend Mode sets how transparent colors blend together when overlapping.
// BLEND, ADD, SUBTRACT, DARKEST, LIGHTEST, DIFFERENCE, EXCLUSION, MULTIPLY, SCREEN, REPLACE

size(500, 100);
stroke(200, 150, 48, 204);
strokeWeight(12);
background(0);

int minY = 20;
int maxY = 80;
int leftX = 20;
int rightX = 40;
int increment = 20;

// Default
line(leftX, minY, rightX, maxY);
line(rightX, minY, leftX, maxY);

leftX = rightX + increment;
rightX = leftX + increment;

blendMode(ADD);
line(leftX, minY, rightX, maxY);
line(rightX, minY, leftX, maxY);

leftX = rightX + increment;
rightX = leftX + increment;

blendMode(SUBTRACT);
line(leftX, minY, rightX, maxY);
line(rightX, minY, leftX, maxY);

leftX = rightX + increment;
rightX = leftX + increment;

blendMode(DARKEST);
line(leftX, minY, rightX, maxY);
line(rightX, minY, leftX, maxY);

leftX = rightX + increment;
rightX = leftX + increment;

blendMode(LIGHTEST);
line(leftX, minY, rightX, maxY);
line(rightX, minY, leftX, maxY);

leftX = rightX + increment;
rightX = leftX + increment;

blendMode(DIFFERENCE);
line(leftX, minY, rightX, maxY);
line(rightX, minY, leftX, maxY);

leftX = rightX + increment;
rightX = leftX + increment;

blendMode(EXCLUSION);
line(leftX, minY, rightX, maxY);
line(rightX, minY, leftX, maxY);

leftX = rightX + increment;
rightX = leftX + increment;

blendMode(MULTIPLY);
line(leftX, minY, rightX, maxY);
line(rightX, minY, leftX, maxY);

leftX = rightX + increment;
rightX = leftX + increment;

blendMode(SCREEN);
line(leftX, minY, rightX, maxY);
line(rightX, minY, leftX, maxY);

leftX = rightX + increment;
rightX = leftX + increment;

blendMode(REPLACE);
line(leftX, minY, rightX, maxY);
line(rightX, minY, leftX, maxY);
