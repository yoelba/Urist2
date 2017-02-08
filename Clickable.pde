
//Clickable buttons will be rectangular by design, and cannot be curvy or spiky.
abstract class Clickable{
  boolean active;
  int Xpos; 
  int Ypos; //Anchor top-left corner of clickable button. 
  int spanX;
  int spanY; //X and Y width/Height (NOT anchoring of bottom-left corner)
  PImage texture;
  
  public int getXleft(){
    return this.Xpos;
  }
  
  public int getXright(){
    return this.Xpos+this.spanX;
  }
  
  public int getYup(){
    return this.Ypos;
  }
  
  public int getYdown(){
    return this.Ypos+this.spanY;
  }
  
  public boolean mouseOver(){
    if(mouseX>=this.Xpos && mouseX<=this.Xpos+this.spanX && mouseY>=this.Ypos && mouseY <=this.Ypos+this.spanY) return true;
    return false;
  }
  
  public void move(int X, int Y){
    this.Xpos = X;
    this.Ypos = Y;
  }
  
  public Clickable(int X, int Y, boolean A){
    this.Xpos = X;
    this.Ypos = Y;
    this.active = A;
  }
  
  public void render(){
    image(this.texture, this.Xpos, this.Ypos, this.spanX, this.spanY);
  }
  
  public abstract void execute();
}
//---------------------------------------------------------------------------------------------------------
class AbilityBtn extends Clickable{ //most clickables will be ability buttons, but a couple won't be.
  Ability ability;
  
  public AbilityBtn(int X, int Y, boolean A, Ability ability){
    super(X, Y, A);
    this.spanX = 200;
    this.spanY = 50;
    this.ability = ability;
    this.texture = loadImage("tileDemo.jpeg");
  }
  
  public void execute(){
    println("Hi there! You clicked A 'Ability' button!");
    setGodAttackMode(ability);
  }
  
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------
class TargetingButton extends Clickable{ //These buttons pop up when a player is using a damaging ability against an enemy.
    public TargetingButton(int X, int Y){
      super(X, Y, true);
      super.spanX = 50;
      super.spanY = 50;
    }
    
    public void render(){ //Overwrite
      fill(255,0,0,50);
      rect(super.Xpos, super.Ypos, super.spanX, super.spanY);
    }
    
  public void execute(){
    println("Hi there! You have clicked a targeting button!");
  }
}
//-----------------------------------------------------------------------------------------------------------------------------------