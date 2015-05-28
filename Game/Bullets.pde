public class Bullets{
  float xCor, yCor;
  int xSpeed, ySpeed;
  
  public Bullets(int XCor, int YCor, int xSpeed, int ySpeed){
    this.xCor = float(XCor);
    this.yCor = float(YCor);
    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;    
  }
  
  public float getXCor(){
     return xCor; 
  }
  
  public void setXCor(float xCor){
   this.xCor = xCor; 
  }

  public float getYCor(){
     return yCor; 
  }  
 
  public void setYCor(float yCor){
   this.yCor = yCor; 
  }
  
  public int getXSpeed(){
     return xSpeed; 
  }
  
  public void setXSpeed(int xSpeed){
     this.xSpeed = xSpeed; 
  }
  
  public int getYSpeed(){
     return ySpeed; 
  }
  
  public void setYSpeed(int ySpeed){
     this.ySpeed = ySpeed; 
  }  

  
}
