int MODE;
float BIG_FACTOR;
float dx, dy;
float groupx, groupy;


void setup() {
  size(800, 600);
  background(100, 100, 100);
  groupx = 0;
  groupy = 0;
  dx = 1;
  dy = 1;
  MODE=1;
  BIG_FACTOR= 1.5;
}

void android(float x, float y, float scale) {
  color c = color(164, 199, 67); 
  fill(c);
  stroke(c);
  strokeWeight(3);//thin lines
  line(x - 25 / scale, y - 60 / scale, x - 32 / scale, y - 75 / scale);//antennae
  line(x + 25 / scale, y - 60 / scale, x + 32 / scale, y - 75 / scale);//antennae
  strokeWeight(23 / scale);  //thick lines
  line(x - 67 / scale, y - 10 / scale, x - 67 / scale, y + 40 / scale);//left arm
  line(x + 66 / scale, y - 10 / scale, x + 66 / scale, y + 40 / scale);//left arm
  line(x - 39 / scale, y + 60 / scale, x + 38 / scale, y + 60 / scale);//bottom of torso
  line(x - 20 / scale, y + 60 / scale, x - 20 / scale, y + 100 / scale);//left leg
  line(x + 20 / scale, y + 60 / scale, x + 20 / scale, y + 100 / scale);//right leg
  noStroke();
  arc(x, y - 23 / scale, 100 / scale, 90 / scale, PI, 2*PI);
  rect(x - 50 / scale, y-20 / scale, 100 / scale, 80 / scale);//torso
  fill(255);
  ellipse(x - 22 / scale, y - 43 / scale, 8 / scale, 8 / scale);
  ellipse(x + 22 / scale, y - 43 / scale, 8 / scale, 8 / scale);
}

void androids(float x, float y) {
  int spacing = (int)(200/BIG_FACTOR);
  for (int i = -10; i < 10; i++) {
    for (int j = -10; j < 10; j++) {
      android(x + i * spacing, y + j * spacing, BIG_FACTOR);
    }
  }
}

void moveAndroids() {

  groupx+=dx;
  groupy+=dy;
  if (groupx>width) {
    groupx=0;
  }
  if (groupy>height) {
    groupy=0;
  }
}

void displayMenu() {
  fill(0, 0, 0, 100);
  rect(50, 50, width-100, height-100);
  fill(255);
  text("Press + to increase androids' size", 100, 100);
  text("Press - to decrease androids' size", 100, 150);
  text("Press space to toggle these directions", 100, 200);
  text("Press 'A' to toggle gravity", 100, 250);
  text("Press esc to quit", 100, 300);
}

void keyPressed() {
  println(keyCode);
  if (keyCode==32 && MODE!=1) {
    MODE=1;
  } else if (keyCode==32 && MODE!=0) {
    MODE=0;
  }

  if (keyCode==61) {
    BIG_FACTOR /= 1.1;
  }

  if (keyCode==45) {
    BIG_FACTOR *= 1.1;
  }

  if (keyCode == 65 && MODE!= 2) {
    MODE = 2;
  } else if (keyCode == 65) {
    MODE = 0;
  }
}
void Aaaaaah() {
  dy = dy+.2;
  fill(255, 0, 0);
  text("AaaaaaaaahhhhhhhhhhhhhHH!", width/2-50, height/2);
}
void mouseClicked() {
  println(mouseX+","+mouseY);
}


void draw() {
  fill(255, 120);  
  rect(0, 0, width, height);
  androids(groupx, groupy);  


  if (MODE==1) {
    displayMenu();
  } else {
    moveAndroids();
  }
  if (MODE==2) {
    Aaaaaah();
  }
}
