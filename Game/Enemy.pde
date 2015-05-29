public class Enemy extends Units{
   public Enemy(){
      super( 10 , 0 , (int) random(600) , 3 , 0, 20 , 50);             
   } 
   
   public void display(){
      fill(255,255,0);
      rect(getXCor(),getYCor(),getWidth(),getHeight()); 
   }
}
