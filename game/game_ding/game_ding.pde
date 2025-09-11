float y1 = 800;
float y2 = 800;
float y3 = 800;
float y4 = 800;
float y5 = 800;
float x = 0;
void setup() {
  size(1600, 800);
}
void draw() {
  background(80, 200, 10);
  y1=y1 - 2;
  y2=y2 - 0.2;
  y3=y3 - 3.2;
  y4=y4 - 1.2;
  y5=y5 - 25;
  x=x+3;
  ellipse(1200, y1, 30, 30);
  ellipse(1150, y2, 30, 30);
  ellipse(1100, y3, 30, 30);
  ellipse(1050, y4, 30, 30);
  ellipse(1000, y5, 30, 30);
  if (y1 <= 0) {
    print("boven");
    y1 = 800;
  }
  if (y2 <= 0) {
    print("boven");
    y2 = 800;
  }
  if (y3 <= 0) {
    print("boven");
    y3 = 800;
  }
  if (y4 <= 0) {
    print("boven");
    y4 = 800;
  }
  if (y5 <= 0) {
    print("boven");
    y5 = 800;
  }

  rect(x, 400, 15, 2);
  if (x >= 1600) {
    x=1600;
  }
};
