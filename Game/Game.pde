Player player;
ArrayList<Bullets> bullets;
ArrayList<Enemy> enemy;
boolean canShoot;
float canShootCounter;
boolean isUp, isDown, isLeft, isRight, isSpace, isSpaceReleased;
boolean reload;
PImage play;
PImage bg;
int savedReloadTime,reloadTime;
boolean attack;
int savedAttackTime,attackTime;

void setup(){
   background(255);
   size(1000,450);
   frameRate(60);
   player = new Player();
   play = loadImage("gunguy.png");
   bg = loadImage("bg.png");
   bullets = new ArrayList<Bullets>();
   enemy = new ArrayList<Enemy>();
   canShoot = false;    
   reload = false;
   savedReloadTime = millis();
   reloadTime = player.getReloadTime();
   savedAttackTime = millis();
   attackTime = 2000;

 
}

void draw(){
  background(255);
  image(bg,0,0);
  fill(255,0,0);
  textSize(20);
  text(player.getHealth() + "", 950, 405);
  fill(255,255,0);
  textSize(20);
  text(player.getAmmo() + "", 950 , 435);
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
  
// remove bullets out of screen  
  ArrayList<Bullets> removeBullets = new ArrayList<Bullets>();
    for (Bullets b: bullets){
      if ( ( (b.getXCor() > 1000) || (b.getXCor() < 0) ) ||
        ( (b.getYCor() > 450) || (b.getYCor() < 0) )) {
          
        removeBullets.add(b);         
        }    
    }
    bullets.removeAll(removeBullets); 
  
// remove bullets that hit enemy 
  ArrayList<Bullets> removeBullets2 = new ArrayList<Bullets>();  
    for (Enemy e: enemy){
           for (Bullets b: bullets){
              if ( ( ( b.getXCor() + (b.getWidth()/2) >= e.getXCor() ) && ( b.getXCor() + (b.getWidth()/2) <= e.getXCor() + e.getWidth())
              && ( b.getYCor() + (b.getHeight() / 2) >= e.getYCor()) && ( b.getYCor() + ( b.getHeight()/2 ) <= e.getYCor() + e.getHeight()))){
                 
               e.setHealth(e.getHealth() - player.getDamage());
               removeBullets2.add(b); 
              }
           }
    }
    bullets.removeAll(removeBullets2); 
            
    
    
  for (Enemy e: enemy){
     e.display();
     if (e.getXCor()<= 720){
       e.setXCor(e.getXCor() + e.getXSpeed());
       e.setYCor(e.getYCor() + e.getYSpeed());  
     }
   if (e.getXCor() >= 720){
         e.attacking = true;    
   }   
  
  }
          
          
          
  
// Remove Dead enemies  
  ArrayList<Enemy> removeEnemy = new ArrayList<Enemy>();
  for (Enemy e: enemy){
     if (e.getHealth() <= 0){
        removeEnemy.add(e);
        
     }                  
  }
  enemy.removeAll(removeEnemy);
   
  
  if (canShoot){
     if (player.getGun().equals("pistol")){
       bullets.add(new Bullets(player.getXCor() + (player.getWidth() / 2), player.getYCor() + (player.getHeight()/2), 60 , 60 , 40 , 1 ));       
       player.setAmmo(player.getAmmo()-1);
       canShoot = false;
     }
     if (player.getGun().equals("shotgun")){
        bullets.add(new Bullets(player.getXCor() + (player.getWidth() / 2), player.getYCor() + (player.getHeight()/2), 60 , 60 , 40 , 1 ));       
        bullets.add(new Bullets(player.getXCor() + (player.getWidth() / 2), player.getYCor() + (player.getHeight()/2), 60 , 60 , 40 , 1 ));       
        bullets.add(new Bullets(player.getXCor() + (player.getWidth() / 2), player.getYCor() + (player.getHeight()/2), 60 , 60 , 40 , 1 ));     
        player.setAmmo(player.getAmmo()-3);
        canShoot = false;         
     }
  } 

  if (millis() % 100 < 3){
     enemy.add(new Enemy()); 
  }
  
//reload  
  int passedTime = millis() - savedReloadTime;
  if (player.getAmmo() <= 0){
      reload = true;      
  }
  
  if (reload){
     if (passedTime > reloadTime){
        player.setAmmo(12);
        reload = false;
        savedReloadTime = millis();
     } 
  }
  
//attack  
  for (Enemy e: enemy){  
    if (e.attacking){
          int passedTime2 = millis() - e.getSavedAttackTime();
        if( passedTime2 > e.getAttackTime() ){
          player.setHealth(player.getHealth() - e.getDamage());
          e.attacking = false;
          e.setSavedAttackTime(millis());    
        }
    }
  }
  

  
}



void mousePressed(){         
    if (player.getAmmo() > 0 && reload == false){  
      canShoot = true;
    }
}



public void processKeys(){
   if (isUp){
     if (player.getYCor() > 80){
       player.setYCor(player.getYCor()-player.getYSpeed());
     }
   } 
   if (isDown){
     if (player.getYCor() < 280){
       player.setYCor(player.getYCor()+player.getYSpeed());
     }
   } 
   if (isLeft){
     if (player.getXCor() > 770){
       player.setXCor(player.getXCor()-player.getXSpeed());
     }
   } 
   if (isRight){
     if (player.getXCor() < 830){
     player.setXCor(player.getXCor()+player.getXSpeed());
     }
   }    

}

// total damage done to barricade
public int getTotalDamage(){
  int totalDamage = 0;  
   for (Enemy e: enemy){
      if (e.getXCor() >= 720){
        totalDamage += e.getDamage(); 
      }
   }
   return totalDamage;
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
     
     
     if (key == 82){
        reload = true; 
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


