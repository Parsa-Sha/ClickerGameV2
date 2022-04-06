int streak = 0;

void game() {

  theme.play();
  background(39, 108, 111);
  textSize(40);
  textAlign(LEFT);
  text("Score: " + targetsDestroyed, 10, 40);
  textAlign(RIGHT);
  text("Lives: " + playerLives, width - 10, 40);
  textAlign(CENTER);

  int i = 0;
  while (i < myTargets.size()) {
    Target myObj = myTargets.get(i);
    myObj.show();
    myObj.act();

    if (myObj.lives == 0) {
      myTargets.remove(i);
    } else {
      i++;  
    }
  }
  
  if (millis()%3020 > 3000 && millis()%3020 <= 3020) {
    myTargets.add(new Target());
    targetCount++;
  }
  
  if (mousePressed && clickCooldown == 10) { // If mouse is pressed and cooldown is over
    mousePressed = false;
    checkClick();
    clickCooldown = 0;
  }

  clickCooldown++;
  clickCooldown = min(10, clickCooldown);
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(-HALF_PI);
  arc(0, 0, 30, 30, 0, clickCooldown*TWO_PI/10);
  popMatrix();


  highscore = max(highscore, targetsDestroyed);


  if (playerLives <= 0 || targetCount >= 100) {
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

void checkClick() {
  Target clickedTarget = null;
  
  int i = 0;
  while (i < myTargets.size()) { // Check if mouse is on a target
    Target myObj = myTargets.get(i);
    if (dist(mouseX, mouseY, myObj.pos.x, myObj.pos.y) < myObj.size/2) {
      clickedTarget = myObj;
      break;
    }
    i++;
  }
  
  if (clickedTarget == null) { // If no target is under mouse, remove lives
    playerLives--;
  } else { // Else, run break method to split target
    clickedTarget.slice();
    targetsDestroyed++;
  }
}
