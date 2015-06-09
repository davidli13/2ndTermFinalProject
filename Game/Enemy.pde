public class Enemy extends Units{
   private int damage;
   private int savedAttackTime, attackTime;
   private boolean attacking;
   private int switchDelay;
   private int deathTimer;
   PImage z;
   PImage d;
   public Enemy(){
      super( 10 , 0 , (int) random(250) + 100, 1 , 0, 45 , 60);
      damage = 1;
      savedAttackTime = millis();
      attackTime = 2000;
      switchDelay = 79;
      deathTimer = 119;
      z = loadImage("z0.png");
      d = loadImage("d0.png");
   }      
   
   public int getDamage(){
      return damage; 
   }
   
   public void setSavedAttackTime(int time){
       savedAttackTime = time;
   }
   
   public int getSavedAttackTime(){
      return savedAttackTime; 
   }
   
   public int getAttackTime(){
      return attackTime; 
   }
   
   
   
   public void display(){
      if (getHealth() > 0){
      switchDelay -= 1;
      z = loadImage("z" + (switchDelay / 20) + ".png");
      if (switchDelay == 0){
        switchDelay = 79;
      }
      fill(0, 255, 0, 0);
      noStroke();
      rect(getXCor(),getYCor(),getWidth(),getHeight()); 
      image(z,getXCor(),getYCor());
      }else{
        die();
      }
   }
   
   public void die(){
     setXSpeed(0);
     deathTimer -= 1;
     //d = loadImage("d3.png");
     d = loadImage("d" + (5 - (deathTimer / 20)) + ".png");
     image(d,getXCor(),getYCor());
     if (deathTimer == 0){
        deathTimer = 119;
     }
   }     
}
