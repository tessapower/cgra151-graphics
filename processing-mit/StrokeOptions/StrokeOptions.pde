// Stroke Options
// stroke();                             -> Enable stroke
// noStroke();                           -> Disable stroke
// stroke(x);                            -> Set stroke grayscale color of 0 - 255 (default: 0)
// stroke(x, y);                         -> Set stroke grayscale color and transparency of 0 - 255 (default: 255, opaque)
// stroke(r, g, b);                      -> Set stroke rbg color, each with 0 - 255
// strokeWeight(x);                      -> Set stroke weight/thickness (default: 1)
// strokeCap(ROUND | SQUARE | PROJECT);  -> Set how end of stroke looks
// strokeJoin(BEVEL | MITER | ROUND);    -> Set how corners look

size(100, 200);

line(20, 20, 80, 20); // Default line with weight of 1
strokeWeight(6);
line(20, 30, 80, 30); // Thicker line
strokeWeight(18);
line(20, 50, 80, 50); // Thickest line

strokeWeight(12);
strokeCap(ROUND);
line(20, 80, 80, 80);  
strokeCap(SQUARE);
line(20, 100, 80, 100);
strokeCap(PROJECT);
line(20, 120, 80, 120);

strokeJoin(BEVEL);
rect(12, 150, 15, 30);
strokeJoin(MITER);
rect(42, 150, 15, 30);
strokeJoin(ROUND);
rect(72, 150, 15, 30);