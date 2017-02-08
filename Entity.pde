/*Entities comprise player and computer controlled characters, such as Dwarfs, 
 Goblins, Skeletons, Etc. Anything mobile that can interact with others (As opposed to inanimate
 'tile' objects, will inherit from the entities class. */

abstract class Entity {
  protected int faction;
  /*
  0 = Dwarf Survivors; Player controlled entities
  1 = The Lost and the Damned; An enemy faction of madmen, mutants, and weird abberations
  */
  
  public Ability ability;
  public boolean abilityOn = false;
  public ArrayList<Clickable> clickables = new ArrayList<Clickable>();
  protected boolean isSelected = false;
  protected PImage portrait;
  protected int HP; //Hit points. When these equal zero the entity is slain!
  protected int Xpos;
  protected int Ypos;
  protected int turnPointsMax; //Each character will have a certain number of turnPoints, which can be expended on movement and activating abilities.
  protected int turnPoints;
  
  public Entity(int HP, int Xpos, int Ypos, int turnPointsMax){
    this.HP = HP; //Hit points. When these equal zero the entity is slain!
    this.Xpos = Xpos;
    this.Ypos = Ypos;
    this.turnPointsMax = turnPointsMax;
    this.turnPoints = turnPointsMax;
  }
  
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