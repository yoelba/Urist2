//Map is a class that contains all of the game's tiles and characters.
//Think of it like the 'gameboard' on which all the 'pieces' are placed.
//When fully implemented it should contain functions to help manage the game's gameplay.

class Map {
  private int selectedEntity = 0; //Should probably not have this. DELETE L8R, REPLACE WITH BETTER STUFF XOXOXOXOX
  private int tilesX;
  private int tilesY; //Count of tiles in each direction
  private float mapWidth;
  private float mapHeight; //Pixel dimensions of map
  private float tileWidth;
  private float tileHeight; //pixel dimensions of individual tiles
  public Tile[][] tiles = new Tile[globalTileCountX][globalTileCountY];
  public ArrayList<Entity> entities = new ArrayList<Entity>();

  public int getTilesX() {
    return this.tilesX;
  }
  public int getTilesY() {
    return this.tilesY;
  }

  public Entity getSelectedEntity() {
    return entities.get(selectedEntity);
  }

  public Map(int tilesX, int tilesY, int mapWidth, int mapHeight) {
    this.tilesX = tilesX;
    this.tilesY = tilesY;
    this.mapWidth = mapWidth;
    this.mapHeight = mapHeight;
    this.tileWidth = this.mapWidth/this.tilesX;
    this.tileHeight = this.mapHeight/this.tilesY;

    //REDO THIS FOR BETTER MAP GEN
    for (int i = 0; i< tilesX; i++) {
      for (int j = 0; j< tilesY; j++) {
        this.tiles[i][j] = new Tile(i, j, false, true);
      }
    }
  }

  public void render() {
    for (int i = 0; i< tilesX; i++) { //Draw them tiles now
      for (int j = 0; j< tilesY; j++) {
        ellipseMode(CORNER);
        tiles[i][j].render((tileWidth*i), (tileWidth*j), tileWidth, tileHeight);
      }
    }
    
    entities.get(selectedEntity).update(tiles); //update current entity

    for (int i = 0; i < 16; i++) { //OPTIMISE THIS LOOP FOR GOD'S SAKE
      for (int j = 0; j < 16; j++) {
        tiles[i][j].occupied=false;
      }
    }

    for (int i = 0; i < entities.size(); i++) { //Render all entities
      tiles[entities.get(i).getXPosition()][entities.get(i).getYPosition()].occupied = true;
      entities.get(i).render();
    }
    if (gotInput == true) {
      if (selectedEntity == entities.size()-1) {
        selectedEntity = 0;
      } else {
        selectedEntity++;
      }
    }
    /*println("selected: "+selectedEntity);
     println("Length of 'entities' "+entities.size());*/
    gotInput = false;
  }
}