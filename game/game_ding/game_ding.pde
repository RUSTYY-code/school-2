float y1 = 800, y2= 800, y3=800, y4=800, y5=800;
float x=0, x1=15;
float arrowX, arrowY;
float arrowVX = 0;
boolean flying=false;

void setup() {
  size(1600, 800);
  smooth();
  strokeCap(ROUND);
}
void draw() {
  background(80, 200, 10);
  rect(50, mouseY, 20, 30);
  y1 -= 2.0;
  y2 -= 0.2;
  y3 -= 3.2;
  y4 -= 1.2;
  y5 -= 9.0;

  if (y1 <= 0) y1 = 800;
  if (y2 <= 0) y2 = 800;
  if (y3 <= 0) y3 = 800;
  if (y4 <= 0) y4 = 800;
  if (y5 <= 0) y5 = 800;
  x=x+3;
  x1=x1+3;
  fill(255, 0, 0);
  noStroke();
  ellipse(1200, y1, 30, 30);
  ellipse(1150, y2, 30, 30);
  ellipse(1100, y3, 30, 30);
  ellipse(1050, y4, 30, 30);
  ellipse(1000, y5, 30, 30);
  stroke(0);
  strokeWeight(4);
  if (!flying) {
    arrowX = 60 + 20;
    arrowY = mouseY + 15;
    line(arrowX - 30, arrowY, arrowX, arrowY);
  } else {
    float afstand = dist(arrowX, arrowY, targetX, targetY);
    if (afstand < targetR) {
      println("1 punt");
      flying = false;   
      arrowVX = 0;
    }

    arrowX += arrowVX;
    line(arrowX - 30, arrowY, arrowX, arrowY);

    if (arrowX > width + 30) {
      flying = false;
      arrowVX = 0;
    }
  }
}


void mousePressed() {
  if (!flying) {
    flying = true;
    arrowVX = 18;
  }
}
