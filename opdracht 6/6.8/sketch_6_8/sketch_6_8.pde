// als cijfer hoger is dan een 8 gefeliciteerd met cumlaude te slagen zeggen

boolean cumlaude  = false;
float cijfer = random(10);

if (cijfer >=8){
  cumlaude= true;
  println("gefeliciteerd met cumlaude slagen");
}else if (cijfer <=4){
  println("helaas je bent gezakt");
}else{
  println("gefeliciteerd met het slagen");
}
