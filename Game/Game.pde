Player player;
boolean isUp, isDown, isLeft, isRight, isSpace, isSpaceReleased;

void setup(){
   background(255);
   size(1000,600);
   player = new Player();
   
               
}

void draw(){
  if (player.getHealth() > 0){
        player.display(); 
  }
  
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
   if ( keyCode == 38){
      isUp = true; 
   }
   if ( keyCode == 38){
      isUp = true; 
   }
   if ( keyCode == 38){
      isUp = true; 
   }
   if ( keyCode == 38){
      isUp = true; 
   }   
}

void keyReleased(){
   if (keyCode == 38){
      isUp = false;
   } 
   if (keyCode == 38){
      isUp = false;
   } 
   if (keyCode == 38){
      isUp = false;
   } 
   if (keyCode == 38){
      isUp = false;
   }    
}
