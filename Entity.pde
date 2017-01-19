/*Entities comprise player and computer controlled characters, such as Dwarfs, 
Goblins, Skeletons, Etc. Anything mobile that can interact with others (As opposed to inanimate
'tile' objects, will inherit from the entities class. */

abstract class Entity{
  private int HP; //Hit points. When these equal zero the entity is slain!
  private int Xpos;
  private int Ypos;
  
  public int getXPosition(){ //FIX-------------------------------------------------------------------------------------------------------------------------------------------
    return this.Xpos*50;
  }
  
  public int getYPosition(){
    return this.Ypos*50;
  }
  
  public int getHP(){
    return this.HP;
  }
  public void setHP(int newHP){
    this.HP = newHP;
  }
  abstract void update(Tile[][] tiles); //All entities must update each round by doing whatever it is they do.
  abstract void render();
  public void damage(Entity otherEnt, int damageAmt){
    otherEnt.setHP(otherEnt.getHP() - damageAmt);
  }
}

class Dwarf extends Entity{ //The heroic dwarves are controlled by the player.
  private String name;

  public Dwarf(int Xpos, int Ypos, String name){
    super.Xpos = Xpos;
    super.Ypos = Ypos;
    this.name = name;
  }
  
  public void update(Tile[][] tiles){
    //update
    if(gotInput == true){
      if(dir=='^' && super.Ypos > 0 && tiles[super.Xpos][super.Ypos-1].occupied == false){
        super.Ypos--;
      }else if(dir == 'v' && super.Ypos < 8 && tiles[super.Xpos][super.Ypos+1].occupied == false){
        super.Ypos++;
      }else if(dir == '<' && super.Xpos > 0 && tiles[super.Xpos-1][super.Ypos].occupied == false){
        super.Xpos--;
      }else if(dir == '>' && super.Xpos < 11 && tiles[super.Xpos+1][super.Ypos].occupied == false){
        println(super.Xpos);
        super.Xpos++;
      }
    }
  }
  
  public void render(){
    fill(255,0,0);
    ellipse(50*super.Xpos, 50*super.Ypos, 50, 50);
  }
  
}