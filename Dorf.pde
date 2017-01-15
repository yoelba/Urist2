//I'm writing in processing because it's easy and allows rapid prototypyping.
//Perhaps I'll convert this to more commonly used language someday.

int globalTileCountX = 16;
int globalTileCountY = 10;
int globalScreenWidth = 800;
int globalScreenHeight = 500;;

Map myMap;


void setup(){
  myMap = new Map(globalTileCountX,globalTileCountY,globalScreenWidth,globalScreenHeight);
  size(800, 500);
}

void draw(){
 myMap.render(); 
}