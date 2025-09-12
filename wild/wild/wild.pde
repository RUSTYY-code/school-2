String automerk=("bmw");
int leeftijd = 20;
float  deelsom = 10/5;
float leeftijd1 = random(7);
float temperatuurCelsius = random(40);
float speler1Score = random(100);
float speler2Score = random(100);
float x = 11;
float y = 11;
println(automerk);
println(leeftijd);
println(deelsom);

if (automerk == "bmw") {
  println("dat is vast een dure auto");
}


if (leeftijd1 < 1 ) {
  println("het is een baby");
} else if (leeftijd1 < 2 && leeftijd >1) {
  println("het is een dreumes");
} else if (leeftijd1 < 4 && leeftijd > 2) {
  println("het is een peuter");
} else if ( leeftijd1 < 6 && leeftijd > 4) {
  println("het is een kleuter");
};
//1.4.1
// true
// false
//false
//false
//1.4.2
//true
//false
//true
//false

//1.5
//true
//true
//false
//true
//true

//1.6
//false
//true
//true
//false
//true

//1.7
//b

//1.8
if (temperatuurCelsius > 25) {
  println("warm");
}

//1.8.1
if (temperatuurCelsius >= 30) {
  println("HEET");
} else {
  println("het is", round(temperatuurCelsius), "graden");
}
//1.9
if (speler1Score < speler2Score) {
  println("speler 2 heeft gewonen");
} else if (speler1Score > speler2Score) {
  println("speler1 heeft gewonen");
} else if (speler1Score == speler2Score) {
  println("het is gelijkspel");
}
//1.10
if (x > 10) {
  x = x - 5;
  if (x > 10 || y <= 10) {
    x++;
    y++;
  } else {
    println("hier wil ik zijn");
  }
}
float steen1 = random(6);
float steen2 = random(6);
float steen3 = random(6);
float sum = steen1 + steen2 + steen3 /3;
if (steen1 == 1||steen2 == 1||steen3 == 1){
  println("miss");
}else{
println("hit");
println(round(sum));


}

//1.11.1

if (steen1 ==1 && steen2 == 1 && steen3 == 1){
  println("Critical miss");
}else if (steen1 == 1||steen2 == 1||steen3 == 1){
  println("miss");
}else if(steen1 ==6 && steen2 == 6 && steen3 ==6){
  println("je hebt swagg");
}else{
println("hit");
println(round(sum));
}

//1.12
float cijfer = 7.0;
int lessenbijgewoond = 17;
int totaallessen= 20;
float aanwezigheidspercentage = (lessenbijgewoond * 100.0)/totaallessen;
boolean geslaagd = (cijfer >=5.5) && (aanwezigheidspercentage >=80.0);
if (geslaagd){
  println("geslaagd");
}else{
  println("gezakt");
}
//1.12.1
float cijfer1 = 5.5;
int lessenbijgewoond1 = 16;
int totaallessen1= 20;
float aanwezigheidspercentage1 = (lessenbijgewoond1 * 100.0)/totaallessen1;
boolean geslaagd1 = (cijfer1 >=5.5) && (aanwezigheidspercentage1 >=80.0);
if (geslaagd1){
  println("geslaagd");
}else{
  println("gezakt");
}
