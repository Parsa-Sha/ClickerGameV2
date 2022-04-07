// Clicker Game V1
// The first project I've made using modular programming and enums
// https://github.com/Parsa-Sha/ClickerGameV1


// Make cooldown more visual
// - Colour change?

// Make visual representation of lives lost
// Background with 8-bit hearts?
// Red damage pulses/flash? 

// Spawn new target when all are destroyed
// Spawn new target every 15 sec, 13 sec, 10 sec...
// False targets
// Orbiting targets

// This version looks like this:
// Every three seconds, a bubble spawns
// You must pop bubbles in time before they cover the screen
// If too many bubbles appear, or you miss the bubbles, you lose
// Goal is to pop as many bubbles as possible
// Hidden ending where if there are no bubbles, secret ending is found



import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer theme, coin, bump, gameover, introTheme;

PImage link, mario, selectedImage;

int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int GAMEWON = 4;
final int OPTIONS = 5;
final int INVADED = 6;

float x, y, d;
float vx, vy;

int score, highscore, playerLives;

float difficultySlider = 5;

float sizeLimit = 20;
float clickCooldown = 0;
int targetsDestroyed = 0;
boolean gamestart;

ArrayList<Target> myTargets;
int targetCount = 1;

PImage bgs[] = new PImage[4];
PImage characters[] = new PImage[3];

final char secretcode[] = new char[11];
char currentcode[] = new char[11];

void setup() {
  size(800, 800, P2D);
  mode = INTRO;
  
  mario = loadImage("characters\\Mario.png");
  link = loadImage("characters\\Link.png");
  bgs[0] = loadImage("bg\\noLives.png");
  bgs[1] = loadImage("bg\\oneLife.png");
  bgs[2] = loadImage("bg\\twoLives.png");
  bgs[3] = loadImage("bg\\threeLives.png");
  characters[0] = loadImage("characters\\SlimeCharacter.png");
  
  secretcode[0] = 'U'; 
  
  selectedImage = mario;
  imageMode(CENTER);
    
  x = width/2;
  y = height/2;
  d = 200;
  vx = random(-5, 5);
  vy = random(-5, 5);

  score = 0;
  playerLives = 3;

  minim = new Minim(this);
  theme = minim.loadFile("audioFiles\\gameTheme.mp3");
  coin = minim.loadFile("audioFiles\\coin.wav");
  bump = minim.loadFile("audioFiles\\bump.wav");
  gameover = minim.loadFile("audioFiles\\gameover.wav");  
  introTheme = minim.loadFile("audioFiles\\IntroTheme.mp3");
  
  myTargets = new ArrayList<Target>();
  // myTargets.add(new Target());
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
  case GAMEWON:
    gamewon();
    break;
  case OPTIONS:
    options();
    break;
  case INVADED:
    invaded();
    break;
  default:
    println("ERROR. Mode = " + mode);
  }
}
