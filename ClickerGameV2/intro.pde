int strokeWeightOptions, strokeWeightPlay;
color strokeColourOptions, strokeColourPlay;

void intro() {
  gameover.pause();
  gameover.rewind();
  background(200);
  fill(255);
  strokeWeightOptions = 1;
  strokeColourOptions = color(0);
  strokeWeightPlay = 1;
  strokeColourPlay = color(0);
  score = 0;
  x = width/2;
  y = height/2;

  if (mouseX > 100 && mouseX < 300 && mouseY > 500 && mouseY < 600) {
    if (mousePressed) {
      mousePressed = false;
      mode = GAME;
    }
    strokeWeightPlay = 5;
    strokeColourPlay = color(0, 0, 120);
  }

  if (mouseX > 500 && mouseX < 700 && mouseY > 500 && mouseY < 600) {
    if (mousePressed) {
      mousePressed = false;
      mode = OPTIONS;
    }
    strokeWeightOptions = 5;
    strokeColourOptions = color(0, 0, 120);
  }

  rectMode(CORNERS);
  strokeWeight(strokeWeightPlay);
  stroke(strokeColourPlay);
  rect(100, 500, 300, 600, 20);

  strokeWeight(strokeWeightOptions);
  stroke(strokeColourOptions);
  rect(500, 500, 700, 600, 20);

  fill(0);
  textSize(35);
  textAlign(CENTER, CENTER);
  text("GAME START", 200, 540);
  text("OPTIONS", 600, 540);
  textSize(70);
  rectMode(CENTER);
  textLeading(80);
  text("OKAY?", width/2, 200);
}
