import java.lang.Math; 

float time = 0;   // time is used to move objects from one frame to another
boolean generateImages = false; // For instructors. Automatically generate images (and create a video manually).

void setup() {
  size(1600, 1200, P3D); // If 3D mode is not working on your mac, download the latest version of Processing with a proper version: "Apple Silicon" or "Intel 64-bit".
  frameRate(30);      // this seems to be needed to make sure the scene draws properly
  perspective(60 * PI / 180, 1, 0.1, 1000); // 60-degree field of view
}

void draw() {
  time += 0.05;
  background (171, 240, 250);  // clear screen and set background to light blue

  // set up the lights
  ambientLight(120, 120, 120);
  lightSpecular(150, 150, 150);
  directionalLight (100, 100, 100, -0.3, 0.5, -1);

  // set some of the surface properties
  noStroke();
  specular (150, 150, 150);
  shininess (5.0);

  // Rotate everything together
  //pushMatrix();
  //rotateY(-190); // front
  //rotateY(0);
  //rotateY(time);

  // ==============================
  // Object modeling begins
  // ==============================  
if (time < 5) { //scene 1
  camera(-120, -80 + (time*5) , 200, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0); // camera at scene 1
  ground(1);
  castform(-75, 0, 75, 0, 40, 0);
  wooper(120, 12, -50, 0, 10, 0);
  stage(-50, 45, 75, 0, 0, 0);
  stage(160, 45, -70, 0, 0, 0);
  
} else if (time >= 5 && time < 7){ //wooper charge up (1)
  camera(-120, -80 + 25, 200, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);
  ground(1);
  castform(-75, 0, 75, 0, 40, 0);
  wooper(120, 12, -50, 0, 10, 0);
  stage(-50, 45, 75, 0, 0, 0);
  stage(160, 45, -70, 0, 0, 0);
  
} else if (time >= 7 && time < 13) {
   camera(-120  -70 + time*10, -80 + 25, 200 - 35 + time*5, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0); // bubble scene
    ground(1);
    castform(-75, 0, 75, 0, 40, 0);
    wooper(120, 12, -50, 0, 10, 0);
    water_pulse(118 + 210 -(time*30) , 12, -45 - 161 + (time*23), 0, 15, 0);
   stage(-50, 45, 75, 0, 0, 0);
  stage(160, 45, -70, 0, 0, 0);
    
} else if (time >= 13 && time < 17) { //castform flies
  camera(-120 -70 +time*10, -80 + 25, 200 + -35+  time*5, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);
  ground(1);
  castform(-75 + (time*12) -156 , 0 + -(time*80) + 1040, 75, 0 + time*10, 40, 0 + time*6);
  stage(-50, 45, 75, 0, 0, 0);
  stage(160, 45, -70, 0, 0, 0);
  wooper(120, 12, -50, 0, 10, 0);
} else if (time >= 17 && time < 19) { //wooper zoom in
    ground(1);
    wooper(120, 12, -50, 0, 10, 0);
    camera(50, -25, 40, 450, 0.0, -500, 0.0, 1.0, 0.0); 
    stage(-50, 45, 75, 0, 0, 0);
  stage(160, 45, -70, 0, 0, 0);
} else if (time >= 19 && time < 24) { //wooper flies
    ground(-2850 + time*150);
    stage(-50, 45, 75, 0, 0, 0);
    stage(160, 45 -2850 + time*150, -70, 0, 0, 0);
    wooper(120, 12, -50, 0, 10, 0);
    camera(50, -25, 40, 450, 0.0, -500, 0.0, 1.0, 0.0); 
} else if (time >= 24 && time < 26) {
    background(33, 46, 129);
    wooper(120, 12, -50, 0, 10, 0);
    camera(50, -25, 40, 450, 0.0, -500, 0.0, 1.0, 0.0);
 
} else if (time >= 26 && time < 27) {
    background(33, 46, 129);
    spotLight(255,255,255, 50, -25, 40, 450, 0, -500, 0, 10000);
    directionalLight(255, 255, 255, 50, -25, 40);
    wooper(120, 12, -50, 0, 10 + -260 + time*10, 0);
    camera(50, -25, 40, 450, 0.0, -500, 0.0, 1.0, 0.0);
}else if (time >= 27 && time < 28) {
    background(33, 46, 129);
    spotLight( 255,255,255, 50, -25, 40, 450, 0, -500, 0, 10000);
    directionalLight(255, 255, 255, 50, -25, 40);
    directionalLight(255, 255, 255, 0, 1, 0);
    wooper(120, 12, -50, 0, 10 + -260 + time*10, 0);
    camera(50, -25, 40, 450, 0.0, -500, 0.0, 1.0, 0.0);
} else if (time >= 28 && time < 29) {
    background(33, 46, 129);
    spotLight(255,255,255, 50, -25, 40, 450, 0, -500, 0, 10000);
    directionalLight(255, 255, 255, 50, -25, 40);
    directionalLight(255, 255, 255, 0, 1, 0);
    directionalLight(255, 255, 255, 1, 0, 0);
    wooper(120, 12, -50, 0, 10 + -260 + time*10, 0);
    camera(50, -25, 40, 450, 0.0, -500, 0.0, 1.0, 0.0);
} else if (time >= 29 && time < 30) {
    background(33, 46, 129);
    spotLight(255,255,255, 50, -25, 40, 450, 0, -500, 0, 10000);
    directionalLight(255, 255, 255, 50, -25, 40);
    directionalLight(255, 255, 255, 0, 1, 0);
    directionalLight(255, 255, 255, 1, 0, 0);
    directionalLight(255, 255, 255, 0, 0, 1);
    wooper(120, 12, -50, 0, 10 + -260 + time*10, 0);
    camera(50, -25, 40, 450, 0.0, -500, 0.0, 1.0, 0.0);
} else if (time >= 30 && time < 31) {
    background(33, 46, 129);
    spotLight(255,255,255, 50, -25, 40, 450, 0, -500, 0, 10000);
    directionalLight(255, 255, 255, 50, -25, 40);
    directionalLight(255, 255, 255, 0, 1, 0);
    directionalLight(255, 255, 255, 1, 0, 0);
    directionalLight(255, 255, 255, 0, 0, 1);
    //directionalLight(255, 255, 255, 0, 1, 1);
    wooper(120, 12, -50, 0, 10 + -260 + time*10, 0);
    camera(50, -25, 40, 450, 0.0, -500, 0.0, 1.0, 0.0);
    ambientLight(700, 700, 700);
} else if (time >= 31 && time < 32) {
    background(33, 46, 129);
    spotLight(255,255,255, 50, -25, 40, 450, 0, -500, 0, 10000);
    directionalLight(255, 255, 255, 50, -25, 40);
    directionalLight(255, 255, 255, 0, 1, 0);
    directionalLight(255, 255, 255, 1, 0, 0);
    directionalLight(255, 255, 255, 0, 0, 1);
    //directionalLight(255, 255, 255, 0, 1, 1);
    wooper(120, 12, -50, 0, 10 + -260 + time*100, 0);
    camera(50, -25, 40, 450, 0.0, -500, 0.0, 1.0, 0.0);
    ambientLight(700, 700, 700);    
} else if (time >= 32 && time < 33) {
    background(33, 46, 129);
    spotLight(255,255,255, 50, -25, 40, 450, 0, -500, 0, 10000);
    directionalLight(255, 255, 255, 50, -25, 40);
    directionalLight(255, 255, 255, 0, 1, 0);
    directionalLight(255, 255, 255, 1, 0, 0);
    directionalLight(255, 255, 255, 0, 0, 1);

    for (int i = 0; i < 4; i++) {
       double rand = Math.random();
       float r = (float)rand;
       pokeball(120 + i*14, 20, -50+ i*17, 0, time*100*r, 0);
       pokeball(120 - i*14, 20, -50 - i*17, 0, time*10*r, 0);
       for (int j = 0; j < 8; j++) {
         //pokeball(120 + i*12, 40 + j*18, -50 + i*17, 0, 20, 0);
         pokeball(120 - i*14, 70 -j*25, -50 + -i*17, 0, time*100*r, 0);
         pokeball(120 + i*14, 70 -j*25, -50 + i*17, 0, time*100*r, 0);
       }
    }
    
  
    camera(50, -25, 40, 450, 0.0, -500, 0.0, 1.0, 0.0);
} else if (time >= 33) {
    background(181, 241, 250);
    quagsire(75, 12, -50, 0, 10, 0);
    camera(30, -90, 50, 450, 90, -500, 0.0, 1.0, 0.0);
}
 



  // ==============================
  // Object modeling ends
  // ==============================  
  // pop the rotation matrix
  //popMatrix();

  //text
  
  //pushMatrix();
  //translate(0, 40, 0);
  //scale(0.1, 0.1, 0.1);
  //fill(0);
  //textAlign(CENTER);
  //textSize(48); 
  //text("Wooper", 0, 0);
  //popMatrix();
  
}
