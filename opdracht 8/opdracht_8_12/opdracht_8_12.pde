size(250,250);
background(255);

int x = 50;
int y = 10;

for(int i = 0; i <8; i++){
  for(int j = 0; j <8; j++){
   
    if((i+j) % 2 == 0){
   fill(255);
 }else {
   fill(0);
 }
   
   rect(x,y,10,10);
     
    y = y + 10;
  }
  y = 10;
  x = x + 10;

}
