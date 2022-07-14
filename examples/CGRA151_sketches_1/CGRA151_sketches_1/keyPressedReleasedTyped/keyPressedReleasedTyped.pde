// Run this program to learn how each of these functions
// relate to the others.

void setup(){ frameRate(60) ; }

void draw() { } // Empty draw() needed to keep the program running

void keyPressed() {
  println( char(key) + " pressed " + int(key) + " " + keyCode);
}

void keyTyped() {
  println( char(key) + " typed " + int(key) + " " + keyCode);
}

void keyReleased() {
  println( char(key) + " released " + int(key) + " " + keyCode);
}