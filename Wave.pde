import processing.sound.*;

//Main

boolean[] keysP1 = new boolean[4];
boolean[] keysP2 = new boolean[4];
static STATE gameState = STATE.Loading;
SoundFile[] sound = new SoundFile[6]; 
int gameMode = 0;
int gameDifficult = 0;

private MenuWindow menu;
private GameWindow game;
private LoadingWindow load;

void setup() {
  size(600, 600);
  load = new LoadingWindow();
  menu = new MenuWindow();
  game = new GameWindow();
}

void draw() {
  //println(gameDificult);
 
  if (gameState == STATE.Loading) 
  {
    load.tick();
  }
  
  if (gameState == STATE.Menu || gameState == STATE.Select 
  
  || gameState == STATE.Help || gameState == STATE.Quit) 
  {
    menu.tick();
    menu.render();
  }
  
  if (gameState == STATE.SinglePlayer || gameState == STATE.Multiplayer 
  
    || gameState == STATE.Pause || gameState == STATE.Shop || gameState == STATE.End) 
  {
    game.tick();
    game.render();
  }
}

static enum STATE {
  Loading, 
    Menu, 
    Select, 
    SinglePlayer, 
    Multiplayer, 
    Shop,
    Help, 
    Quit, 
    Pause, 
    End;
};

void keyPressed() {
  if (gameState == STATE.SinglePlayer || gameState == STATE.Multiplayer) {
    
    if (key == 'p') gameState = STATE.Pause;
    
    if (key == ' ' && gameMode == 1) gameState = STATE.Shop;

    //Player 1    
    if (key == 'w' || key == 'W') keysP1[0] = true;

    if (key == 's' || key == 'S') keysP1[1] = true;

    if (key == 'd' || key == 'D') keysP1[2] = true;

    if (key == 'a' || key == 'A') keysP1[3] = true;

    //Player 2    
    if (key == CODED) {

      if (keyCode == UP) keysP2[0] = true;

      if (keyCode == DOWN) keysP2[1] = true;

      if (keyCode == RIGHT) keysP2[2] = true;

      if (keyCode == LEFT) keysP2[3] = true;
    }
  }
}


void keyReleased() {
  if (gameState == STATE.SinglePlayer || gameState == STATE.Multiplayer) {

    //Player 1
    if (key == 'w'|| key == 'W') keysP1[0] = false;

    if (key == 's'|| key == 'S') keysP1[1] = false;

    if (key == 'd'|| key == 'D') keysP1[2] = false;

    if (key == 'a'|| key == 'A') keysP1[3] = false;

    //Player 2
    if (key == CODED) {

      if (keyCode == UP) keysP2[0] = false;

      if (keyCode == DOWN) keysP2[1] = false;

      if (keyCode == RIGHT) keysP2[2] = false;

      if (keyCode == LEFT) keysP2[3] = false;
    }
  } else {

    keysP1[0] = false;

    keysP1[1] = false;

    keysP1[2] = false;

    keysP1[3] = false;


    keysP2[0] = false;

    keysP2[1] = false;

    keysP2[2] = false;

    keysP2[3] = false;
  }
}

boolean loadSound() {
  sound[0] = new SoundFile(this, "res/music-menu.mp3");
  sound[1] = new SoundFile(this, "res/hit.wav");
  sound[2] = new SoundFile(this, "res/hit2.wav");
  sound[3] = new SoundFile(this, "res/hit3.wav");
  sound[4] = new SoundFile(this, "res/bullet.wav");
  sound[5] = new SoundFile(this, "res/bouncing.wav");
  return true;
}
