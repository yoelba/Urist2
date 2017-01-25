abstract class Enemy extends Entity{ //These are the baddies! They comprise all hostile NPC entities.
  
    public boolean meleeMove(Tile[][] tiles) { //A crappy little function that moves around 'melee' enemies.
    //Time to create some REALLY awkward code
    int goalX = 100; //Initialize to impossibly big values
    int goalY = 100;
    
    for (int i = 0; i < 12; i++) {
      for (int j = 0; j < 9; j++) {
        if(tiles[i][j].occupied==true && tiles[i][j].factionControl == 0){ //Finding tiles occupied by good guys
          
        }
      }
    }
    
    return true;
  }
  
}

class MadDwarf extends Enemy{
  public MadDwarf(int Xpos, int Ypos) {
    this.portrait = loadImage("badDorf.png");
    super.Xpos = Xpos;
    super.Ypos = Ypos;
    super.turnPointsMax = 3;
    super.turnPoints = 3;
  }

  public boolean update(Tile[][] tiles){
    super.meleeMove(tiles);
    //Make an attack!
    
    return true;
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
      text("An insane and \ndangerous Dwarf", 50*globalTileCountX+20, 300);
      
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