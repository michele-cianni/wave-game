class ShopWindow implements Renderizable {
  private class ButtonBoost {
    private boolean on;
    private float x;
    private float y;
    private float w;
    private float h;
    private int cost;
    private String text;

    private ButtonBoost(float x, float y, int cost, String text) {
      this.on = true;
      this.x = x;
      this.y = y;
      this.w = 200;
      this.h = 100;
      this.cost = cost;
      this.text = text;
    }

    private void render() {
      if (on) {
        fill(color(0));
        stroke(255);
        if (mouseOver()) {
          fill(color(255, 150));
        }
        rectMode(CENTER);
        rect(x, y, w, h);
        fill(255);
        textSize(20);
        textAlign(CENTER, CENTER);
        text(text, x + 2, y - 20);
        text(cost, x, y +10);
      } else {
        fill(255, 0, 0);
        stroke(255);
      }
    }

    private boolean mouseOver() {
      if (mouseX > this.x - w / 2 && mouseX < this.x - w / 2 + this.w) {
        if (mouseY > this.y - h / 2 && mouseY < this.y - h / 2 + this.h) {
          return true;
        } else return false;
      } else return false;
    }
  }

  //Shop
  private Database database;
  private TitleWindow title;
  private ButtonBoost bUpHealth;
  private ButtonBoost bSpeed;
  private ButtonBoost bRefill; 
  private ButtonBoost bRevive;
  private Button bResume;

  public ShopWindow(Database database) {
    this.database = database;
    title = new TitleWindow("Shop", 60, 300, 50);
    bUpHealth = new ButtonBoost(175, 200, 500, "Upgrade Health: ");
    bSpeed = new ButtonBoost(425, 200, 300, "Upgrade Speed: ");
    bRefill = new ButtonBoost(175, 350, 300, "Refill Health: ");
    bRevive = new ButtonBoost(425, 350, 1500, "Respawn");
    bResume = new Button(300, 500, 200, 60, "Resume");
  }

  public void render() {
    background(0);
    title.render();
    bUpHealth.render();
    bSpeed.render();
    bRefill.render();
    bRevive.render();
    bResume.render();
  }

  public void tick() {
    
    if (MAXHEALTH >= 200) {
      bUpHealth.on = false;
    }
    if (bUpHealth.mouseOver() && mousePressed) {
      if (MAXHEALTH < 200) {
        MAXHEALTH += 10;
      }
      mousePressed = false;
    }

    if (bRefill.mouseOver() && mousePressed) {
      if (HEALTH > 0 && HEALTH <= MAXHEALTH) {
        HEALTH = MAXHEALTH;
      }
      mousePressed = false;
    }

    if (bSpeed.mouseOver() && mousePressed) {
      if (!database.getPlayer().getSpeedUp()) {
        database.getPlayer().setSpeedUp();
        bSpeed.on = false;
      } 
      mousePressed = false;
    }
    if (bRevive.mouseOver() && mousePressed) {
      if (!database.getPlayer().getRevive()) {
        database.getPlayer().setRevive(true);
        bRevive.on = false;
      } 
      mousePressed = false;
    }

    if (bResume.mouseOver() && mousePressed) {
      if (gameMode == 1) {
        gameState = STATE.SinglePlayer;
      }
      mousePressed = false;
    }
  }
}
