void gameover() {
  theme.pause();
  theme.rewind();
  gameover.play();
  background(100, 0, 0);
  if(mousePressed){
    mousePressed = false;
    mode = INTRO;
  }
  textSize(100);
  text("FAILURE", width/2, height/2);
  textSize(30);
  textLeading(30);
  text("Score: " + score + "\n" + "Highscore: " + highscore + "\nClick to play again", width/2, height/2 +100);
}
