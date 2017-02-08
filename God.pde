//This is god, whom handles things like 'targeting buttons', perhaps 'pause' someday, etc. things like that.

class God {
  Ability ability;
  public ArrayList<Clickable> clickables;

  public God() {
    clickables = new ArrayList<Clickable>();
  }

  public void setMode(Ability ability, int originX, int originY) {
    this.ability = ability;
    if (this.ability.mode == 0) { //If there is NO ATTACK, we'll clear the clickables list
      this.clickables.clear();
    }
    if (this.ability.mode == 1) { //Our radial attack must be initialized! Create the appropriate buttons.
      for (int i = originX-this.ability.spec; i < originX+this.ability.spec; i++) {
        for (int j = originY-this.ability.spec; j < originY+this.ability.spec; j++) {
          if(i >= 0 && i <= globalTileCountX && j >= 0 && j <= globalTileCountY){ //Let's not get any ArrayOutofBoundsExceptions please
            
          }
        }
      }
    }
  }



  public void render() { //Unlike other entities, God is omnipresent, so we won't draw him. We will, however, draw all of his buttons.
    for (Clickable C : this.clickables) {
      C.render();
    }
  }
}

class TargetGuide { //Just a small class, this object will graphically denote squares that COULD be hit (ie in range) but not occupied by an enemy.
  int X;
  int Y;
  TargetGuide(int X, int Y) {
    this.X = X; 
    this.Y = Y;
  }
  public void render() {
    fill(255, 100, 0, 50);
    rect(50*X, 50*Y, 50,50);
  }
}

/*A note on attack modes:
 >Radial attacks have the active entity as the center point, and a 'Radius'. They can attack an enemy anywhere within 'Radius' squares of themselves.
 A radius of 1 represents melee attacks, while greater values denote ranged attacks, creatures with long reach, and so forth. Most attacks will likely be radial.min
 
 Future attacks may  take the form of beams, (Straight line only), might have minimum attack distances (such as the attack of an artillery piece) and so on, 
 making it important for me to be able to implemnent new attackmodes easily.
 */