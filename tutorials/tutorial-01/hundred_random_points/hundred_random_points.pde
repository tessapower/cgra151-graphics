// Set the background and foreground colors using:
// greyscale (0 - 255)
// rbg(r, g, b) where r, g, b are values from 0 - 255
background(0);
stroke(255);

for (var i = 0; i < 100; ++i) {
  point(random(0, 100), random(0, 100));
}
