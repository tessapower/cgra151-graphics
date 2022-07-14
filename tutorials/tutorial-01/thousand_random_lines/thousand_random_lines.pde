size(400, 400);
background(0);
stroke(255, 255, 0);

for (var i = 0; i < 1000; ++i) {
  line(random(0, width), random(0, height), random(0, width), random(0, height));
}
