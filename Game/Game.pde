import ddf.minim.*;
Player player;
ArrayList<Bullets> bullets;
ArrayList<Enemy> enemy;
boolean canShoot;
float canShootCounter;
boolean isUp, isDown, isLeft, isRight, isSpace, isSpaceReleased;
boolean reload;
PImage play, smg, shotgun, sniperRifle, assaultRifle, minigun;
PImage bg, shop;
PImage deadZ;
boolean inShop, inRound;
int savedReloadTime,reloadTime;
int shootDelay;
boolean attack;
boolean show1, show2, show3, show4, show5;
Minim minim;
AudioPlayer gunshot1, gunshot2, gunshot3;
int deadTimer;
PImage deadz;
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
   savedReloadTime = 0;
   shootDelay = 1;
   reloadTime = player.getReloadTime();
   smg = loadImage("smg.png");
   shotgun = loadImage("shotgun.png");
   sniperRifle = loadImage("sniperrifle.png");
   assaultRifle = loadImage("assaultrifle.png");
   minigun = loadImage("minigun.png");   
   //shop = loadImage("shop.png"); 
   inShop = false;
   inRound = true;
   minim = new Minim(this);
   gunshot1 = minim.loadFile("shot_pistol.mp3");
   gunshot2 = minim.loadFile("shot_shotgun.mp3");
   gunshot3 = minim.loadFile("shot_smg.mp3");
   deadTimer = 150;
   deadz = loadImage("d0.png");
}

void draw(){
  
// shop mode  
  if (inShop){
   background(255);
   image(shop,0,0);
   fill(0,255,0);  
   image(smg,0,0); 
   text("$100",150, 50);
   image(shotgun,0,90);
   text("$500",150, 130);   
   image(sniperRifle,0,180);
   text("$1000",150, 220);       
   image(assaultRifle,0,265);
   text("$2000",150, 310);    
   image(minigun,0,350); 
   text("$5000",150, 400);  


   
   textSize(25);
   fill(255,255,0);
   text("Damage :", 400, 50);
   text("Clip Size :", 400, 150);
   text("Shots/sec :" , 400, 250);
   text("Reload Time :" , 400, 350);

    textSize(40); 
    fill(50,255,50);
    text("$"+player.getMoney(), 740, 50);

   
   textSize(25);
   fill(255,255,0);
   if (overRect(0,0,130, 70) && mousePressed){
     show1 = true; show2= false; show3 = false; show4 = false; show5 = false;
   } 
   if (show1){
     text("3" , 530, 50);
     text("30" , 540, 150);
     text("5" , 560, 250);
     text("5.00" , 590, 350);  
   }

   if (overRect(0,90,130,70) && mousePressed){
     show1 = false; show2= true; show3 = false; show4 = false; show5 = false;
   } 
   if (show2){
     text("5" , 530, 50);
     text("18" , 540, 150);
     text("1" , 560, 250);
     text("5.00" , 590, 350);  
   }  
   
   if (overRect(0,180,130,70) && mousePressed){
     show1 = false; show2= false; show3 = true; show4 = false; show5 = false;
   } 
   if (show3){
     text("10" , 530, 50);
     text("8" , 540, 150);
     text("2" , 560, 250);
     text("6.00" , 590, 350);  
   }    
  
   if (overRect(0,265,130,70) && mousePressed){
     show1 = false; show2= false; show3 = false; show4 = true; show5 = false;
   } 
   if (show4){
     text("8" , 530, 50);
     text("20" , 540, 150);
     text("3" , 560, 250);
     text("5.00" , 590, 350);  
   }
  
   if (overRect(0,310,130,70) && mousePressed){
     show1 = false; show2= false; show3 = false; show4 = false; show5 = true;
   } 
   if (show5){
     text("5" , 530, 50);
     text("200" , 540, 150);
     text("6" , 560, 250);
     text("8.00" , 590, 350);  
   }   
   

   textSize(30);
   fill(255,100,100);
   text("Purchase", 750, 150);
   textSize(30);
   fill(255,255,255);
   text("Proceed", 860 , 420);
   
   if (overRect(740, 120, 140, 50) && show1 == true && mousePressed){
      if (player.getMoney() >= 100){
        player.setMoney(player.getMoney() - 100);
        player.setGun("smg");
      } 
   }
   if (overRect(740, 120, 140, 50) && show2 == true && mousePressed){
      if (player.getMoney() >= 500){
        player.setMoney(player.getMoney() - 500);
        player.setGun("shotgun");
      } 
   }
   if (overRect(740, 120, 140, 50) && show3 == true && mousePressed){
      if (player.getMoney() >= 1000){
        player.setMoney(player.getMoney() - 1000);
        player.setGun("sniperRifle");
      } 
   }
   if (overRect(740, 120, 140, 50) && show4 == true && mousePressed){
      if (player.getMoney() >= 2000){
        player.setMoney(player.getMoney() - 2000);
        player.setGun("assaultRifle");
      } 
   }
   if (overRect(740, 120, 140, 50) && show5 == true && mousePressed){
      if (player.getMoney() >= 5000){
        player.setMoney(player.getMoney() - 5000);
        player.setGun("minigun");
      } 
   }  
  
  
  fill(100,100,255);
  textSize(20);
  if (player.getGun().equals("smg")){
     text("equipped", 250 , 50);
  } else if (player.getGun().equals("shotgun")){
     text("equipped", 250 , 130);      
  } else if (player.getGun().equals("sniperRifle")){
     text("equipped", 250 , 220);      
  } else if (player.getGun().equals("assaultRifle")){
     text("equipped", 250 , 310);      
  } else if (player.getGun().equals("minigun")){
     text("equipped", 250 , 400);      
  }
  
  
  if (overRect(860,390, 130, 150) && mousePressed){
     inShop = false;
     inRound = true;
     
  }


  }
  
  
//game mode  
  if (inRound){
  noCursor();
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
  
  if (!reload) {
      fill(0);
    }else {
      fill(255,0,0); 
    }
  rect(mouseX - 1 , mouseY - 20, 1 , 15);
  rect(mouseX - 1 , mouseY + 5, 1 , 15);
  rect(mouseX - 20 , mouseY , 15 , 1); 
  rect(mouseX + 5 , mouseY , 15 , 1);   
  
  
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
        
        /*if (deadTimer > 0){
          deadTimer -= 1;
          deadz = loadImage("d" + (deadTimer / 30) + ".png");
          image(deadz, e.getXCor(), e.getYCor());
        }*/        
     }       
  }
  deadTimer -= 1;
  if (deadTimer == 0){
    enemy.removeAll(removeEnemy);
    deadTimer = 140;
  }
  
  
  
  
   
  if (mousePressed == true){
     shootDelay -= 1; 
     //60 = 1 second;
  }
  //print(shootDelay + "\n");
  //print(player.getGun() + "\n");
  
  /*if (player.getGun().equals("pistol")){
    gunshot = minim.loadFile("shot_pistol.mp3");
  }
  if (player.getGun().equals("shotgun")){
    gunshot = minim.loadFile("shot_shotgun.mp3");
  }
  if (player.getGun().equals("smg")){
    gunshot = minim.loadFile("shot_smg.mp3");
  }*/
  
  if (shootDelay == 0){
     if (player.getGun().equals("pistol")){
       shootDelay = 30;
       bullets.add(new Bullets(player.getXCor() + (player.getWidth() / 2), player.getYCor() + (player.getHeight()/2), 40 , 40 , 40 , 1 ));       
       player.setAmmo(player.getAmmo()-1);
       //canShoot = false;
       gunshot1.play();
       gunshot1.rewind();
     }
     if (player.getGun().equals("shotgun")){
        shootDelay = 60;
        bullets.add(new Bullets(player.getXCor() + (player.getWidth() / 2), player.getYCor() + (player.getHeight()/2), 50 , 50 , 40 , 1 ));       
        bullets.add(new Bullets(player.getXCor() + (player.getWidth() / 2), player.getYCor() + (player.getHeight()/2), 50 , 50 , 40 , 1 ));       
        bullets.add(new Bullets(player.getXCor() + (player.getWidth() / 2), player.getYCor() + (player.getHeight()/2), 50 , 50 , 40 , 1 ));     
        player.setAmmo(player.getAmmo()-3);
        //canShoot = false;             
         gunshot2.play();
         gunshot2.rewind();     
     }
     if (player.getGun().equals("smg")){
       shootDelay = 15;
       bullets.add(new Bullets(player.getXCor() + (player.getWidth() / 2), player.getYCor() + (player.getHeight()/2), 60 , 60 , 20 , 1 ));       
       player.setAmmo(player.getAmmo()-1);
       canShoot = false;   
       
         gunshot3.play();
         gunshot3.rewind();     
     }
     if (player.getGun().equals("sniperRifle")){
       bullets.add(new Bullets(player.getXCor() + (player.getWidth() / 2), player.getYCor() + (player.getHeight()/2), 60 , 60 , 60 , 2 ));       
       player.setAmmo(player.getAmmo()-1);
       canShoot = false;       
     }     
     if (player.getGun().equals("assaultRifle")){
       bullets.add(new Bullets(player.getXCor() + (player.getWidth() / 2), player.getYCor() + (player.getHeight()/2), 40 ,40 , 40 , 2 ));       
       player.setAmmo(player.getAmmo()-1);
       canShoot = false;       
     }
     if (player.getGun().equals("minigun")){
       bullets.add(new Bullets(player.getXCor() + (player.getWidth() / 2), player.getYCor() + (player.getHeight()/2), 60 , 60 , 60 , 1 ));       
       player.setAmmo(player.getAmmo()-1);
       canShoot = false;       
     }     
     
  } 

  if (millis() % 100 < 3){
     enemy.add(new Enemy()); 
  }
  
//reload  
  int passedTime = 0;
  if (player.getAmmo() <= 0){    
      shootDelay = 99999; 
      reload = true;     
  }
  
  if (reload){
        passedTime = millis() - savedReloadTime;   
     if (passedTime > reloadTime){
        player.setAmmo(12);
        savedReloadTime = millis();        
        reload = false;
        shootDelay = 1;
     }
  }
  
//zombie attacks barricade  
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
  


//Cursor
  translate(mouseX, mouseY);
  for( float a = 0; a < 360; a+=1){
    pushMatrix();
    rotate( radians(a) );
    if (!reload) {
      fill(0);
    }else {
      fill(255,0,0); 
    }
    ellipse( 10,0,2,2);
    popMatrix();
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
    //print(keyCode);
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
     if (key == 49){
       player.setGun("pistol");
     }
     if (key == 50){
       player.setGun("shotgun");
     }
     if (key == 51){
       player.setGun("smg");
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


