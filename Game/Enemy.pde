public class Enemy extends Units{
   private int damage;
   private int savedAttackTime, attackTime;
   private boolean attacking;
   PImage z;
   public Enemy(){
      super( 10 , 0 , (int) random(250) + 100, 1 , 0, 35 , 90);
      damage = 1;
      savedAttackTime = millis();
      attackTime = 2000;
      z = loadImage("z1.png");
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
      fill(0, 255, 0 );
      noStroke();
      rect(getXCor(),getYCor(),getWidth(),getHeight()); 
      image(z,getXCor(),getYCor());
   }
}
