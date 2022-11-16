Table tF;  //films.csv
Film [] aF;  //where all the films are loaded onto
int [] timeline = {2007, 2008, 2009, 2010, 2011}; //hardcoded
int [] pRange; //profit column range

void setup() {
  size(1200, 800);
  
  //Initialising globals
  tF = loadTable("films.csv", "header");
  aF = new Film[tF.getRowCount()];
  
  pRange = rangeColumn(loadColumn("Profitability"));
  for(int i = 0; i<pRange.length;i++){
    println(pRange[i]);
  }
  
  loadFilms();
}

void draw() {
  background(0);
  drawLegend();
  drawFilmPlot();
  drawSTime();
  drawSProfit();
}

void loadFilms() {
  for (int i =0; i<aF.length; i++) {

    String name = tF.getString(i, 0);
    String genre = tF.getString(i, 1);
    String studio = tF.getString(i, 2);
    int aS = tF.getInt(i, 3);
    int rS = tF.getInt(i, 5);
    int year = tF.getInt(i, 7);
    float profit = tF.getFloat(i, 4);
    float gross = tF.getFloat(i, 6);

    aF[i] = new Film(name, genre, studio, aS, rS, year, profit, gross);
  }
}

void drawSTime() { //xaxis
  int weight = 3;
  int size = 20;

  stroke(255);
  strokeWeight(weight*2);
  line(0, height-weight, width, height-weight);

  fill(255);
  textSize(size);
  textAlign(LEFT);
  for (int i = 0; i<timeline.length; i++) {
    int x = i*width/timeline.length;
    int y = height-2*weight;
    text(timeline[i], x, y);
  }
}

void drawSProfit() { //yaxis
  int size = 20;
  textAlign(LEFT);
  textSize(size);
  
  for(int i = 0; i<pRange[1];i++){
    float a = map(i,pRange[0],pRange[1],height,0);
    int step = 10;
    if(i%step==0){
      text(i,size,a);
    }
  }
  
  text("Profitability", 0, size);
}

//draw legend for colour
void drawLegend() {
  int size = 25;
  
  fill(255,0,255);//aud
  ellipse(width-size,size,size,size);
  
  fill(0,255,255);//critic
  ellipse(width-size,2*size,size,size);
  
  fill(0);
  textSize(15);
  text("Audience", width,size);
  text("Critic", width-size,size);
}

void drawFilmPlot() {
  for(int i = 0; i<aF.length;i++){
    aF[i].plotCircle(i);
  }
}

int [] loadColumn(String field) { //loads column into array to be sorted
  int [] c = new int[tF.getRowCount()];
  int column = 0;

  for (int i=0; i<tF.getColumnCount(); i++) { //for each column
    if (field.equals(tF.getColumnTitle(i))) { //if field matches header in csv
      column = i;  //store that column index
    }
  }

  for (int i=0; i<tF.getRowCount(); i++) {  //add each row under header
    c[i] = tF.getInt(i, column);
  }
  
  return c;
}

int [] rangeColumn(int [] a) {
  a = sort(a);
  int [] s = {a[0], a[a.length-1]};

  return s;
}
