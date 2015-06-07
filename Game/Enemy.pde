public class Enemy extends Units{
   private int damage;
   private int savedAttackTime, attackTime;
   private boolean attacking;
   private int switchDelay;
   PImage z;
   public Enemy(){
      super( 10 , 0 , (int) random(250) + 100, 1 , 0, 45 , 60);
      damage = 1;
      savedAttackTime = millis();
      attackTime = 2000;
      switchDelay = 79;
      z = loadImage("z0.png");
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
      switchDelay -= 1;
      z = loadImage("z" + (switchDelay / 20) + ".png");
      if (switchDelay == 0){
        switchDelay = 79;
      }
      fill(0, 255, 0, 0);
      noStroke();
      rect(getXCor(),getYCor(),getWidth(),getHeight()); 
      image(z,getXCor(),getYCor());
   }
}
