public class Bird {

  float x;
  float y;
  Bird(float tempx, float tempy){
    x = tempx;
    y = tempy;
  }
  public void move(float speed) {
    x = x - speed;
    y = y + random(-2,2);
  }
  public void display(){
    pushMatrix(); // Save the current transformation matrix
    translate(x, y); // Move the bird to the desired position
    scale(0.4); // Scale the bird down by a factor of 5
    strokeWeight(4);
    stroke(0);    
    // Tail and body
    noStroke();
    fill(197,90,17);
    triangle(464, 210, 523, 214, 471, 253);
    fill(136,60,12);
    circle(396, 251, 160);
    fill(197,90,17);
    ellipse(407, 258, 122, 35);
    fill(212,67,22);
    circle(339, 258, 10);
    circle(364, 287, 10);
    circle(397, 308, 10);
    // Head
    fill(191,144,0);
    triangle(206, 199, 255, 180, 256, 190);
    fill(197,90,17);
    circle(298, 181, 94);
    fill(255,255,255);
    ellipse(270, 167, 20, 31);
    fill(0);
    circle(267, 162, 4);
    popMatrix(); // Restore the previous transformation matrix
    }
    
  public void resetPosition(float canvasWidth, float yPos) {
    x = canvasWidth; // Set the X position to the canvas width
    y = yPos; // Set the Y position
  }
  
  public float getWidth() {
    return 464 * 0.4; // Adjust the value based on your bird's actual width
  }

}
