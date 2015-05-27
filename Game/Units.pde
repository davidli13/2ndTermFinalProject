public class Unit
{
  public int health;
  public int xcor;
  public int ycor;
  public int xspeed;
  public int yspeed;
  public int width;
  public int height;

  public Unit() {}
  public Unit(int health, int xcor, int ycor, int xspeed, int yspeed, int weight, int height)
  {
    this.health = health;
    this.xcor = xcor;
    this.ycor = ycor;
    this.xspeed = xspeed;
    this.yspeed = yspeed;
    this.width = weight;
    this.height = height;    
  }  
  
  public int getHealth() { 
    return health; 
  }
  public int getXCor() { 
    return xcor; 
  }
  public int getYCor() { 
    return ycor;
  }
  public int getXMove() { 
    return xspeed; 
  }
  public int getYMove() { 
    return yspeed; 
  }
  public int getWidth() {
    return width; 
  }
  public int getHeight() { 
    return height;
  }

  
  public void setHealth(int health) { 
    this.health = health; 
  }
  public void setXCor(int xcor) { 
    this.xcor = xcor; 
  }
  public void setYCor(int ycor) { 
    this.ycor = ycor;
  }
  public void setXSpeed(int xspeed) {
    this.xspeed = xspeed; 
  }
  public void setYSpeed(int yspeed) { 
   this.yspeed = yspeed; 
  }
  public void setWidth(int width) { 
   this.width = width;
  }
  public void setHeight(int height) { 
   this.height = height; 
  }

}
