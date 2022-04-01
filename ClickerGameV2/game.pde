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
  while(i < myTargets.size()) {
    Target myObj = myTargets.get(i);
    myObj.show();
    myObj.act();
    if (myObj.lives == 0) {
       myTargets.remove(i); 
    } else {
       i++;
    }
  } 
  
  if (playerLives == 0) {
    mode = GAMEOVER;
  }
  
  if(keyPressed){
    if(key=='p'||key=='P'){
      mode = PAUSE;
    }
  }
}
