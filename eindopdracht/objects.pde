
void test_sphere() {
  fill (225, 234, 0);
  pushMatrix();
  translate(0, 0, 0);
  box(5);
  popMatrix();
}

void stage(float x, float y, float z, float rx, float ry, float rz) {

  pushMatrix(); //push trans
  translate(x, y, z);
  
  pushMatrix(); //rotate inplace
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  
  fill (0, 0, 237);
  pushMatrix();
  translate(-10, -15, 0);
  sphereDetail(60); 
  scale(4, .3, 4);
  sphere(15);
  popMatrix();
  
  popMatrix();
  popMatrix();
  
}
  
void quagsire(float x, float y, float z, float rx, float ry, float rz) {
  pushMatrix();
  scale(2, 2, 2);
  
  pushMatrix(); //push trans
  translate(x, y, z);
  
  pushMatrix(); //rotate inplace
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  
  
 //head
  fill (166, 220, 237);
  pushMatrix();
  translate(-10, -30, 0);
  sphereDetail(60); 
  sphere(15);
  popMatrix();
  
  //head topper
  fill (166, 220, 237);
  pushMatrix();
  translate(-8, -35, 0);
  sphereDetail(60); 
  scale(1, .75, 1);
  sphere(13);
  popMatrix();
  
  //body
  fill (166, 220, 237);
  pushMatrix();
  translate(-10, -8, 0);
  sphereDetail(60); 
  scale(.70, .90, .70);
  sphere(27);
  popMatrix();
  
  //tail
  fill (166, 220, 237);
  pushMatrix();
  translate(-23, 0, 0);
  rotateZ(-180);
  sphereDetail(60); 
  scale(.25, 1, .75);
  sphere(18);
  popMatrix();
  
  //foot1
  fill (166, 220, 237);
  pushMatrix();
  translate(-5, 15, 5);
  rotateX(60);
  rotateZ(60);
  sphereDetail(60);
  scale(.90, .30, .60);
  sphere(15);
  popMatrix();

  //foot2
  fill (166, 220, 237);
  pushMatrix();
  translate(-5, 15, -5);  
  rotateX(-60);
  rotateZ(60);
  sphereDetail(60); 
  scale(.90, .30, .60);
  sphere(15);
  popMatrix();
  
  //eyeball1
  fill (0, 0, 0);
  pushMatrix();
  translate(-10, -43, 7);
  sphereDetail(60); 
  //scale(.75, .75);
  sphere(1);
  popMatrix();
  
  //eyeball2
  fill (0, 0, 0);
  pushMatrix();
  translate(-10, -43, -7);
  sphereDetail(60); 
  //scale(.75, .75);
  sphere(1);
  popMatrix();
  
  //nose 1
  fill (0, 0, 0);
  pushMatrix();
  translate(5, -35, 1.8);
  sphereDetail(60); 
  //scale(.75, .75);
  sphere(.4);
  popMatrix();
  
  //nose 2
  fill (0, 0, 0);
  pushMatrix();
  translate(5, -35, -1.8);
  sphereDetail(60); 
  //scale(.75, .75);
  sphere(.4);
  popMatrix();
  
  //arm 1
  fill (166, 220, 237);
  pushMatrix();
  translate(8, -15, -10);
  rotateZ(-180);
  rotateY(-70);
  sphereDetail(60); 
  scale(.25, .80, .50);
  sphere(13);
  popMatrix();
  
  //arm 2
  fill (166, 220, 237);
  pushMatrix();
  translate(8, -15, 10);
  rotateZ(-180);
  rotateY(70);
  sphereDetail(60); 
  scale(.25, .80, .50);
  sphere(13);
  popMatrix();
  
  popMatrix();
  popMatrix();
  popMatrix();
  
  
  
 
}

void pokeball(float x, float y, float z, float rx, float ry, float rz) {
  pushMatrix(); //push trans
  translate(x, y, z);
  
  pushMatrix(); //rotate inplace
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  
   //ball 
  fill (66, 180, 229);
  pushMatrix();
  translate(-10, -15, 0);
  sphereDetail(40); 
  sphere(10);
  popMatrix();
  
  //black stripe
  fill (0, 0, 0);
  pushMatrix();
  translate(-10, -15, 0);
  sphereDetail(60); 
  scale(1, .30, 1);
  sphere(10.25);
  popMatrix();
  
  //black circle
  fill (0, 0, 0);
  pushMatrix();
  translate (-10, -15, 5); 
  scale (2.5,2.5, 6);
  cylinder();
  popMatrix();
  
  //white circle
  fill (255, 255, 255);
  pushMatrix();
  translate (-10, -15, 5); 
  scale (1.5, 1.5, 6.2);
  cylinder();
  popMatrix();
  
  //white circle2
  fill (255, 255, 255);
  pushMatrix();
  translate (-10, -15, 5); 
  scale (1, 1, 6.6);
  cylinder();
  popMatrix();
  
  popMatrix();
  popMatrix();
  
  
}

void water_pulse(float x, float y, float z, float rx, float ry, float rz) {
  //radius = 1.0, tube_radius = 0.5, detail_x = 16, detail_y = 16
  pushMatrix(); //push trans
  translate(x, y, z);
  
  pushMatrix(); //rotate inplace
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  
  fill(176,224,230); 
  pushMatrix();
  translate(2.5, -27, 0); 
  torus(3.0 - 14 + (time*2), 1.0 - 3.5 + (time*0.5), 25, 25);
  popMatrix();
  
  popMatrix();
  popMatrix();
}

void ground(float y) {
  pushMatrix();
  translate(1, y, 1);
  
  fill (26, 185, 209);
  pushMatrix();
  translate(0, 30, 0);
  box(1600, 8, 1600);
  popMatrix();
  
  popMatrix();
}

//characters
void castform(float x, float y, float z, float rx, float ry, float rz) {
  
  pushMatrix(); //push trans
  translate(x, y, z);
  pushMatrix(); //rotate inplace
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  
   //red inside
  fill (225, 0, 0);
  pushMatrix();
  translate(-10, -15, 0);
  sphereDetail(60); 
  sphere(15);
  popMatrix();
  
  //cloud
  fill(255, 255, 255);
  pushMatrix();
  translate(-10, 10, 0);
  rotateX(80);
  torus(8.0, 8.0, 8, 8);
  popMatrix();
  
  //eye1
  fill (225, 234, 0);
  pushMatrix();
  translate(-15, -15, 9);
  sphereDetail(60); 
  sphere(6.5);
  popMatrix();
  
  //inner eye 1
  fill (0, 0, 0);
  pushMatrix();
  translate(-16.5, -15, 13);
  sphereDetail(60); 
  sphere(3);
  popMatrix();
  
  //inner eye white1
  fill (255, 255, 255);
  pushMatrix();
  translate(-16.5, -15.4, 15);
  sphereDetail(60); 
  sphere(1.4);
  popMatrix();
  
  //eye2
  fill (225, 234, 0);
  pushMatrix();
  translate(-5, -15, 9);
  sphereDetail(60); 
  sphere(6.5);
  popMatrix();
  
  //inner eye 2
  fill (0, 0, 0);
  pushMatrix();
  translate(-2.5, -15, 13);
  sphereDetail(60); 
  sphere(3);
  popMatrix();
  
  //inner eye white2
  fill (255, 255, 255);
  pushMatrix();
  translate(-2.3, -15.4, 15);
  sphereDetail(60); 
  sphere(1.4);
  popMatrix();
  

  //inbetween eye
  fill (255, 234, 0);
  pushMatrix();
  translate (-10, -15, 14);  
  //rotateY(60);
  scale (5, 2, 1);
  cylinder();
  popMatrix();
  
  //main head
  fill (225, 172, 28, 190);
  pushMatrix();
  translate(-10, -15, 0);
  sphereDetail(60); 
  sphere(20);
  popMatrix();
  
  //head accessories
  //top
  fill (225, 172, 28, 190);
  pushMatrix();
  translate(-10, -42, 0);
  sphereDetail(60); 
  sphere(10);
  popMatrix();
  //top1
  fill (225, 172, 28, 190);
  pushMatrix();
  translate(-26, -35, 0);
  sphereDetail(60); 
  sphere(8.6);
  popMatrix();
  fill (225, 172, 28, 190);
  pushMatrix();
  translate(6, -35, 0);
  sphereDetail(60); 
  sphere(8.6);
  popMatrix();
  //top2
  fill (225, 172, 28, 190);
  pushMatrix();
  translate(-35, -22, 0);
  sphereDetail(60); 
  sphere(7.8);
  popMatrix();
  fill (225, 172, 28, 190);
  pushMatrix();
  translate(15, -22, 0);
  sphereDetail(60); 
  sphere(7.8);
  popMatrix();
  //top3
  fill (225, 172, 28, 190);
  pushMatrix();
  translate(-33, -8, 0);
  sphereDetail(60); 
  sphere(6.7);
  popMatrix();
  fill (225, 172, 28, 190);
  pushMatrix();
  translate(13, -8, 0);
  sphereDetail(60); 
  sphere(6.7);
  popMatrix();
  
  popMatrix();
  popMatrix();
}

void wooper(float x, float y, float z, float rx, float ry, float rz) {
  
  pushMatrix(); //push trans
  translate(x, y, z);
  pushMatrix(); //rotate inplace
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
    
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
  rotateX(60);
  rotateZ(60);
  sphereDetail(60);
  scale(.90, .30, .60);
  sphere(8);
  popMatrix();

  //foot2
  fill (166, 220, 237);
  pushMatrix();
  translate(-5, 12, -5);  
  rotateX(-60);
  rotateZ(60);
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
  
  //pop rot matrix
  popMatrix();
  popMatrix();
  
}


void white_wooper(float x, float y, float z, float rx, float ry, float rz) {
  
  pushMatrix(); //push trans
  translate(x, y, z);
  pushMatrix(); //rotate inplace
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
    
  //head
  fill (255, 255, 255);
  pushMatrix();
  translate(-10, -30, 0);
  sphereDetail(60); 
  scale(.75, .75);
  sphere(20);
  popMatrix();
  
  //body
  fill (255, 255, 255);
  pushMatrix();
  translate(-10, -5, 0);
  sphereDetail(60); 
  scale(.50, .90, .50);
  sphere(20);
  popMatrix();
  
  //tail
  fill (255, 255, 255);
  pushMatrix();
  translate(-23, 0, 0);
  rotateZ(-180);
  sphereDetail(60); 
  scale(.25, 1, .55);
  sphere(12);
  popMatrix();
  
  //foot1
  fill (255, 255, 255);
  pushMatrix();
  translate(-5, 12, 5);
  rotateX(60);
  rotateZ(60);
  sphereDetail(60);
  scale(.90, .30, .60);
  sphere(8);
  popMatrix();

  //foot2
  fill (255, 255, 255);
  pushMatrix();
  translate(-5, 12, -5);  
  rotateX(-60);
  rotateZ(60);
  sphereDetail(60); 
  scale(.90, .30, .60);
  sphere(8);
  popMatrix();
  
  // antenna base
  fill (255, 255, 255);
  pushMatrix();
  translate (-5, -30, 0); 
  scale (1, 1, 31);
cylinder();
  popMatrix();
  
  //antenna parts
  fill (255, 255, 255);
  pushMatrix();
  translate(-5, -30, 21);
  sphereDetail(60); 
  scale(1, 10, 1);
  sphere(.9);
  popMatrix();
  
  fill (255, 255, 255);
  pushMatrix();
  translate(-5, -30, -21);
  sphereDetail(60); 
  scale(1, 10, 1);
  sphere(.9);
  popMatrix();
  
  fill (255, 255, 255);
  pushMatrix();
  translate(-5, -30, 28);
  sphereDetail(60); 
  scale(1, 6, 1);
  sphere(.9);
  popMatrix();
  
  fill (255, 255, 255);
  pushMatrix();
  translate(-5, -30, -28);
  sphereDetail(60); 
  scale(1, 6, 1);
  sphere(.9);
  popMatrix();
  
  //eyeball1
  fill (255, 255, 255);
  pushMatrix();
  translate(2, -34, 10);
  sphereDetail(60); 
  //scale(.75, .75);
  sphere(1.70);
  popMatrix();
  
  //eyeball2
  fill (255, 255, 255);
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
  fill (255, 255, 255);
  pushMatrix();
  translate(2.5, -27, 0);
  sphereDetail(60);
  scale(.25, .50, .30);
  sphere(10.5);
  popMatrix();
  
  //stripes
  fill (255, 255, 255);
  pushMatrix();
  translate(-2, 2, 0);
  sphereDetail(60);
  scale(.1, .125, .4);
  sphere(15);
  popMatrix();
  
  fill (255, 255, 255);
  pushMatrix();
  translate(-1.2, -3, 0);
  sphereDetail(60); 
  scale(.1, .125, .3);
  sphere(15);
  popMatrix();
  
  fill (255, 255, 255);
  pushMatrix();
  translate(-1.2, -8, 0);
  sphereDetail(60);
  scale(.1, .125, .2);
  sphere(15);
  popMatrix();
  
  //pop rot matrix
  popMatrix();
  popMatrix();
  
}

void cylinder() {
  // Helper function to draw a cylinder radius = 1, z range in [-1, 1]
 cylinder(50);
}

void cylinder(int sides) {
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

//code for donut 
//Recommended parameters: radius = 1.0, tube_radius = 0.5, detail_x = 16, detail_y = 16

void torus(float radius, float tube_radius, int detail_x, int detail_y) {
  ArrayList<ArrayList<PVector>> vertices = new ArrayList<>();
  ArrayList<ArrayList<PVector>> normals = new ArrayList<>();
  
  for (int torus_segment = 0; torus_segment < detail_x; torus_segment++) {
    float theta = 2 * PI * (torus_segment * 1.0) / (detail_x * 1.0);
    float cosTheta = cos(theta);
    float sinTheta = sin(theta);
    
    ArrayList<PVector> segmentVertices = new ArrayList<>();
    ArrayList<PVector> segmentNormals = new ArrayList<>();

    for (int tube_segment = 0; tube_segment < detail_y; tube_segment++) {
      float phi = 2 * PI * (tube_segment * 1.0) / (detail_y * 1.0);
      float cosPhi = cos(phi);
      float sinPhi = sin(phi);
      segmentVertices.add(new PVector(cosTheta * (radius + cosPhi * tube_radius),
        sinTheta * (radius + cosPhi * tube_radius),
        sinPhi * tube_radius));
      segmentNormals.add(new PVector(cosPhi * cosTheta, cosPhi * sinTheta, sinPhi));
    }
    vertices.add(segmentVertices);
    normals.add(segmentNormals);
  }
  
  for (int i = 0; i < detail_x; i++) {
    for (int j = 0; j < detail_y; j++) {
      beginShape();
      normal(normals.get(i).get(j).x, normals.get(i).get(j).y, normals.get(i).get(j).z);
      vertex(vertices.get(i).get(j).x, vertices.get(i).get(j).y, vertices.get(i).get(j).z);
      normal(normals.get((i + 1) % detail_x).get(j).x, normals.get((i + 1) % detail_x).get(j).y, normals.get((i + 1) % detail_x).get(j).z);
      vertex(vertices.get((i + 1) % detail_x).get(j).x, vertices.get((i + 1) % detail_x).get(j).y, vertices.get((i + 1) % detail_x).get(j).z);
      normal(normals.get((i + 1) % detail_x).get((j + 1) % detail_y).x, normals.get((i + 1) % detail_x).get((j + 1) % detail_y).y, normals.get((i + 1) % detail_x).get((j + 1) % detail_y).z);
      vertex(vertices.get((i + 1) % detail_x).get((j + 1) % detail_y).x, vertices.get((i + 1) % detail_x).get((j + 1) % detail_y).y, vertices.get((i + 1) % detail_x).get((j + 1) % detail_y).z);
      normal(normals.get(i).get((j + 1) % detail_y).x, normals.get(i).get((j + 1) % detail_y).y, normals.get(i).get((j + 1) % detail_y).z);
      vertex(vertices.get(i).get((j + 1) % detail_y).x, vertices.get(i).get((j + 1) % detail_y).y, vertices.get(i).get((j + 1) % detail_y).z);
      endShape(CLOSE);
    }
  }
}
