/*Entities comprise player and computer controlled characters, such as Dwarfs, 
 Goblins, Skeletons, Etc. Anything mobile that can interact with others (As opposed to inanimate
 'tile' objects, will inherit from the entities class. */

abstract class Entity {
  protected int faction;
  /*
  0 = Dwarf Survivors; Player controlled entities
  1 = The Lost and the Damned; An enemy faction
  */
  protected boolean isSelected = false;
  protected PImage portrait;
  protected int HP; //Hit points. When these equal zero the entity is slain!
  protected int Xpos;
  protected int Ypos;
  protected int turnPointsMax; //Each character will have a certain number of turnPoints, which can be expended on movement and activating abilities.
  protected int turnPoints;
  
  public void setSelected(boolean bool){
    this.isSelected = bool;
  }

  public int getTurnPoints(){
    return this.turnPoints;
  }
  
  public void setTurnPoints(int pts){
    this.turnPoints = pts;
  }

  public int getXPos() { //What the heck is wrong with these names. I'm ashamed :(:(:(:(:(:(:(:(:(:(:(:(
    return this.Xpos;
  } //RENAME FOR CLARITY
  public int getYPos() { 
    return this.Ypos;
  } //RENAME FOR CLARITY

  public int getXPosition() { //FIX-------------------------------------------------------------------------------------------------------------------------------------------
    return this.Xpos*50;
  }

  public int getYPosition() {
    return this.Ypos*50;
  }

  public int getHP() {
    return this.HP;
  }
  public void setHP(int newHP) {
    this.HP = newHP;
  }
  
  
  public void selectionReset(){
    this.selectionResetSpecifics();
    this.isSelected = true;
  }
  
  abstract void selectionResetSpecifics(); //Call this to reset movement points, abilities, and other fields that must be reset each turn.
  
  abstract boolean update(Tile[][] tiles); //All entities must update each round by doing whatever it is they do.
  abstract void render();
  public void damage(Entity otherEnt, int damageAmt) {
    otherEnt.setHP(otherEnt.getHP() - damageAmt);
  }
}
/*
class Dwarf extends Entity { //The heroic dwarves are controlled by the player.
  private String name;

  public Dwarf(int Xpos, int Ypos, String name) {
    this.portrait = loadImage("dorfMugshot.png");
    super.Xpos = Xpos;
    super.Ypos = Ypos;
    super.turnPointsMax = 3;
    super.turnPoints = 3;
    this.name = name;
  }

  public boolean update(Tile[][] tiles) { //This retuns true if the entity did move.
    if (gotInput == true) {
      if (dir=='^' && super.Ypos > 0 && tiles[super.Xpos][super.Ypos-1].occupied == false) {
        super.Ypos--;
        super.turnPoints--;
        return true;
      } else if (dir == 'v' && super.Ypos < 8 && tiles[super.Xpos][super.Ypos+1].occupied == false) {
        super.Ypos++;
        super.turnPoints--;
        return true;
      } else if (dir == '<' && super.Xpos > 0 && tiles[super.Xpos-1][super.Ypos].occupied == false) {
        super.Xpos--;
        super.turnPoints--;
        return true;
      } else if (dir == '>' && super.Xpos < 11 && tiles[super.Xpos+1][super.Ypos].occupied == false) {
        super.Xpos++;
        super.turnPoints--;
        return true;
      }
    }
    return false;
  }

  public void selectionResetSpecifics(){
    super.turnPoints = super.turnPointsMax;
  }
  
  public void render() {
    if(super.isSelected == true){
      image(portrait, 50*globalTileCountX, 0, 200, 250);
      fill(232,174,92);
      noStroke();
      rect(50*globalTileCountX, 250, 200,250);
      
      fill(0);
      textSize(22);
      text(this.name+", \n"+"A Dwarf", 50*globalTileCountX+20, 300);
      
      for(int i = 0; i < super.turnPointsMax; i++){
        if(i< super.turnPoints){
          fill(255,0,0);
        }else{
          fill(0);
        }
        ellipse(50*globalTileCountX+20+(40*i), 350, 20, 20);
      }

    }
    fill(255, 0, 0);
    ellipse(50*super.Xpos, 50*super.Ypos, 50, 50);
  }
}
*/