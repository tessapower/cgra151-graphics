float angle = 1.57;
float t = 10;
PShape obj;

void setup() {
  size(1024, 512, P3D);

  obj = loadShape("low-poly-mill.obj");
//  obj.rotateZ(3.14);
//  obj.scale(1.5);
  
}

void draw() {
  background(255);
  lights();
  camera(0, -200, height,
    0, -50, 0,
    0, 1, 0);
//camera position X Y Z  (float)    x y z-coordinate for the camera
//center X Y Z (float)  x y z-coordinate for the center of the scene
//up X Y Z  (float)     usually 0.0, 1.0, or -1.0
  
//  rotateY(angle);
//  translate(t, 0, 0); 
  shape(obj);

//  angle += 0.2;   
//  t += 5;


//  translate(t, 30* cos(angle * 2), 0); 

//  pieta.rotateZ(.2);
//  pieta.scale(1.02, 1.02, 1.02);
//  pieta.rotateY(.1);
}


float concentration;
float viewOff;

PVector half = new PVector();
PVector mouse = new PVector();

void draw_2() {
//  background(0xff000000);
  background(0xffffffff);
  lights();
  camera(0, -200, height,
    0, -50, 0,
    0, 1, 0);

  lightSpecular(64, 64, 64);

  // Horizonal light.
  spotLight(0, 127, 255,
    -half.x, sin(frameCount * .02) * half.y, 0,
    1, 0, 0,
    PI, 25);

  // Vertical light.
  spotLight(0, 255, 127,
    cos(frameCount * .02) * half.x, -half.y, 0,
    0, 1, 0,
    PI, 25);

  // Flash light.
  spotLight(191, 170, 133,
    0, 0, viewOff,
    mouse.x, mouse.y, -1,
    angle, concentration);

  shape(obj);
  obj.rotateY(.01);

  concentration = map(cos(frameCount * .01), -1, 1, 12, 100);
  mouse.set(mouseX - half.x, mouseY - half.y, viewOff);
  mouse.normalize();
}

//  angle = QUARTER_PI;
//  viewOff = height * .86602;
//  half.set(width * .5, height * .5);
