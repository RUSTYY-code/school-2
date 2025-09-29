void setup(){
  size(500,500);
}

void draw(){
 background(255);
 drawRightC(200,10);
 }
 
 void drawRightC(int sizeC, int aantal){
   for (int i = 0; i < aantal; i++){
   ellipse(200- sizeC/2,200,sizeC,sizeC);
   sizeC -= 20;
 }
}
