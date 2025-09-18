size(500,500);
background(255);

int sizeC = 300;

for(int i = 0; i < 5; i ++){
  ellipse(490 - sizeC/2, 250 - sizeC/50, sizeC,sizeC);
  sizeC = sizeC - 40;
}
