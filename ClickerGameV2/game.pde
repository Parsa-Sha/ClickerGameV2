int streak = 0;
float newd = 0;

void game() {
  newd = d / ceil(map(difficultySlider, 1, 20, 1, 5));
  
  theme.play();
  background(39, 108, 111);
  textSize(40);
  textAlign(LEFT);
  text("Score: " + score, 10, 40);
  textAlign(RIGHT);
  text("Lives: " + lives, width - 10, 40);
  textAlign(CENTER);
  
  if(mousePressed){
    mousePressed = false;
    if(dist(mouseX, mouseY, x, y) < newd/2){
      score++;
      coin.rewind();
      coin.play();
      streak++;
    } else {
      streak = 0;
      lives--;
    }
  }
  
  if(lives == 0){
    lives = 3;
    mode = GAMEOVER;
  }
  
  if(streak >= difficultySlider * 5){
    streak = 0;
    lives++;
  }
  
  fill(255);
  stroke(0);
  strokeWeight(2);
  image(selectedImage, x, y, newd, newd);
  
  x = x + vx;
  y = y + vy;
  highscore = max(highscore, score);
  
  if(x > width -newd/2 || x < 0 + newd/2){
    vx = vx * random(-1.2, -0.8) * map(difficultySlider, 1, 20, 1, 1.2);
    vy = vy + random(-0.2, 0.2);
    bump.rewind();
    bump.play();
  }
  
  if(y > height - newd/2 || y < 0 + newd/2){
    vy = vy * random(-1.2, -0.8) * map(difficultySlider, 1, 20, 1, 1.2);
    vx = vx + random(-0.2, 0.2);
    bump.rewind();
    bump.play();
  }
  
  if(keyPressed){
    if(key=='p'||key=='P'){
      mode = PAUSE;
    }
  }
}
