float x,y, radius,c1,c2;

class Film {
  String name, genre, studio;
  int audSc, rotSc, year;
  float profit, gross;

  Film (String n, String ge, String s, int a, int r, int y, float p, float gr) {
    name = n;
    genre = ge;
    studio = s;
    audSc = a;
    profit = p;
    rotSc = r;
    gross = gr;
    year = y;
  }
  
  String getFName(){
    return name;
  }
  
  String getGenre(){
    return genre;
  }
  
  String getStudio(){
    return studio;
  }
  
  int getAudSc(){
    return audSc;
  }
  
  float getProfit(){
    return profit;
  }
  
  int getRotSc(){
    return rotSc;
  }
  
  float getGross(){
    return gross;
  }
  
  int getYear(){
    return year;
  }
  
  //behaviours
  
  void plotCircle(int i){
    x = map(aF[i].year,timeline[0],timeline[timeline.length-1],0,width);
    y = map(aF[i].profit, pRange[0],pRange[1],height,0); 
    radius = map(aF[i].gross, 0,700,0,300)/2; 
    c1 = map(aF[i].audSc,0,100,0,255); 
    c2 = map(aF[i].rotSc,0,100,0,255);
    checkClick(i);
    fill(c2,c1,255);
    ellipse(x,y,radius,radius);
  }

  void checkClick(int i){
    if(dist(x,y,mouseX,mouseY)<radius){
      if(mousePressed){
       c1=255;
       c2=255;
       textSize(20);
       text(aF[i].name,mouseX,mouseY-100);
       text(aF[i].genre,mouseX,mouseY-75);
       text(aF[i].studio,mouseX,mouseY-50);
       
       c1 = 0;
       c2 = 0;
      }
    }
  }
}
