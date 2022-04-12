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

PImage livesCounter[] = new PImage[4];

PImage characters[] = new PImage[3];
PImage bgs[] = new PImage[3];
PImage icons[] = new PImage[3];
color colour1[] = new color[3];
color colour2[] = new color[3];
color colour3[] = new color[3];
int selectedTheme = 2;

int themeSelection;

final char secretcode[] = new char[11];
char currentcode[] = new char[11];

void setup() {
  size(800, 800, P2D);
  mode = INTRO;
  
  livesCounter[0] = loadImage("bg\\noLives.png");
  livesCounter[1] = loadImage("bg\\oneLife.png");
  livesCounter[2] = loadImage("bg\\twoLives.png");
  livesCounter[3] = loadImage("bg\\threeLives.png");
  
  bgs[0] = loadImage("bg\\grassBg.png");
  bgs[1] = loadImage("bg\\lavaBg.png");
  bgs[2] = loadImage("bg\\darkBg.png");
  
  characters[0] = loadImage("characters\\grassSlime.png");
  characters[1] = loadImage("characters\\lavaSlime.png");
  characters[2] = loadImage("characters\\darkSlime.png");
  
  icons[0] = loadImage("icons\\grassIcon.png");
  icons[1] = loadImage("icons\\lavaIcon.png");
  icons[2] = loadImage("icons\\darkIcon.png");
  
  secretcode[0] = char(UP); 
  secretcode[1] = char(UP);
  secretcode[2] = char(DOWN);
  secretcode[3] = char(DOWN);
  secretcode[4] = char(LEFT);
  secretcode[5] = char(RIGHT);
  secretcode[6] = char(LEFT);
  secretcode[7] = char(RIGHT);
  secretcode[8] = 'b';
  secretcode[9] = 'a';
  secretcode[10] = char(ENTER);
  
  colour1[0] = color(14, 53, 50);
  colour2[0] = color(56, 184, 125);
  colour3[0] = color(35, 170, 155);
  
  colour1[1] = color(14, 53, 50);
  colour2[1] = color(56, 184, 125);
  colour3[1] = color(35, 170, 155);
  
  colour1[2] = color(14, 53, 50);
  colour2[2] = color(56, 184, 125);
  colour3[2] = color(35, 170, 155);
  
  
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
  theme = minim.loadFile("audioFiles\\IntroTheme.mp3");
  coin = minim.loadFile("audioFiles\\coin.wav");
  bump = minim.loadFile("audioFiles\\bump.wav");
  gameover = minim.loadFile("audioFiles\\gameover.wav");  
  introTheme = minim.loadFile("audioFiles\\gameTheme.mp3");
  
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
