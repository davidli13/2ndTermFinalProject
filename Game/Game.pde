Player player;
ArrayList<Bullets> bullets;
ArrayList<Enemy> enemy;
boolean canShoot;
float canShootCounter;
boolean isUp, isDown, isLeft, isRight, isSpace, isSpaceReleased;
int startTime, ticks;
PImage play;
PImage bg;


void setup(){
   background(255);
   size(1000,450);
   player = new Player();
   play = loadImage("gunguy.png");
   bg = loadImage("bg.png");
   bullets = new ArrayList<Bullets>();
   enemy = new ArrayList<Enemy>();
   canShoot = false;       
   startTime = millis()/1000;
   ticks = startTime;   
}

void draw(){
  background(255);
  image(bg,0,0);
  if (player.getHealth() > 0){
        player.display(); 
  }
  image(play,player.getXCor(),player.getYCor());
  
  processKeys();
  
  for (Bullets b: bullets){
     b.display(); 
     b.setXCor(b.getXCor() + cos(b.getRotation()/180 * PI) * b.getXSpeed());
     b.setYCor(b.getYCor() + sin(b.getRotation()/180 * PI) * b.getYSpeed());
  }
  
  ArrayList<Bullets> removeBullets = new ArrayList<Bullets>();
    for (Bullets b: bullets){
      if ( ( (b.getXCor() > 1000) || (b.getXCor() < 0) ) ||
        ( (b.getYCor() > 450) || (b.getYCor() < 0) )) {
          
        removeBullets.add(b);
        }
    }
    
    bullets.removeAll(removeBullets);
    
  for (Enemy e: enemy){
     e.display();
     e.setXCor(e.getXCor() + e.getXSpeed());
     e.setYCor(e.getYCor() + e.getYSpeed());      
  }
   
  
  if (canShoot){
     bullets.add(new Bullets(player.getXCor() + (player.getWidth() / 2), player.getYCor() + (player.getHeight()/2), 40 , 40 , 30 , 1));       
        canShoot = false;
  } 

  if (millis() % 100 < 30){
     enemy.add(new Enemy()); 
  }
  
}

void timeIncrease(){
   ticks = (millis()/1000) - startTime; 
}

void mousePressed(){
    canShoot = true;
}


void delay(int delay)
{
  int time = millis();
  while(millis() - time <= delay);
}

public void processKeys(){
   if (isUp){
     if (player.getYCor() > 80){
       player.setYCor(player.getYCor()-player.getYSpeed());
     }
   } 
   if (isDown){
     if (player.getYCor() < 300){
       player.setYCor(player.getYCor()+player.getYSpeed());
     }
   } 
   if (isLeft){
     if (player.getXCor() > 800){
       player.setXCor(player.getXCor()-player.getXSpeed());
     }
   } 
   if (isRight){
     if (player.getXCor() < 870){
     player.setXCor(player.getXCor()+player.getXSpeed());
     }
   }    

}

void keyPressed(){
  
    if (key == 119 || key == 87)  {
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

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}


