size(650,600);
background(255);

int x = 10;
int y = 10;

for(int i = 0; i <20; i++){
  for(int j = 0; j <20; j++){
    rect(x,y,10,10);
    y = y + 10;
  }
  y = 10;
  x = x + 10;
}
