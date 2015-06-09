public class Player extends Units{
    private String gun;
    private int money;
    private boolean dead;
    private int ammo;
    private int damage;  
    private int reloadTime;
    private int accuracy;
    
    public Player(){
    super(100, 800 ,225 , 5 , 5 , 20 , 50);
    gun = "pistol";
    money = 1000;
    dead = false;
    if (gun.equals("pistol")){
       damage = 5; 
       ammo = 12;
       reloadTime = 4000;
    }
    if (gun.equals("shotgun")){
       damage = 5; 
       ammo = 18;  
       reloadTime = 5000;
    }
    if (gun.equals("smg")){
       damage = 3;
       ammo = 30;
       reloadTime = 3000; 
    }
    if (gun.equals("sniperRifle")){
       damage = 15;
       ammo = 8 ;
       reloadTime = 6000;
    }
    if (gun.equals("assualtRifle")){
       damage = 8;
       ammo = 20;
       reloadTime = 5000; 
    }
    if (gun.equals("minigun")){
       damage = 5;
       ammo = 200;
       reloadTime = 8000; 
    }
        
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
    
    public int getDamage(){
       return damage; 
    }
    
    public int getReloadTime(){
       return reloadTime; 
    }
    
    
    public void display(){
       if (health <= 0){
        dead = true;
       }
    }
    
}
