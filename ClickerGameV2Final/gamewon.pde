void gamewon() {
  background(0, 255, 0);
  textAlign(CENTER, CENTER);
  text("SECRET VICTORY!", width/2, height/2);
  
  if(mousePressed){
    mousePressed = false;
    mode = INTRO;
  }
}
