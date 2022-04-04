int streak = 0;

void game() {

  theme.play();
  background(39, 108, 111);
  textSize(40);
  textAlign(LEFT);
  text("Targets Left: " + targetCount, 10, 40);
  textAlign(RIGHT);
  text("Lives: " + playerLives, width - 10, 40);
  textAlign(CENTER);




  int i = 0;
  while (i < myTargets.size()) {
    Target myObj = myTargets.get(i);
    myObj.show();
    myObj.act();
  
    if (mousePressed) {
      if (clickCooldown == 40) {
        if (dist(mouseX, mouseY, myObj.pos.x, myObj.pos.y) < myObj.size/2) {
          mousePressed = false;
          myObj.lives = 0;
          targetCount--;
          myTargets.add(new Target(myObj.size/2, myObj.pos.x, myObj.pos.y));
          myTargets.add(new Target(myObj.size/2, myObj.pos.x, myObj.pos.y));
          targetCount += 2;
        } else {
          playerLives--;
        }
        clickCooldown = 0;
      }
    }

    if (myObj.lives == 0) {
      myTargets.remove(i);
    } else {
      i++;
    }
  }


  clickCooldown++;
  clickCooldown = min(40, clickCooldown);
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(-HALF_PI);
  arc(0, 0, 30, 30, 0, clickCooldown*TWO_PI/40);
  popMatrix();


  if (playerLives <= 0) {
    mode = GAMEOVER;
  }

  if (targetCount == 0) {
    mode = GAMEWON;
  }

  if (keyPressed) {
    if (key=='p'||key=='P') {
      mode = PAUSE;
    }
  }
}
