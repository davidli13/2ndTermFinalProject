public class Enemy extends Units{
   public Enemy(){
      super( 10 , 0 , (int) random(250) + 100, 1 , 0, 20 , 50);             
   } 
   
   public void display(){
      fill(0, 255, 0 );
      noStroke();
      rect(getXCor(),getYCor(),getWidth(),getHeight()); 
   }
}
