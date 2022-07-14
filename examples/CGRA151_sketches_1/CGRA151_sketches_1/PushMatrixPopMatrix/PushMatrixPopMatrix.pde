/* draws two boxes, one at (100,100) the other at (200,100)
 * the boxes spin once the mouse is moved into the window
 * spinning speed depends on mouse position
 *
 * this demonstrates the use of multiple transformations
 * and of pushMatrix() and popMatrix()
 */

float angle=0.0;
void setup() {
  size(300, 200);
}
void draw() {
  // increase angle depending on x position of mouse
  angle += mouseX/1000.0;
  
  // draw first box centred at (100,100)
  translate(100, 100);
  pushMatrix();
    rotate(angle);
    rect(-20, -20, 40, 40);
  // this pushMatrix()/popMatrix() pair means the rotation is applied only to this box
  popMatrix();
  
  // draw second box centred 100 units to right of first box
  translate(100, 0);
  pushMatrix();
    rotate(angle);
    rect(-20, -20, 40, 40);
  // this pushMatrix()/popMatrix() pair is not strictly needed, because there is nothing drawn after this, but it helps to put it in in case we do add something else
  popMatrix();
}