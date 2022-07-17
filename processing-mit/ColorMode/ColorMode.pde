// Color Modes allow you to specify a different colorspace for the sketch
// RGB vs. HSB (Hue, Saturation, Brightness)

size(350, 100);

// Hex Colors
// Use hex colors in place of color values by including the #
background(#FFFFFF);

// Set Color Range for RGB values from 0.0 to 1.0
// colorMode(RGB, 1.0);

// Set the range for the hue to values from 0 to 360 (color wheel), and the saturation and brightness values
// from 0 to 100 (%)
colorMode(HSB, 360, 100, 100);

// Change the hue, same saturation and brightness
noStroke();
// Left Red
fill(0, 100, 100);
rect(0, 0, 25, 100);
// Left Green
fill(90, 100, 100);
rect(25, 0, 25, 100);
// Left Blue
fill(180, 100, 100);
rect(50, 0, 25, 100);
// Left Purple
fill(270, 100, 100);
rect(75, 0, 25, 100);

// Change the saturation, same hue and brightness
fill(180, 0, 80);
rect(125, 0, 25, 100);

fill(180, 25, 80);
rect(150, 0, 25, 100);

fill(180, 50, 80);
rect(175, 0, 25, 100);

fill(180, 75, 80);
rect(200, 0, 25, 100);

// Change the brightness, same hue and saturation

fill(180, 42, 0);
rect(250, 0, 25, 100);

fill(180, 42, 25);
rect(275, 0, 25, 100);

fill(180, 42, 50);
rect(300, 0, 25, 100);

fill(180, 42, 75);
rect(325, 0, 25, 100);
