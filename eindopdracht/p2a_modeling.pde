// Object Modeling Example Code
float time = 0;   // time is used to move objects from one frame to another
boolean generateImages = false; // For instructors. Automatically generate images (and create a video manually).

void setup() {
  size(800, 800, P3D); // If 3D mode is not working on your mac, download the latest version of Processing with a proper version: "Apple Silicon" or "Intel 64-bit".
  frameRate(30);      // this seems to be needed to make sure the scene draws properly
  perspective(60 * PI / 180, 1, 0.1, 1000); // 60-degree field of view
}

void draw() {
  time += 0.05;
  // You are tasked to modify this function to design your own character.
  // You can focus on object modeling, while leaving background/lighting/camera as-is. Feel free to modify anything if needed!
  // For the requirements for object modeling, please refer to the project description on canvas.
  // Don't forget to display the name of the character.

  camera (0, 0, 100, 0, 0, 0, 0, 1, 0); // position of the virtual camera
  
  background (200, 200, 255);  // clear screen and set background to light blue

  // set up the lights
  ambientLight(120, 120, 120);
  lightSpecular(150, 150, 150);
  directionalLight (100, 100, 100, -0.3, 0.5, -1);

  // set some of the surface properties
  noStroke();
  specular (150, 150, 150);
  shininess (5.0);

  // Rotate everything together
  pushMatrix();
  //rotateY(-190); // front
  //rotateY(0);
  rotateY(time);

  // ==============================
  // Object modeling begins
  // ==============================  

  //head
  fill (166, 220, 237);
  pushMatrix();
  translate(-10, -30, 0);
  sphereDetail(60); 
  scale(.75, .75);
  sphere(20);
  popMatrix();
  
  //body
  fill (166, 220, 237);
  pushMatrix();
  translate(-10, -5, 0);
  sphereDetail(60); 
  scale(.50, .90, .50);
  sphere(20);
  popMatrix();
  
  //tail
  fill (166, 220, 237);
  pushMatrix();
  translate(-23, 0, 0);
  rotateZ(-180);
  sphereDetail(60); 
  scale(.25, 1, .55);
  sphere(12);
  popMatrix();
  
  //foot1
  fill (166, 220, 237);
  pushMatrix();
  translate(-5, 12, 5);
  rotateZ(60);
  rotateX(60);
  sphereDetail(60);
  scale(.90, .30, .60);
  sphere(8);
  popMatrix();

  //foot2
  fill (166, 220, 237);
  pushMatrix();
  translate(-5, 12, -5);
  rotateZ(60);
  rotateX(-60);
  sphereDetail(60); 
  scale(.90, .30, .60);
  sphere(8);
  popMatrix();
  
  // antenna base
  fill (255, 192, 203);
  pushMatrix();
  translate (-5, -30, 0);  
  scale (1, 1, 31);
  cylinder();
  popMatrix();
  
  //antenna parts
  fill (255, 192, 203);
  pushMatrix();
  translate(-5, -30, 21);
  sphereDetail(60); 
  scale(1, 10, 1);
  sphere(.9);
  popMatrix();
  
  fill (255, 192, 203);
  pushMatrix();
  translate(-5, -30, -21);
  sphereDetail(60); 
  scale(1, 10, 1);
  sphere(.9);
  popMatrix();
  
  fill (255, 192, 203);
  pushMatrix();
  translate(-5, -30, 28);
  sphereDetail(60); 
  scale(1, 6, 1);
  sphere(.9);
  popMatrix();
  
  fill (255, 192, 203);
  pushMatrix();
  translate(-5, -30, -28);
  sphereDetail(60); 
  scale(1, 6, 1);
  sphere(.9);
  popMatrix();
  
  //eyeball1
  fill (0, 0, 0);
  pushMatrix();
  translate(2, -34, 10);
  sphereDetail(60); 
  //scale(.75, .75);
  sphere(1.70);
  popMatrix();
  
  //eyeball2
  fill (0, 0, 0);
  pushMatrix();
  translate(2, -34, -10);
  sphereDetail(60); 
  sphere(1.70);
  popMatrix();
  
  //inner eyeball 1
  fill (255, 255, 255);
  pushMatrix();
  translate(3, -34, -10);
  sphereDetail(60); 
  sphere(.9);
  popMatrix();
  
  //inner eyeball 2
  fill (255, 255, 255);
  pushMatrix();
  translate(3, -34, 10);
  sphereDetail(60); 
  sphere(.9);
  popMatrix();
  
  //big mouth
  fill (227, 11, 92);
  pushMatrix();
  translate(2.5, -27, 0);
  sphereDetail(60);
  scale(.25, .50, .30);
  sphere(10.5);
  popMatrix();
  
  //stripes
  fill (0, 0, 139);
  pushMatrix();
  translate(-2, 2, 0);
  sphereDetail(60);
  scale(.1, .125, .4);
  sphere(15);
  popMatrix();
  
  fill (0, 0, 139);
  pushMatrix();
  translate(-1.2, -3, 0);
  sphereDetail(60); 
  scale(.1, .125, .3);
  sphere(15);
  popMatrix();
  
  fill (0, 0, 139);
  pushMatrix();
  translate(-1.2, -8, 0);
  sphereDetail(60);
  scale(.1, .125, .2);
  sphere(15);
  popMatrix();
  
   
  

  // ==============================
  // Object modeling ends
  // ==============================  
  // pop the rotation matrix
  popMatrix();

  
  pushMatrix();
  translate(0, 40, 0);
  scale(0.1, 0.1, 0.1);
  fill(0);
  textAlign(CENTER);
  textSize(48); 
  text("Wooper", 0, 0);
  popMatrix();
  
  // Single frame capture with 'c' key
  if (keyPressed && key == 'c') {
    saveFrame("p2-######.png");
  }
  if (generateImages && frameCount < 300) {
    saveFrame("p2-######.png");
  }
}

void drawCylinder() {
  // Helper function to draw a cylinder radius = 1, z range in [-1, 1]
  cylinder(50);
}

void drawCylinder(int sides) {
  // Helper function to draw a cylinder with the given number of sides.
  
  // first endcap
  beginShape();
  for (int i = 0; i < sides; i++) {
    float theta = i * 2 * PI / sides;
    float x = cos(theta);
    float y = sin(theta);
    vertex(x, y, -1);
  }
  endShape(CLOSE);

  // second endcap
  beginShape();
  for (int i = 0; i < sides; i++) {
    float theta = i * 2 * PI / sides;
    float x = cos(theta);
    float y = sin(theta);
    vertex(x, y, 1);
  }
  endShape(CLOSE);
  
  // round main body
  float x1 = 1;
  float y1 = 0;
  for (int i = 0; i < sides; i++) {
    float theta = (i + 1) * 2 * PI / sides;
    float x2 = cos(theta);
    float y2 = sin(theta);
    beginShape();
    normal (x1, y1, 0);
    vertex (x1, y1, 1);
    vertex (x1, y1, -1);
    normal (x2, y2, 0);
    vertex (x2, y2, -1);
    vertex (x2, y2, 1);
    endShape(CLOSE);
    x1 = x2;
    y1 = y2;
  }
}
