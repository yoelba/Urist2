//I'm writing in processing because it's easy and allows rapid prototypyping. It also is easy to export to android :)
//Perhaps I'll convert this to more commonly used language someday. But probqably not.


//LIBGDX

//I really hate having logic and gui design in the same file. Remedy this later!


int globalTileCountX = 12;
int globalTileCountY = 9;
int globalScreenWidth = 600;
int globalScreenHeight = 450;
boolean gotInput = false;
char dir;

Map myMap;


void setup(){
  myMap = new Map(globalTileCountX,globalTileCountY,globalScreenWidth,globalScreenHeight);
  Dwarf urist = new Dwarf(5,5, "urist");
  Dwarf urist2 = new Dwarf(7,7, "Gimli");
  myMap.entities.add(urist);
  urist.setSelected(true); //INSTANtIATION IS UGLY! FIX LATER!
  myMap.entities.add(urist2);
  size(800, 450);
}

void draw(){
  background(0);
 myMap.update(); 
}

void mouseClicked(){
  int lrDir = mouseX - myMap.getSelectedEntity().getXPosition();
  int udDir = mouseY - myMap.getSelectedEntity().getYPosition();
  //println("lrDir = "+lrDir);
  //println("udDir = "+udDir);
  if(abs(lrDir) > abs(udDir)){ //X axis priority
    if(lrDir<0){
      dir = '<';
    }else{
      dir = '>';
    }
  }else{ //Y axis priority
   if(udDir<0){
      dir = '^';
    }else{
      dir = 'v';
    }
  }
  //println(dir);
  gotInput = true;
}