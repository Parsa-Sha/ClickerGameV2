int strokeWeightOptions, strokeWeightPlay;

void intro() {
  gameover.rewind();
  theme.rewind();
  gameover.pause();
  theme.pause();
  introTheme.play();
  image(bgs[selectedTheme], width/2, height/2);
  fill(255);
  strokeWeightOptions = 1;
  strokeWeightPlay = 1;
  score = 0;
  x = width/2;
  y = height/2;
  playerLives = 3;
  targetsDestroyed = 0;
  gamestart = true;

  int i = 0;
  while (i < myTargets.size()) {
    myTargets.remove(i);
    i++;
  }


  if (mouseX > 100 && mouseX < 300 && mouseY > 500 && mouseY < 600) {
    if (mousePressed) {
      mousePressed = false;
      mode = GAME;
    }
    strokeWeightPlay = 5;
  }

  if (mouseX > 500 && mouseX < 700 && mouseY > 500 && mouseY < 600) {
    if (mousePressed) {
      mousePressed = false;
      mode = OPTIONS;
    }
    strokeWeightOptions = 5;
  }

  rectMode(CORNERS);
  
  stroke(colour3[selectedTheme]);
  fill(colour2[selectedTheme]);
  
  strokeWeight(strokeWeightPlay);
  rect(100, 500, 300, 600, 20);

  strokeWeight(strokeWeightOptions);
  rect(500, 500, 700, 600, 20);

  fill(0);
  textSize(35);
  textAlign(CENTER, CENTER);
  fill(colour3[selectedTheme]);
  text("GAME START", 200, 540);
  text("OPTIONS", 600, 540);
  textSize(70);
  rectMode(CENTER);
  textLeading(80);
  text("OKAY?", width/2, 200);
}
