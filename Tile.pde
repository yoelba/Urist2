class Tile { //the 'tile' class is the basic building block of the world. Tiles will comprise walls, floors, chasms, and other inanimate environmental elements.
  PImage texture; //Image file
  boolean occupied; //an occupied tile is one where an entity is 'standing'
  boolean passable; //Can it be walked through?  
  int Xpos; 
  int Ypos; //All the world's a grid.
  char factionControl = 'N'; //N for 'no faction'.
  
  public Tile(/*PImage texture,*/ int xPos, int yPos, boolean occupied, boolean passable){
    this.Xpos = xPos;
    this.Ypos = yPos;
    this.texture = loadImage("Tile.jpeg");
    this.occupied = occupied;
    this.passable = passable;
  }
  
  //getters and setters:
  public boolean passable(){
    return this.passable;
  }
  public boolean occupied(){
    return this.occupied;
  }
  public void setOccupied(boolean bool){
    this.occupied = bool;
  }
  public void setPassable(boolean bool){
    this.passable = bool;
  }
  
  public int getXPos(){
    return this.Xpos;
  }
  
  public int getYPos(){
    return this.Ypos;
  }
  
  public void render(float drawX, float drawY, float drawW, float drawH){ //Will draw the tile in the world
    stroke(0);
    strokeWeight(1);
    fill(100,90);
    image(texture, drawX, drawY, drawW, drawH);
    ellipse(drawX, drawY, drawW, drawH);
  }
}