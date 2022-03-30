class Target {

  int size;
  PVector pos;
  PVector vel;
  int lives;

  Target() {
    size = 300;
  }


  void show() {
    ellipse(pos.x, pos.y, size, size);
  }

  void act() {
    if (size > 15) {
      pos.add(vel);  
    }
  




  }
}
