size(900,900);
background(255);

int sizeA = 300;

for(int i = 0; i < 50; i ++){
  ellipse(450,450,sizeA,sizeA);
  sizeA = sizeA - 10;
  println(i);
}


size(900,900);
background(255);

int sizeb = 600;

for(int i = 0; i < 50; i ++){
  ellipse(750 - sizeb/2, 450 - sizeb/50, sizeb,sizeb);
  sizeb = sizeb - 10;
  println(sizeb);
}
