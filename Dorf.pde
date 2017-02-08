//I'm writing in processing because it's easy and allows rapid prototypyping. It also is easy to export to android :)
//Perhaps I'll convert this to more commonly used language someday. But probqably not.


/*###########################################  A Stylized Map of my Program's Logical Structure: ###################################
 
 ||{-----------------GOD---------------------}|   
 ||{Entity}  {Entity}    {Entity}    {Entity}||
 ||{Tile}{Tile}{Tile}{Tile}{Tile}{Tile}{Tile}||
 |\-----------------MAP----------------------/|
 \------------------DORF----------------------/
 
 
 ###################################################################################################################################*/

//I really hate having logic and gui design in the same file. Remedy this later!


int globalTileCountX = 12;
int globalTileCountY = 9;
int globalScreenWidth = 600;
int globalScreenHeight = 450;
boolean gotInput = false;
boolean freeze = false;
char dir;

Map myMap;

void setup() {
  myMap = new Map(globalTileCountX, globalTileCountY, globalScreenWidth, globalScreenHeight);
  Dwarf urist = new Dwarf(5, 5, "urist");
  //Dwarf urist2 = new Dwarf(7,7, "Gimli");
  MadDwarf badBoy = new MadDwarf(2, 2);
  myMap.entities.add(urist);
  urist.setSelected(true); //INSTANtIATION IS UGLY! FIX LATER!
  //myMap.entities.add(urist2);
  myMap.entities.add(badBoy);
  size(800, 450);
}

void draw() {
  background(0);
  myMap.update();
}

void mouseClicked() {
  int lrDir = mouseX - myMap.getSelectedEntity().getXPosition();
  int udDir = mouseY - myMap.getSelectedEntity().getYPosition();
  boolean buttonPress = false;
  for (Entity E : myMap.entities) {
    for (Clickable C : E.clickables ) {
      if (C.mouseOver() == true) {
        C.execute();
        buttonPress = true;
      }
    }
  }
  for (Clickable C : myMap.god.clickables ) {
    if (C.mouseOver() == true) {
      C.execute();
      buttonPress = true;
    }
  }
  if (buttonPress == false) {  //------------------------------------------WRITE A FUNCTION FOR THIS. AND MAKE IT GOODER TOO!
    if (abs(lrDir) > abs(udDir)) { //X axis priority
      if (lrDir<0) {
        dir = '<';
      } else {
        dir = '>';
      }
    } else { //Y axis priority
      if (udDir<0) {
        dir = '^';
      } else {
        dir = 'v';
      }
    }
    //println(dir);
    gotInput = true;
  }
}

void setGodAttackMode(Ability ability) {
  myMap.god.setMode(ability, myMap.getSelectedEntity().getXPos(), myMap.getSelectedEntity().getYPos(), myMap.god. );
}