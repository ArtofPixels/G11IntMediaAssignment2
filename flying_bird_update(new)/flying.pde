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
float birdX = width + 50; 
float birdY = 100;
float birdSpeed = 0.4;

float compassLength = 50;
float currentAngle = 0;

int update = 0;

Bird b1;

int tableDay = 02;
int tableMonth = 01;
int tableYear = 2023;

float randomStart = random(1, 1); //randomiser for the index starting point, editable
//float randomHeight = random(20, 30); //randomiser for the circle height, editable (UNUSUABLE)
int randomInt = (int)randomStart;

void drawCompass() {
  if (windD < windDirection.getRowCount()) {
    float windDir = windDirection.getFloat(windD, 1);
    
    float targetAngle = map(windDir, 0, 360, 0, 360);
    
    float smoothingFactor = 0.1; // Adjust the smoothing factor (0.0 to 1.0) for desired smoothness
    currentAngle = lerp(currentAngle, targetAngle, smoothingFactor);
    
    float x1 = width / 1.2;
    float y1 = height / 4;
    float x2 = x1 + cos(radians(currentAngle)) * compassLength;
    float y2 = y1 + sin(radians(currentAngle)) * compassLength; 
    
    stroke(0, 0, 0);
    strokeWeight(1);
    line(x1, y1, x2, y2);
    
    // Reset rotation
    resetMatrix();
    
    windD++;
  }
}


void setup() {
  size(1200, 300);
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
  b1 = new Bird(width + 50, birdY);
}

void draw() {
  background(0, 204, 255);
  
  int rectHeight = height / 3;
  fill(0, 204, 0);
  rect(0, height - rectHeight, width, rectHeight);
    
    //changed getRowIndex to width to reduce the amount of raw data being rendered off screen
  if (b1.x > -b1.getWidth()) {
    if (windS < width) {
      float x = windSpeed.getFloat(windS, 1);
      b1.move(x);
      b1.display();
      drawCompass();
      windS++;
      println(x);
    }
  }
    
    // Wind direction sensor cloud representation
    
}

void mouseClicked(){
  tableDay++;
  tableMonth++;
  
  loadNewTable();
  update++;
  
  background(0, 204, 255);
  fill(0, 204, 0);
  rect(0, 200, 700, 150);
 
}

void loadNewTable() {
  // Load the new data for the humidity sensor in csv format.
  String xyUrl = "https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=" + tableYear + "-" + tableMonth + "-" + tableDay + "T09:07:28.885&rToDate=2023-08-28T09:07:28.885&rFamily=weather&rSensor=WS#collapseFour";
  xy = loadTable(xyUrl, "csv");
  
  // Load the new data for wind speed and wind direction sensors
  String windSpeedUrl = "https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=" + tableYear + "-" + tableMonth + "-" + tableDay + "T22%3A58%3A56&rToDate=2023-09-30T22%3A57%3A43&rFamily=weather&rSensor=WS";
  windSpeed = loadTable(windSpeedUrl, "csv");
  
  String windDirectionUrl = "https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=" + tableYear + "-" + tableMonth + "-" + tableDay + "T22%3A58%3A56&rToDate=2023-09-30T22%3A57%3A43&rFamily=weather&rSensor=WD";
  windDirection = loadTable(windDirectionUrl, "csv");
  
  // Reset the bird's X position to start outside on the right side
  b1.resetPosition(width, birdY); // Assuming 'width' is the canvas width
  
  // Reset other variables if needed
  index = 0;
}
