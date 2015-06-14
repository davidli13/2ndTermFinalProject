import ddf.minim.*;
Player player;
ArrayList<Bullets> bullets;
ArrayList<Enemy> enemy;
boolean canShoot, cooldown;
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
int night = 1;
int spawnTime, savedSpawnTime, spawnTime2, savedSpawnTime2,spawnTime3, savedSpawnTime3, spawnTime4, savedSpawnTime4;
int numSpawn, numSpawn2, numSpawn3, numSpawn4;
boolean spawn, spawn2, spawn3, spawn4;
int waitTime, savedWaitTime;
boolean smgPurchased, shotgunPurchased, sniperRiflePurchased, assaultRiflePurchased, minigunPurchased; 
boolean gainMoney;
boolean proceed;
boolean clicked, released;
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
   shop = loadImage("shop.png"); 
   inShop = false;
   inRound = true;
   minim = new Minim(this);
   gunshot1 = minim.loadFile("shot_pistol.mp3");
   gunshot2 = minim.loadFile("shot_shotgun.mp3");
   gunshot3 = minim.loadFile("shot_smg.mp3");
   deadTimer = 150;
   deadz = loadImage("d0.png");
   night = 1; 
   numSpawn = 3;
   numSpawn2 = 2;
   numSpawn3 = 1;
   numSpawn4 = 1;  
   savedSpawnTime = millis();
   savedSpawnTime2 = millis();
   savedSpawnTime3 = millis();
   savedSpawnTime4 = millis();   
   spawn = false;
   spawn2 = false;
   spawn3 = false;
   spawn4 = false;   
   waitTime = 5000;   
}

void draw(){
  
// shop mode  
  if (inShop){
   cursor();
   cursor(HAND);
   background(255);
   image(shop,0,0);
   fill(0,255,0);  
   image(smg,0,0);
   text("$600",160, 50);
   image(shotgun,0,90);
   text("$1200",160, 130);   
   image(sniperRifle,0,180); 
   text("$2000",170, 220);       
   image(assaultRifle,0,265);
   text("$3000",170, 310);    
   image(minigun,0,350);   
   text("$5000",165, 400);  
   
   textSize(25);
   fill(255,255,0);
   text("Damage :", 400, 50);
   text("Clip Size :", 400, 110);
   text("Shots/sec :" , 400, 170);
   text("Reload Time :" , 400, 230);

   textSize(40); 
   fill(50,255,50);
   text("$"+player.getMoney(), 790, 50);

   
   textSize(25);
   fill(255,255,0);
   if (overRect(0,0,130, 70) && mousePressed){
     show1 = true; show2= false; show3 = false; show4 = false; show5 = false;
   } 
   if (show1){
     clicked = false;
     text("3" , 500, 50);
     text("30" , 510, 110);
     text("5" , 520, 170);
     text("4.00" , 530, 230);  
   }

   if (overRect(0,90,130,70) && mousePressed){
     show1 = false; show2= true; show3 = false; show4 = false; show5 = false;
   } 
   if (show2){
     clicked = false;
     text("4" , 500, 50);
     text("6" , 510, 110);
     text("1" , 520, 170);
     text("5.00" , 530, 230);  
   }  
   
   if (overRect(0,180,130,70) && mousePressed){
     show1 = false; show2= false; show3 = true; show4 = false; show5 = false;
   } 
   if (show3){
     clicked = false;
     text("10" , 500, 50);
     text("8" , 510, 110);
     text("2" , 520, 170);
     text("5.00" , 530, 230);  
   }    
  
   if (overRect(0,265,130,70) && mousePressed){
     show1 = false; show2= false; show3 = false; show4 = true; show5 = false;
   } 
   if (show4){
     clicked = false;
     text("8" , 500, 50);
     text("20" , 510, 110);
     text("3" , 520, 170);
     text("5.00" , 530, 230);  
   }
  
   if (overRect(0,310,130,70) && mousePressed){
     show1 = false; show2= false; show3 = false; show4 = false; show5 = true;
   } 
   if (show5){
     clicked = false;
     text("5" , 500, 50);
     text("200" , 510, 110);
     text("6" , 520, 170);
     text("8.00" , 530, 230);  
   }   
   

   textSize(30);
   fill(255,100,100);
   text("Purchase Gun", 810, 150);   
   text("Repair Barricade", 810 , 300);
   
   textSize(40);
   fill(255,0,0);
   text(""+ player.getHealth(), 810 , 250);

   textSize(30);
   fill(255,255,255);
   text("Proceed", 910 , 420);
   
   
   if (smgPurchased){
      if (player.getMoney() >= 600){
        player.setMoney(player.getMoney() - 600);
        player.setGun("smg");
        player.setDamage(3);
        player.setAmmo(30);
        player.setMaxClip(30);
        player.setReloadTime(4000);
        smgPurchased = false;
        clicked = false;
      }        
   } else if (shotgunPurchased){
      if (player.getMoney() >= 1200){
        player.setMoney(player.getMoney() - 1200);
        player.setGun("shotgun");
        player.setDamage(4);
        player.setAmmo(6);
        player.setMaxClip(6);
        player.setFireRate(1500);
        player.setReloadTime(4000);
                
        shotgunPurchased = false;
        clicked = false;
      }        
   } else if (sniperRiflePurchased){
      if (player.getMoney() >= 2000){
        player.setMoney(player.getMoney() -2000);
        player.setGun("sniperRifle");
        player.setDamage(15);
        player.setAmmo(8);
        player.setMaxClip(8);
        player.setFireRate(1500);
        player.setReloadTime(5000);       
        sniperRiflePurchased = false;
        clicked = false;
      }        
   } else if (assaultRiflePurchased){
      if (player.getMoney() >= 3000){
        player.setMoney(player.getMoney() - 3000);
        player.setGun("assaultRifle");
        player.setDamage(8);
        player.setAmmo(20);
        player.setMaxClip(20);
        player.setReloadTime(5000);        
        assaultRiflePurchased = false;
        clicked = false;
      }        
   } else if (minigunPurchased){
      if (player.getMoney() >= 5000){
        player.setMoney(player.getMoney() - 5000);
        player.setGun("minigun");
        player.setDamage(5);
        player.setAmmo(200);
        player.setMaxClip(200);
        player.setReloadTime(8000);        
        minigunPurchased = false;
        clicked = false;
      }        
   }
   
   if (mousePressed && released){
      clicked = true;
      released = false; 
   }
   if (overRect(710, 120, 200, 50) && show1 == true && clicked){
      smgPurchased = true;
   }
   if (overRect(710, 120, 200, 50) && show2 == true && clicked){
      shotgunPurchased = true;
   }
   if (overRect(710, 120, 200, 50) && show3 == true && clicked){
      sniperRiflePurchased = true;
   }
   if (overRect(710, 120, 200, 50) && show4 == true && clicked){
      assaultRiflePurchased = true;
   }
   if (overRect(710, 120, 200, 50) && show5 == true && clicked){
      minigunPurchased = true;
   }  
   
   if (overRect(680, 270, 270 , 50) && mousePressed && player.getHealth() < 100){
      player.setMoney(player.getMoney() - 1);
      player.setHealth(player.getHealth() + 1);
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
     proceed = true;
       
  }
  
  
//Next round spawns  
  if (proceed){
     night ++;
     if (night == 2) {
       numSpawn = 5;
       numSpawn2 = 3;
       numSpawn3 = 1;
     } else if (night == 3){
        numSpawn = 8; 
        numSpawn2 = 4;
        numSpawn3 = 2;
     } else if (night == 4){
        numSpawn = 5;
        numSpawn2 = 4; 
        numSpawn3 = 6;       
     } else if (night == 5){
        numSpawn = 6;
        numSpawn2 = 6;
        numSpawn3 = 7; 
     } else if (night == 6){
        numSpawn = 6;
        numSpawn2 = 10;
        numSpawn3 = 3; 
     } else if (night == 7){       
        numSpawn = 3;
        numSpawn2 = 4;
        numSpawn3 = 9; 
     } else if (night == 8){
        numSpawn = 5; 
        numSpawn2 = 5;
        numSpawn3 = 5;
        numSpawn4 = 1;
     } else if (night == 9){
        numSpawn = 6;
        numSpawn2= 2;
        numSpawn3 = 7;
        numSpawn4 = 3; 
     } else if (night == 10){
        numSpawn = 8;
        numSpawn2 = 5;
        numSpawn3 = 10;
        numSpawn4 = 5; 
     }
     
     inShop = false;
     inRound = true;
     proceed = false;
     clicked = false; 
  }




  } else 
  
  
//game mode  
  if (inRound){
  noCursor();
  background(255);
  image(bg,0,0);
  fill(255,0,0);
  textSize(20);    
  text(player.getHealth() + "", 955, 405);
  fill(255,255,0);
  textSize(20);
  text(player.getAmmo() + "", 955 , 435);
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
              && ( b.getYCor() + (b.getHeight() / 2) >= e.getYCor()) && ( b.getYCor() + ( b.getHeight()/2 ) <= e.getYCor() + e.getHeight())) 
              && e.getHealth() > 0){
                 
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
          
          
          
  
// Remove enemies  
  ArrayList<Enemy> removeEnemy = new ArrayList<Enemy>();
  //if (inShop){
    for (Enemy e: enemy){
          if (e.getHealth() <= 0){
          removeEnemy.add(e);
          player.setMoney(player.getMoney() + 1);        
        /*if (deadTimer > 0){
          deadTimer -= 1;
          deadz = loadImage("d" + (deadTimer / 30) + ".png");
          image(deadz, e.getXCor(), e.getYCor());
        }*/          
          }
  
    }
    
  

  fill(255,0,0);
  text("" + player.getMoney(), 100, 100);  
       
  //}

  deadTimer -= 1;
  if (deadTimer == 0){
    deadTimer = 140;
    enemy.removeAll(removeEnemy);  
  }
  
  
  
  
   
  if (mousePressed == true && player.getAmmo() > 0){
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
  
  if (canShoot){
     if (player.getGun().equals("pistol")){
       bullets.add(new Bullets(player.getXCor() + (player.getWidth() / 2), player.getYCor() + (player.getHeight()/2), 40 , 40 , 40 , 1 ));       
       player.setAmmo(player.getAmmo()-1);
       canShoot = false;
       cooldown = false;
       gunshot1.play();
       gunshot1.rewind();
     } else if (player.getGun().equals("shotgun")){
        bullets.add(new Bullets(player.getXCor() + (player.getWidth() / 2), player.getYCor() + (player.getHeight()/2), 50 , 50 , 40 , 1 ));       
        bullets.add(new Bullets(player.getXCor() + (player.getWidth() / 2), player.getYCor() + (player.getHeight()/2), 50 , 50 , 40 , 1 ));       
        bullets.add(new Bullets(player.getXCor() + (player.getWidth() / 2), player.getYCor() + (player.getHeight()/2), 50 , 50 , 40 , 1 ));     
        player.setAmmo(player.getAmmo()-1);
        canShoot = false;   
        cooldown = false;        
        gunshot2.play();
        gunshot2.rewind();    
     } else if (player.getGun().equals("sniperRifle")){
        bullets.add(new Bullets(player.getXCor() + (player.getWidth() / 2), player.getYCor() + (player.getHeight()/2), 60 , 60 , 60 , 2 ));          
        player.setAmmo(player.getAmmo()-1);
        canShoot = false;   
        cooldown = false;          
     }
  }
  
  if (shootDelay == 0){
     if (player.getGun().equals("smg")){
       shootDelay = 5;
       bullets.add(new Bullets(player.getXCor() + (player.getWidth() / 2), player.getYCor() + (player.getHeight()/2), 60 , 60 , 20 , 1 ));       
       player.setAmmo(player.getAmmo()-1);
       canShoot = false;   
       
         gunshot3.play();
         gunshot3.rewind();     
     }  
     if (player.getGun().equals("assaultRifle")){
       shootDelay = 10;;
       bullets.add(new Bullets(player.getXCor() + (player.getWidth() / 2), player.getYCor() + (player.getHeight()/2), 40 ,40 , 40 , 2 ));       
       player.setAmmo(player.getAmmo()-1);
       canShoot = false;       
      
     }
     if (player.getGun().equals("minigun")){
       shootDelay = 3;
       bullets.add(new Bullets(player.getXCor() + (player.getWidth() / 2), player.getYCor() + (player.getHeight()/2), 60 , 60 , 60 , 1 ));       
       player.setAmmo(player.getAmmo()-1);
       canShoot = false;       
  
     }     
     
  } 

// zombie round time spawning
  if (night == 1){    
    spawnTime = (int) random(3000) + 1000;
    spawnTime2 = (int) random( 6000 ) + 2000;
    spawnTime3 = (int) random( 4000 ) + 3000;
    spawnTime4 = (int) random(8000) + 6000;
    spawnTimerAll();
        
  } else if (night == 2){   
    spawnTime = (int) random(3000) + 1000;
    spawnTime2 = (int) random( 6000 ) + 2000;
    spawnTime3 = (int) random( 4000 ) + 3000;
    spawnTime4 = (int) random(8000) + 6000;     
      spawnTimerAll();
  } else if (night == 3){   
    spawnTime = (int) random(3000) + 1000;
    spawnTime2 = (int) random( 6000 ) + 2000;
    spawnTime3 = (int) random( 4000 ) + 3000;
    spawnTime4 = (int) random(8000) + 6000;      
      spawnTimerAll();
  } else if (night == 4){   
    spawnTime = (int) random(3000) + 1000;
    spawnTime2 = (int) random( 6000 ) + 2000;
    spawnTime3 = (int) random( 4000 ) + 3000;
    spawnTime4 = (int) random(8000) + 6000;      
      spawnTimerAll();
  } else if (night == 5){   
    spawnTime = (int) random(3000) + 1000;
    spawnTime2 = (int) random( 6000 ) + 2000;
    spawnTime3 = (int) random( 4000 ) + 3000;
    spawnTime4 = (int) random(8000) + 6000;     
      spawnTimerAll();
  } else if (night == 6){   
    spawnTime = (int) random(3000) + 1000;
    spawnTime2 = (int) random( 6000 ) + 2000;
    spawnTime3 = (int) random( 4000 ) + 3000;
    spawnTime4 = (int) random(8000) + 6000;      
      spawnTimerAll();
  } else if (night == 7){   
    spawnTime = (int) random(3000) + 1000;
    spawnTime2 = (int) random( 6000 ) + 2000;
    spawnTime3 = (int) random( 4000 ) + 3000;
    spawnTime4 = (int) random(8000) + 6000;      
      spawnTimerAll();
  } else if (night == 8){   
    spawnTime = (int) random(3000) + 1000;
    spawnTime2 = (int) random( 6000 ) + 2000;
    spawnTime3 = (int) random( 4000 ) + 3000;
    spawnTime4 = (int) random(8000) + 6000;      
      spawnTimerAll();
  } else if (night == 9){   
    spawnTime = (int) random(3000) + 1000;
    spawnTime2 = (int) random( 6000 ) + 2000;
    spawnTime3 = (int) random( 4000 ) + 3000;
    spawnTime4 = (int) random(8000) + 6000;      
      spawnTimerAll();
  } else if (night == 10){   
    spawnTime = (int) random(3000) + 1000;
    spawnTime2 = (int) random( 6000 ) + 2000;
    spawnTime3 = (int) random( 4000 ) + 3000;
    spawnTime4 = (int) random(8000) + 6000;      
     spawnTimerAll();
  }
  
  
//After round completed  
  if (numSpawn == 0 && allEnemiesDead() == true ){
     textAlign(CENTER);
     textSize(40);
     fill(255,0,0);      
     text("You survived night " + night, 500, 225);       
     int waitPassedTime = millis() - savedWaitTime;
     if (waitPassedTime > waitTime){
        inRound = false;
        inShop = true;
     }
  } else if ((numSpawn == 1 || numSpawn2 == 1 || numSpawn3 == 1 || numSpawn4 == 1) && player.getAmmo() >= 1){
     savedWaitTime = millis();   
  }  
  
  if (numSpawn > 0){
     spawn = true; 
  } else {
     spawn = false; 
  }  
  if (numSpawn2 > 0){
     spawn2 = true; 
  } else {
     spawn2 = false; 
  } 
  if (numSpawn3 > 0){
     spawn3 = true; 
  } else {
     spawn3 = false; 
  } 
  if (numSpawn4 > 0){
     spawn4 = true; 
  } else {
     spawn4 = false; 
  }  
  

  
//reload  
  
  if (player.getAmmo() <= 0){
     reload = true; 
  } else if (player.getAmmo() == 1){
     player.setSavedReloadTime(millis());       
  }
    
  
  if (reload){      
     int passedTime = millis() - player.getSavedReloadTime();   
     if (passedTime > player.getReloadTime()){
        player.setAmmo(player.getMaxClip());      
        reload = false;      
     }
  }
  
//zombie attacks barricade  
  for (Enemy e: enemy){  
    if (e.attacking){
          int passedTime = millis() - e.getSavedAttackTime();
        if( passedTime > e.getAttackTime() ){
          player.setHealth(player.getHealth() - e.getDamage());
          e.attacking = false;
          e.setSavedAttackTime(millis());    
        }
    }
  }
  
//Fire rate  
  
  int passedFireRate = millis() - player.getSavedFireRate();
   if( passedFireRate > player.getFireRate() ){
       cooldown = true;
       player.setSavedFireRate(millis());    
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
    if (player.getAmmo() > 0 && reload == false && cooldown == true){  
      canShoot = true;
    }
}

void mouseReleased(){
   released = true; 
}

public void spawnEnemy(){  
  enemy.add(new Enemy());  
  numSpawn --;
  spawn = false;
}

public void spawnTimer(){
  int spawnPassedTime = millis() - savedSpawnTime;   
  if (spawnPassedTime > spawnTime){
      spawnEnemy();  
      savedSpawnTime = millis();          
  }
}

public void spawnEnemy2(){  
  enemy.add(new Enemy(). new runner());  
  numSpawn2 --;
  spawn2 = false;
}

public void spawnTimer2(){
  int spawnPassedTime = millis() - savedSpawnTime2;   
  if (spawnPassedTime > spawnTime2){
      spawnEnemy2();  
      savedSpawnTime2 = millis();          
  }
}

public void spawnEnemy3(){  
  enemy.add(new Enemy(). new armed());  
  numSpawn3 --;
  spawn3 = false;
}

public void spawnTimer3(){
  int spawnPassedTime = millis() - savedSpawnTime3;   
  if (spawnPassedTime > spawnTime3){
      spawnEnemy3();  
      savedSpawnTime3 = millis();          
  }
}

public void spawnEnemy4(){  
  enemy.add(new Enemy(). new abomination());  
  numSpawn2 --;
  spawn2 = false;
}

public void spawnTimer4(){
  int spawnPassedTime = millis() - savedSpawnTime4;   
  if (spawnPassedTime > spawnTime4){
      spawnEnemy4();  
      savedSpawnTime4 = millis();          
  }
}

public void spawnTimerAll(){
    if (spawn){
      spawnTimer();
    }
    if (spawn2){
       spawnTimer2(); 
    }
    if (spawn2){
       spawnTimer3(); 
    }
    if (spawn2){
       spawnTimer4(); 
    }  
}

public boolean allEnemiesDead(){
   for (Enemy e: enemy){
      if (e.getHealth() > 0){
         return false; 
      }
   }
   return true; 
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


