public class Enemy extends Units{
   public Enemy(){
      super( 10 , 0 , (int) random(250) + 100, 3 , 0, 20 , 50);             
   } 
   
   public void display(){
      fill(255,0,255);
      noStroke();
      rect(getXCor(),getYCor(),getWidth(),getHeight()); 
   }
}
