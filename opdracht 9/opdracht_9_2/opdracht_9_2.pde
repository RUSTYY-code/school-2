int mijnGetal = 8;

void setup(){
  mijnMethode(mijnGetal, 7);
  mijnMethode(mijnGetal, 26);
}

void draw(){
 
}

void mijnMethode(int getal, int getalTwee){
  float gemiddelde = (float)(getal + getalTwee) / 2;
  println("Som "+ getal + " " + getalTwee + " " + gemiddelde);
}
