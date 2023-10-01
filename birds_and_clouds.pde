Table xy;
Table windSpeed;
Table windDirection;
int index = 0;
int windS = 0;
int windD = 0;
int count = 0;
int positionX = 0;
int size = 5;
int offsetY = 200;
float birdX = 500; 
float birdY = 100;
float birdSpeed = 0.4;
Bird b1;

int tableDay = 02;
int tableMonth = 01;
int tableYear = 2023;

float randomStart = random(1, 1); //randomiser for the index starting point, editable
//float randomHeight = random(20, 30); //randomiser for the circle height, editable (UNUSUABLE)
int randomInt = (int)randomStart;

void setup() {
  size(700, 300);
  // load the data for a humidity censor in csv format.
  // reference link :
  // https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=2023-08-27T09:07:28.885&rToDate=2023-08-28T09:07:28.885&rFamily=weather&rSensor=WS#collapseFour
  
  xy = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=" + tableYear + "-" + tableMonth + "-" + tableDay + "T09:07:28.885&rToDate=2023-08-28T09:07:28.885&rFamily=weather&rSensor=WS#collapseFour", "csv");
  windSpeed = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=" + tableYear +"-" + tableMonth +"-" + tableDay + "T22%3A58%3A56&rToDate=2023-09-30T22%3A57%3A43&rFamily=weather&rSensor=WS", "csv");
  windDirection = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=" + tableYear +"-" + tableMonth +"-" + tableDay + "T22%3A58%3A56&rToDate=2023-09-30T22%3A57%3A43&rFamily=weather&rSensor=WD", "csv");
  index += randomInt;
  background(0, 204, 255);
  fill(0, 204, 0);
  rect(0, 200, 700, 150);
  b1 = new Bird(birdX, birdY);
}

void draw() {
    background(0, 204, 255);
    fill(0, 204, 0);
    rect(0, 200, 700, 150);
    //xy (humidty sensor) grass representation
    //if (index < xy.getRowCount()) {
    //  // read the 2nd column (the 1), and read the row based on index which increments each draw()
    //  float y = xy.getFloat(index, 1); // index is the row, 1 is the column with the data.
    //  fill(0, 153, 51);
    //  ellipse (positionX,  y + offsetY, size, size - random(10, 50)); //random editable
    //  positionX += 5;
    //  index++;
    //}
    if (windS < windSpeed.getRowCount()){
      float x = windSpeed.getFloat(windS, 1);
      b1.move(x);
      b1.display();
      windS++;
    }
    
    // Wind direction sensor cloud representation
    
}


//void drawBird() {
//  pushMatrix(); // Save the current transformation matrix
//  translate(birdX, birdY); // Move the bird to the desired position
//  scale(0.4); // Scale the bird down by a factor of 5
//  strokeWeight(4);
//  stroke(0);
//  line(350, 307, 350, 400);
//  line(350, 400, 325, 393);
//  line(350, 400, 324, 408);
//  line(350, 400, 335, 418);
//  line(430, 312, 430, 400);
//  line(430, 400, 404, 392);
//  line(430, 400, 404, 409);
//  line(430, 400, 415, 417);
  
//  // Tail and body
//  noStroke();
//  fill(197,90,17);
//  triangle(464, 210, 523, 214, 471, 253);
//  fill(136,60,12);
//  circle(396, 251, 160);
//  fill(197,90,17);
//  ellipse(407, 258, 122, 35);
//  fill(212,67,22);
//  circle(339, 258, 10);
//  circle(364, 287, 10);
//  circle(397, 308, 10);
//  // Head
//  fill(191,144,0);
//  triangle(206, 199, 255, 180, 256, 190);
//  fill(197,90,17);
//  circle(298, 181, 94);
//  fill(255,255,255);
//  ellipse(270, 167, 20, 31);
//  fill(0);
//  circle(267, 162, 4);
//  popMatrix(); // Restore the previous transformation matrix
//}

void mouseClicked(){
  
}
