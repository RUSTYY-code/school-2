float[] tx = {1200, 1150, 1100, 1050, 1000};
float[] ty = {800, 800, 800, 800, 800};
float[] tv = {2.0, 0.2, 3.2, 1.2, 25.0};
float targetR = 15;
float arrowX, arrowY;
float arrowVX = 0;
boolean flying = false;
int score = 0;
void setup() {
  fullScreen();
  smooth();
  strokeCap(ROUND);
  textSize(20);
}
void draw() {
  background(80, 200, 10);
  fill(0, 175, 255);
  noStroke();
  rect(0, mouseY-15, 20, 30);
  for (int i = 0; i < ty.length; i++) {
    ty[i] -= tv[i];
    if (ty[i] <= 0) ty[i] = 800;
  }
  noStroke();
  fill(255, 0, 0);
  for (int i = 0; i < ty.length; i++) {
    ellipse(tx[i], ty[i], targetR*2, targetR*2);
  }
  stroke(0);
  strokeWeight(4);
  if (!flying) {
    arrowX = 0 + 20;
    arrowY = mouseY-15 + 15;
    fill(0, 255, 0);
    line(arrowX - 30, arrowY, arrowX, arrowY);
  } else {
    arrowX += arrowVX;
    fill(0, 255, 0);
    line(arrowX - 30, arrowY, arrowX, arrowY);
    for (int i = 0; i < ty.length; i++) {
      float d = dist(arrowX, arrowY, tx[i], ty[i]);
      println(d);
      if (d < targetR) {
        println("hit");
        score++;
      }
    }

    if (arrowX > width + 30) {
      flying = false;
      arrowVX = 0;
    }
  }


  fill(0);
  noStroke();
  text("Score: " + score, 20, 30);
}

void mousePressed() {
  if (!flying) {
    flying = true;
    arrowVX = 18;
  }
}
