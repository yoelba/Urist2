//Map is a class that contains all of the game's tiles and characters.
//Think of it like the 'gameboard' on which all the 'pieces' are placed.
//When fully implemented it should contain functions to help manage the game's gameplay.

class Map {
  private int tilesX;
  private int tilesY; //Count of tiles in each direction
  private float mapWidth;
  private float mapHeight; //Pixel dimensions of map
  private float tileWidth;
  private float tileHeight; //pixel dimensions of individual tiles
  Tile[][] tiles = new Tile[globalTileCountX][globalTileCountY];
  
  public Map(int tilesX, int tilesY, int mapWidth, int mapHeight){
    this.tilesX = tilesX;
    this.tilesY = tilesY;
    this.mapWidth = mapWidth;
    this.mapHeight = mapHeight;
    this.tileWidth = this.mapWidth/this.tilesX;
    this.tileHeight = this.mapHeight/this.tilesY;
    
    //REDO THIS FOR BETTER MAP GEN
    for(int i = 0; i< tilesX; i++){
      for(int j = 0; j< tilesY; j++){
        this.tiles[i][j] = new Tile(i, j, false, true);
      }
    }
  }
  
  public void render(){
    for(int i = 0; i< tilesX; i++){
      for(int j = 0; j< tilesY; j++){
        ellipseMode(CORNER);
        tiles[i][j].render((tileWidth*i), (tileWidth*j), tileWidth, tileHeight);
      }
    }
  }
  
  
}