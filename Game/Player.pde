public class Player extends Units{
    private String gun;
    private int money;
    private boolean dead;
    private int ammo;  
    
    public Player(){
    super(100, 800 ,225 , 5 , 5 , 20 , 50);
    gun = "pistol";
    money = 0;
    dead = false;
    ammo = 12;
    }
    
    public String getGun(){
        return gun; 
    }
    
    public void setGun(String gun){
      this.gun = gun;
    }  
    
    public int getMoney(){
       return money; 
    }
    
    public void setMoney(int money){
       this.money = money; 
    }
    
    public int getAmmo(){
       return ammo; 
    }
    
    public void setAmmo(int ammo){
       this.ammo = ammo; 
    }
    
    public void display(){
       if (health <= 0){
        dead = true;
       }
    }
    
}
