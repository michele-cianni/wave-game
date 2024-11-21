class GameWindow implements Renderizable {
  private class PauseButton {
    private float x;
    private float y; 
    private float w;
    private float h;
    private int rgbStroke = color(255);
    private int rgbFill = color(0);
    private int rgbFillOnClick = color(255, 0, 0);

    private PauseButton(float x, float y, float w, float h) {
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
        rectMode(CENTER);
        rect(x - w / 5, y, 10, 30);
        rect(x + w / 5, y, 10, 30);
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
  //Game Window
  private Database database;
  private HUD hud;
  private Spawn spawner;
  private PauseWindow pause;
  private ShopWindow shop;
  private EndWindow end;
  private PauseButton bPause;

  public GameWindow() {
    database = new Database();
    hud = new HUD();
    spawner = new Spawn(database, hud);
    pause = new PauseWindow(database, hud, spawner); 
    shop = new ShopWindow(database);
    end = new EndWindow(database, hud, spawner);
    bPause = new PauseButton(300, 550, 50, 50);
  }

  public void tick() {
    if (gameState == STATE.SinglePlayer || gameState == STATE.Multiplayer) {
      if (gameState == STATE.SinglePlayer) {
        gameMode = 1;
      }
      if (gameState == STATE.Multiplayer) {
        gameMode = 2;
      }
      database.tick();
      hud.tick();
      spawner.update();
      if (HEALTH <= 0) {
        if (database.getPlayer().getRevive()) {
          HEALTH = MAXHEALTH;
          database.getPlayer().setRevive(false);
        } else {
          saveScore = hud.getScore();
          MAXHEALTH = 100;
          HEALTH = MAXHEALTH;
          HEALTH2 = MAXHEALTH;
          hud.setLevel(0);
          hud.setScore(0);
          database.removeAllObject();
          spawner.setLevelsOff();
          gameState = STATE.End;
        }
      }
      if (HEALTH2 <= 0) {
        saveScore = hud.getScore();
        HEALTH = 100;
        HEALTH2 = 100;
        hud.setLevel(0);
        hud.setScore(0);
        database.removeAllObject();
        spawner.setLevelsOff();
        gameState = STATE.End;
      }
      if (bPause.mouseOver() && mousePressed) {
        gameState = STATE.Pause;
        mousePressed = false;
      }
    }
    if (gameState == STATE.Shop) {
      shop.tick();
    }
    if (gameState == STATE.Pause) {
      pause.tick();
    }
    if (gameState == STATE.End) {
      end.tick();
    }
  }

  public void render() {
    if (gameState == STATE.SinglePlayer || gameState == STATE.Multiplayer) {
      background(0);
      database.render();
      hud.render();
      bPause.render();
    }
    if (gameState == STATE.Shop) {
      shop.render();
    }

    if (gameState == STATE.Pause) {
      pause.render();
    }

    if (gameState == STATE.End) {
      end.render();
    }
  }
}
