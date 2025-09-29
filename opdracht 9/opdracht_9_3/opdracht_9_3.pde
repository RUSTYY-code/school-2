int mijnGetal;

void setup(){
  float mijnGetal =  mijnMethode(6, 7);
  println(mijnGetal);
}

void draw(){
 
}

float mijnMethode(int getal, int getalTwee){
  float gemiddelde = (float)(getal + getalTwee) / 2;
  return gemiddelde;
}
