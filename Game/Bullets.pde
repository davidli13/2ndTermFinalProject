public class Bullets{
  float xCor, yCor, rotation;
  int xSpeed, ySpeed, width, height;

  
  public Bullets(int XCor, int YCor, int xSpeed, int ySpeed, int width, int height){
    this.xCor = float(XCor);
    this.yCor = float(YCor);
    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;    
    this.width = width;
    this.height = height;
    rotation = atan2(mouseY - (player.getYCor() + (player.getHeight()/2)) + ((int) random(50) - 25) , mouseX - (player.getXCor() + (player.getWidth() / 2))) / PI * 180; 
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
  
  public int getWidth(){
     return width; 
  }
  
  public void setWidth(int width){
     this.width = width;
  }

  public int getHeight(){
     return height; 
  }
  
  public void setHeight(int height){
     this.height = height; 
  }  
  
  public float getRotation(){
     return rotation; 
  }
  
  
  
  public void display(){
        fill(150,150,0);
        noStroke();
        rect(getXCor(), getYCor(), getWidth(), getHeight());
     
  }

  
}
