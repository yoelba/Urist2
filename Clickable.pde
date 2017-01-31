
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
  
  public AbilityBtn(int X, int Y, boolean A){
    super(X, Y, A);
    this.spanX = 200;
    this.spanY = 50;
    this.texture = loadImage("tileDemo.jpeg");
  }
  
  public void execute(){
    println("Hi there! You clicked A 'Ability' button!");
  }
  
}

class TargetingBtn extends Clickable{ //These buttons pop up when a player is using a damaging ability against an enemy.
  
  public TargetingBtn(int X, int Y){
    super(X, Y, true);
    this.spanX = 50; //change this if I ever want multi-tile entities
    this.spanY = 50; 
  }
  
  public void execute(){
    println("Hi there! You clicked A 'Target' button! This should make your little dude kill the selected entity denoted by the button you just pressed!");
  }
}