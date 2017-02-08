abstract class Enemy extends Entity { //These are the baddies! They comprise all hostile NPC entities.

  public Enemy(int HP, int Xpos, int Ypos, int turnPointsMax) {
    super(HP, Xpos, Ypos, turnPointsMax);
  }

  public boolean meleeMove(Tile[][] tiles) { //A crappy little function that moves around 'melee' enemies.
    //Time to create some REALLY awkward code
    int goalX = 100; //Initialize to impossibly big values so we can check if theyu've not changed (IE no valid target found)
    int goalY = 100;

    for (int i = 0; i < 12; i++) { //ANOTHER PRIME CANDIDATe FOR OPTIMIZATION!
      for (int j = 0; j < 9; j++) {
        if (tiles[i][j].occupied==true && tiles[i][j].factionControl == 0) { //Finding tiles occupied by good guys
          if ( (abs(tiles[i][j].getXPos()-super.Xpos)) +  abs((tiles[i][j].getYPos()-super.Ypos)) < (goalX + goalY)) { 
            goalX = tiles[i][j].getXPos();
            goalY = tiles[i][j].getYPos();
          }
        }
      }
    } //Alright, I should have found the location of my closest enemy now!

    //Debug:
    if (goalX == 100) {
      println("No player entity found in X!");
    } else if (goalY == 100) {
      println("No player entity found in Y!");
    }
    println("GoalX: "+goalX+" GoalY: "+goalY);

    if (super.Xpos != goalX) { //This is awful simplistic. Consider rewriting later!
      if (goalX<super.Xpos && tiles[super.Xpos-1][super.Ypos].occupied() == false) {
        super.Xpos--;
      } else if (tiles[super.Xpos+1][super.Ypos].occupied() == false) {
        super.Xpos++;
      }
    } else {
      if (goalY<super.Ypos && tiles[super.Xpos][super.Ypos-1].occupied() == false) {
        super.Ypos--;
      } else if (tiles[super.Xpos][super.Ypos+1].occupied() == false) {
        super.Ypos++;
      }
    }
    return true;
  }
}

class MadDwarf extends Enemy {
  public MadDwarf(int Xpos, int Ypos) {
    super(3, Xpos, Ypos, 3);
    this.portrait = loadImage("badDorf.png");
    this.faction = 1;
  }

  public boolean update(Tile[][] tiles) {
    super.meleeMove(tiles);
    super.turnPoints--;
    //delay(1000);
    return true;
  }

  public void selectionResetSpecifics() {
    super.turnPoints = super.turnPointsMax;
  }

  public void render() {
    if (super.isSelected == true) {
      image(portrait, 50*globalTileCountX, 0, 200, 250);
      fill(232, 174, 92);
      noStroke();
      rect(50*globalTileCountX, 250, 200, 250);

      fill(0);
      textSize(22);
      text("An insane and \ndangerous Dwarf", 50*globalTileCountX+20, 300);

      for (int i = 0; i < super.turnPointsMax; i++) {
        if (i< super.turnPoints) {
          fill(255, 0, 0);
        } else {
          fill(0);
        }
        ellipse(50*globalTileCountX+20+(40*i), 350, 20, 20);
      }
      //delay(1000);
    }
    fill(0, 255, 0);
    ellipse(50*super.Xpos, 50*super.Ypos, 50, 50);
  }
}