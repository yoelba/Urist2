class Dwarf extends Entity { //The heroic dwarves are controlled by the player. This will be abstract someday.
  private String name;

  public Dwarf(int Xpos, int Ypos, String name) {
    this.faction = 0;
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
    delay(100);
    }
    fill(255, 0, 0);
    ellipse(50*super.Xpos, 50*super.Ypos, 50, 50);
  }
}