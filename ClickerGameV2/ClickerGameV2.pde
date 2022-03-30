// Clicker Game V1
// The first project I've made using modular programming and enums
// https://github.com/Parsa-Sha/ClickerGameV1

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer theme, coin, bump, gameover;

PImage link, mario, selectedImage;

int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int OPTIONS = 4;

float x, y, d;
float vx, vy;

int score, highscore, lives;

float difficultySlider = 5;

void setup() {
  size(800, 800);
  mode = INTRO;
  
  mario = loadImage("characters\\Mario.png");
  link = loadImage("characters\\Link.png");
  selectedImage = mario;
  imageMode(CENTER);
    
  x = width/2;
  y = height/2;
  d = 200;
  vx = random(-5, 5);
  vy = random(-5, 5);

  score = 0;
  lives = 3;

  minim = new Minim(this);
  theme = minim.loadFile("audioFiles\\mario bros theme.mp3");
  coin = minim.loadFile("audioFiles\\coin.wav");
  bump = minim.loadFile("audioFiles\\bump.wav");
  gameover = minim.loadFile("audioFiles\\gameover.wav");  
}

void draw() {
  switch(mode) {
  case INTRO:
    intro();
    break;
  case GAME:
    game();
    break;
  case PAUSE:
    pause();
    break;
  case GAMEOVER:
    gameover();
    break;
  case OPTIONS:
    options();
    break;
  default:
    println("ERROR. Mode = " + mode);
  }
}
