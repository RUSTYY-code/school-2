String zoekNaam = "Dinand";
boolean gevonden = false;
String[] naam = {"Peter", "Jan", "Piet", "Daan", "Jarilo", "Kevin", "Jovanka"};

void setup(){
  for (int i =0; i < naam.length; i ++){
    if(zoekNaam == naam[i]){
      gevonden = true;
    }  
  }
   
    if(gevonden){
      println("Ja de naam " + zoekNaam + " is gevonden");
    }else{
      println("Nee de naam " + zoekNaam + " is niet gevonden");
    }

}
