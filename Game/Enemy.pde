public class Enemy extends Units{
   private int damage;
   
   public Enemy(){
      super( 10 , 0 , (int) random(250) + 100, 1 , 0, 20 , 50);
      damage = 1;
   }      
   
   public int getDamage(){
      return damage; 
   }
   
   public void display(){
      fill(0, 255, 0 );
      noStroke();
      rect(getXCor(),getYCor(),getWidth(),getHeight()); 
   }
}
