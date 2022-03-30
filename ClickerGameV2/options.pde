int sliderHover, backHover, linkHover, marioHover, linkSelection;
int marioSelection = 255;

void options() {
  background(39, 108, 111);
  fill(156, 162, 30);
  stroke(211, 83, 12);
  sliderHover = 1;
  backHover = 1;
  linkHover = 0;
  marioHover = 0;

  if (mouseX > 200 && mouseX < 600 && mouseY > 675 && mouseY < 725) {
    if (mousePressed) {
      difficultySlider = map(mouseX, 200, 600, 1, 20);
    }
    sliderHover = 4;
  }

  if (mouseX > width - 150 && mouseX < width - 50 && mouseY > height - 150 && mouseY < height - 50) {
    if (mousePressed) {
      mode = INTRO;
    }
    backHover = 4;
  }

  if (mouseX > 100 && mouseX < 300 && mouseY > 100 && mouseY < 300) {
    if (mousePressed) {
      marioSelection = 255;
      linkSelection = 0;
      selectedImage = mario;
    }
    marioHover = 100;
  }

  if (mouseX > 500 && mouseX < 700 && mouseY > 100 && mouseY < 300) {
    if (mousePressed) {
      linkSelection = 255;
      marioSelection = 0;
      selectedImage = link;
    }
    linkHover = 100;
  }

  image(mario, width/4, height/4, 200, 200);
  image(link, width/4*3, height/4, 200, 200);

  noStroke();
  fill(120, marioHover);
  rect(width/4, height/4, 200, 200);
  fill(120, linkHover);
  rect(width/4*3, height/4, 200, 200);

  noFill();
  strokeWeight(2);
  stroke(120, marioSelection);
  rect(width/4, height/4, 200, 200);
  stroke(120, linkSelection);
  rect(width/4*3, height/4, 200, 200);

  fill(156, 162, 30);
  stroke(211, 83, 12);
  strokeWeight(6);
  line(200, 700, 600, 700);
  strokeWeight(sliderHover);
  rectMode(CENTER);
  rect(map(difficultySlider, 1, 20, 200, 600), 700, 25, 25, 5);
  textSize(40);
  text("DIFFICULTY", width/2, 650);

  strokeWeight(backHover);
  rect(width-100, height-100, 100, 100, 20);
}
