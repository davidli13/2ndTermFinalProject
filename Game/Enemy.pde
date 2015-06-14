public class Enemy extends Units{
   private int damage;
   private int savedAttackTime, attackTime;
   private boolean attacking;
   private int switchDelay;
   private int deathTimer;
   
   PImage z;
   PImage d;
   public Enemy(){
      super( 20 , 0 , (int) random(250) + 100, 1 , 0, 45 , 60);
      damage = 2;
      savedAttackTime = millis();
      attackTime = 2000;
      switchDelay = 79;
      deathTimer = 119;
      z = loadImage("z0.png");
      d = loadImage("d0.png");
   }

  public Enemy(int health, int xcor, int ycor, int xspeed, int yspeed, int width, int height)
  {
    this.health = health;
    this.xcor = xcor;
    this.ycor = ycor;
    this.xspeed = xspeed;
    this.yspeed = yspeed;
    this.width = width;
    this.height = height;    
  }   
   
   public class runner extends Enemy{
      public runner(){
        super(  10 , 0 , (int) random(250) + 100, 2 , 0 , 35 , 70);
        damage = 1;
        attackTime = 1500;  
        attacking = false;
        savedAttackTime = millis();        
      }   
      
      public void display(){
         if (getHealth() > 0){
            fill(255,0,0);
            rect(getXCor(),getYCor(),getWidth(),getHeight());            
         }
      }
   }
   
   public class armed extends Enemy{
     
     public armed(){
       super( 15 , 0 , (int) random(250) + 100 , 1 , 0 , 45 , 60);  
       damage = 3;
       attackTime = 1500;
       savedAttackTime = millis(); 
       attacking = false;
     }
     
     public void display(){
         if (getHealth() > 0){
            fill(255,0,0);
            rect(getXCor(),getYCor(),getWidth(),getHeight());            
         }
      }     
   }
      
   public class abomination extends Enemy{
     
      public abomination(){
        super( 50 , 0 , (int) random(250) + 100, 1 , 0 , 80 , 90);
        damage = 5;
        attackTime = 2000;
        savedAttackTime = millis(); 
        attacking = false;
      }
      public void display(){
         if (getHealth() > 0){
            fill(255,0,0);
            rect(getXCor(),getYCor(),getWidth(),getHeight());            
         }
      }      
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
