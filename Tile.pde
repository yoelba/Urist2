class Tile { //the 'tile' class is the basic building block of the world. Tiles will comprise walls, floors, chasms, and other inanimate environmental elements.
  PImage texture; //Image file
  boolean occupied; //an occupied tile is one where an entity is 'standing'
  boolean passable; //Can it be walked through?  
  float yPos; 
  float xPos; //All the world's a grid.
  
  public Tile(/*PImage texture,*/ float xPos, float yPos, boolean occupied, boolean passable){
    this.xPos = xPos;
    this.yPos = yPos;
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
  
  public void render(float drawX, float drawY, float drawW, float drawH){ //Will draw the tile in the world
    strokeWeight(3);
    fill(100);
    image(texture, drawX, drawY, drawW, drawH);
    ellipse(drawX, drawY, drawW, drawH);
  }
}