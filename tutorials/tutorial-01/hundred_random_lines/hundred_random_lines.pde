size(400, 400);
background(0);
stroke(255, 255, 0);

for (var i = 0; i < 100; ++i) {
  line(0, 0, random(0, width), random(0, height));
}
