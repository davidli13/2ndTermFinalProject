Player player;
boolean isUp, isDown, isLeft, isRight, isSpace, isSpaceReleased;
PImage play;
PImage bg;
void setup(){
   background(255);
   size(1000,600);
   player = new Player();
   play = loadImage("player.png");
   bg = loadImage("bg.png");
               
}

void draw(){
  background(255);
  image(bg,0,0);
  if (player.getHealth() > 0){
        player.display(); 
  }
  image(play,player.getXCor(),player.getYCor());
  
  processKeys();
  
}

public void processKeys(){
   if (isUp){
     player.setYCor(player.getYCor()-player.getYSpeed());
   } 
   if (isDown){
     player.setYCor(player.getYCor()+player.getYSpeed());
   } 
   if (isLeft){
     player.setXCor(player.getXCor()-player.getXSpeed());
   } 
   if (isRight){
     player.setXCor(player.getXCor()+player.getXSpeed());
   }    

}

void keyPressed(){
   if (key == 119 || key == 87){
      isUp = true; 
   }
    if (key == 97 || key == 65){
      isLeft = true; 
   }
   if (key == 115 || key == 83) {
      isDown = true; 
   }
   if (key == 100 || key == 68){
      isRight = true; 
   }   
}

void keyReleased(){
     if (key == 119 || key == 87){
      isUp = false; 
   }
    if (key == 97 || key == 65){
      isLeft = false; 
   }
   if (key == 115 || key == 83) {
      isDown = false; 
   }
   if (key == 100 || key == 68){
      isRight = false; 
   }   
}

