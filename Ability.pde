//Abilities are data structures which will store that data that is passed to god for the activation of comabt abilities.
//This whole 'ability' thing is spiraling out of control pretty rapidly. Reign in complexity!


class Ability{
  public int mode; //0 = no ability, 1 = radial
  public int damage; //Damage!
  public int spec; //more = 0, spec doesnt matter, mode = 1, spec = 'radius'
  
  Ability(int mode, int spec, int damage){
    this.mode = mode;
    this.damage = damage;
    this.spec = spec;
  }
  
  
}