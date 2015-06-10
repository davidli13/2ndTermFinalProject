public class Player extends Units{
    private String gun;
    private int money;
    private boolean dead;
    private int ammo, maxClip;
    private int damage;  
    private int reloadTime, savedReloadTime;
    private int fireRate, savedFireRate;
    private int accuracy;
    
    public Player(){
    super(100, 800 ,225 , 5 , 5 , 20 , 50);
    gun = "pistol";
    savedReloadTime = millis();
    money = 1500;
    dead = false;
    if (gun.equals("pistol")){
       damage = 5; 
       fireRate = 500;
       ammo = 12;
       maxClip = 12;
       reloadTime = 4000;
    }
    if (gun.equals("shotgun")){
       damage = 5; 
       ammo = 6;  
       maxClip = 6;
       fireRate = 1000;
       reloadTime = 5000;
    }
    if (gun.equals("smg")){
       damage = 2;
       ammo = 30;
       maxClip = 30;
       reloadTime = 4000; 
    }
    if (gun.equals("sniperRifle")){
       damage = 15;
       ammo = 8 ;
       maxClip = 8;
       fireRate = 2000;
       reloadTime = 6000;
    }
    if (gun.equals("assaultRifle")){
       damage = 8;
       ammo = 20;
       maxClip = 20;
       reloadTime = 5000; 
    }
    if (gun.equals("minigun")){
       damage = 5;
       ammo = 200;
       maxClip = 200;
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
    
   public void setSavedReloadTime(int time){
       savedReloadTime = time;
   }
   
   public int getSavedReloadTime(){
      return savedReloadTime; 
   }
   
    public int getFiredRate(){
       return fireRate; 
    }
    
   public void setSavedFireRate(int time){
       savedFireRate = time;
   }
   
   public int getSavedFireRate(){
      return savedFireRate; 
   }   
   
   public int getMaxClip(){
      return maxClip; 
   }
   
    
    public void display(){
       if (health <= 0){
        dead = true;
       }
    }
    
}
