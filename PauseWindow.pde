class PauseWindow implements Renderizable {

  private class PlayButton {
    private float x;
    private float y; 
    private float w;
    private float h;
    private int rgbStroke = color(255);
    private int rgbFill = color(0);
    private int rgbFillOnClick = color(0, 255, 0);

    private PlayButton(float x, float y, float w, float h) {
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
    }

    private void render() {
      stroke(rgbStroke);
      fill(rgbFill, 0);
      ellipse(x, y, w, h);
      if (mouseOver()) {
        fill(rgbFillOnClick, 150);
        triangle(x - 5, y - h / 3, x - 5, y + h / 3, x - 5 + w / 3, y);
      }
    }

    private boolean mouseOver() {
      if (mouseX > this.x - w / 2 && mouseX < this.x + this.w / 2) {
        if (mouseY > this.y - h / 2 && mouseY < this.y + this.h / 2) {
          return true;
        } else return false;
      } else return false;
    }
  }

  //Pause Window
  private Database database;
  private HUD hud;
  private Spawn spawner;
  private TitleWindow title;
  private PlayButton bPlay;
  private Button bResume;
  private Button bRetry;
  private Button bExit;

  public PauseWindow(Database database, HUD hud, Spawn spawner) {
    this.database = database;
    this.hud = hud;
    this.spawner = spawner;
    this.title = new TitleWindow("PAUSE", 60, 300, 100);
    this.bPlay = new PlayButton(300, 550, 50, 50);
    this.bResume = new Button(300, 200, 210, 60, "Resume");
    this.bRetry = new Button(300, 300, 210, 60, "Retry");
    this.bExit = new Button(300, 400, 210, 60, "Exit");
  }

  public void render() {
    background(0);
    title.render();
    bResume.render();
    bRetry.render();
    bExit.render();
    bPlay.render();
  }

  public void tick() {
    if ((bPlay.mouseOver() && mousePressed) || (bResume.mouseOver() && mousePressed)) {
      if (gameMode == 1) {
        gameState = STATE.SinglePlayer;
      }
      if (gameMode == 2) {
        gameState = STATE.Multiplayer;
      }
      mousePressed = false;
    }
    if (bRetry.mouseOver() && mousePressed) {
      spawner.setLevelsOff();
      saveScore = hud.getScore();
      hud.setLevel(0);
      hud.setScore(0);
      MAXHEALTH = 100;
      HEALTH = MAXHEALTH;
      HEALTH2 = MAXHEALTH;
      database.removeAllObject();
      if (gameMode == 1) {
        gameState = STATE.SinglePlayer;
      }
      if (gameMode == 2) {
        gameState = STATE.Multiplayer;
      }
      mousePressed = false;
    }
    if (bExit.mouseOver() && mousePressed) {
      spawner.setLevelsOff();
      saveScore = hud.getScore();
      hud.setLevel(0);
      hud.setScore(0);
      MAXHEALTH = 100;
      HEALTH = MAXHEALTH;
      HEALTH2 = MAXHEALTH;
      database.removeAllObject();
      gameState = STATE.Menu;
      mousePressed = false;
    }
  }
}
