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

  public void update() {
    for (int i = 0; i< tilesX; i++) { //Draw them tiles now
      for (int j = 0; j< tilesY; j++) {
        ellipseMode(CORNER);
        tiles[i][j].render((tileWidth*i), (tileWidth*j), tileWidth, tileHeight);
      }
    }
    
    for (int i = 0; i < 12; i++) { //OPTIMISE THIS LOOP FOR GOD'S SAKE -> Perhaps each entity, upon moving, can rectify it's occupied tile position?
      for (int j = 0; j < 9; j++) {
        tiles[i][j].occupied=false;
        tiles[i][j].factionControl = 'N';
      }
    }

    for (int i = 0; i < entities.size(); i++) { //Render all entities!
      tiles[entities.get(i).getXPos()][entities.get(i).getYPos()].occupied = true;
      tiles[entities.get(i).getXPos()][entities.get(i).getYPos()].factionControl = (char)entities.get(i).faction;
      entities.get(i).render();
    }
    
    if (entities.get(selectedEntity).update(tiles)) {
     // delay(250); //A short wait prevents accidental 'doube tapping' which may cause unwanted movement.
      if (selectedEntity == entities.size()-1 && entities.get(selectedEntity).getTurnPoints() == 0) {
        entities.get(selectedEntity).setSelected(false);
        selectedEntity = 0;
        entities.get(selectedEntity).selectionReset();
        //println("Going back to the start of entity list");
      } else if( entities.get(selectedEntity).getTurnPoints() == 0 ){
        entities.get(selectedEntity).setSelected(false);
        selectedEntity++;
        entities.get(selectedEntity).selectionReset();
        //println("Selecting next entity");
      }
    }
    
    gotInput = false;
  }
}