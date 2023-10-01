int update = 0;

int tableDay = 02;
int tableMonth = 01;
int tableYear = 2023;

void setup() {
  // insert size
  // load the initial data
  loadNewTable();
  
  // insert initial background
  
} 

void draw() {
  if (update == 0) {
    //insert draw commands
  }
  
  else if (update == 1){
    //same draw commands 
  }
  
}

void mouseClicked() {
  //this is how it updates, alter as needed
  tableDay++;
  tableMonth++;
  
  //this flags the draw loop to start the new table
  loadNewTable();
  update++;
  
  //insert initial background below
  background(0, 204, 255);
  fill(0, 204, 0);
  rect(0, 200, 700, 150);
}

void loadNewTable() {
  // bit tedius to work with, but long as you have the core link everything is plug and play
  String url = "https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=" + tableYear + "-" + tableMonth + "-" + tableDay + "T09:07:28.885&rToDate=2023-08-28T09:07:28.885&rFamily=weather&rSensor=WS#collapseFour";
  xy = loadTable(url, "csv");
  index = 0;
}
