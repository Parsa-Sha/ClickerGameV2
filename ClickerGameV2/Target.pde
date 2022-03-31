class Target {

  int size;
  PVector pos;
  PVector vel;
  int lives;

  Target() {
    size = 300;
    vel.x = random(-2, 2);
    vel.y = random(-2, 2);
  }


  void show() {
    ellipse(pos.x, pos.y, size, size);
  }

  void act() {
    if (size > 15) {
      pos.add(vel);
    }

    if (pos.x < size/2 || pos.x > width-size/2) {
      vel.x *= -1;
    }

    if (pos.y < size/2 || pos.y > height-size/2) {
      vel.y *= -1;
    }

    if (lives == 0) {
    }

    for (int i = 0; i < myTargets.size(); i++) {
      Target myObj = myTargets.get(i);
      if (dist(mouseX, mouseY, pos.x, pos.y) < size/2) {
        lives = 0;
        myObj.lives = 0;
        targetCount--;
        if (size > sizeLimit) {
          myTargets.add(new Target(size/2, pos.x, pos.y));
          myTargets.add(new Target(size/2, pos.x, pos.y));
          targetCount += 2;
        }
      }
    }
  }
}
