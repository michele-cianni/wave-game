class EndWindow implements Renderizable {

  private Database databaseEnd;
  private Database databaseGame;
  private HUD hud;
  private Spawn spawner;
  private TitleWindow title;
  private Button bAgain;
  private Button bMenu;
  private float timer = 6;
  private float timer2 = 3;

  public EndWindow(Database databaseGame, HUD hud, Spawn spawner) {
    databaseEnd = new Database();
    this.databaseGame = databaseGame;
    this.hud = hud;
    this.spawner = spawner;
    title = new TitleWindow("Game Over", 60, 300, 100);
    bAgain = new Button(150, 450, 200, 80, "Again");
    bMenu = new Button(450, 450, 200, 80, "Menu");
    for (int i = 0; i < 15; i++) {
      databaseEnd.addObject(new MenuParticle(random(10, width - 10), random(10, height - 10), ID.MenuParticle));
    }
  }

  public void render() {
    timer--;
    if (timer <= 0) {
      background(random(0, 255), random(0, 255), random(0, 255));
      timer2--;
      if (timer2 <= 0) {
        timer = 6;
        timer2 = 3;
      }
    }
    databaseEnd.render();
    title.render();
    textSize(40);
    textAlign(CENTER, CENTER);
    text("Your score: " + saveScore, 300, 350);
    bAgain.render();
    bMenu.render();
  }

  public void tick() {
    databaseEnd.tick();
    if (bAgain.mouseOver() && mousePressed) {
      spawner.setLevelsOff();
      hud.setLevel(0);
      hud.setScore(0);
      HEALTH = 100;
      HEALTH2 = 100;
      databaseGame.removeAllObject();
      if (gameMode == 1) {
        gameState = STATE.SinglePlayer;
      }
      if (gameMode == 2) {
        gameState = STATE.Multiplayer;
      }
      mousePressed = false;
    } 
    if (bMenu.mouseOver() && mousePressed) {
      spawner.setLevelsOff();
      hud.setLevel(0);
      hud.setScore(0);
      HEALTH = 100;
      HEALTH2 = 100;
      databaseGame.removeAllObject();
      gameState = STATE.Menu;
      mousePressed = false;
    }
  }
}
