class MenuWindow implements Renderizable {
  private Database databaseMenu;
  private float timer = 6;
  private float timer2 = 8;
  private TitleWindow title;
  private Button bSolo;
  private Button bDuo;
  private Button bHelp;
  private Button bQuit;
  private SelectWindow select;
  private HelpWindow help;
  private QuitWindow quit;


  public MenuWindow() {
    databaseMenu = new Database();
    title = new TitleWindow("Wave", 80, 300, 75);
    bSolo = new Button(300, 200, 180, 60, "Solo"); 
    bDuo = new Button(300, 300, 180, 60, "Duo");
    bHelp = new Button(300, 400, 180, 60, "Help");
    bQuit = new Button(300, 500, 180, 60, "Quit");
    select = new SelectWindow();
    help = new HelpWindow();
    quit = new QuitWindow();
    for (int i = 0; i < 15; i ++) {
      databaseMenu.addObject(new MenuParticle(random(15, width - 15), random(15, height - 15), ID.MenuParticle));
    }
  }

  public void render() {
    if (gameState == STATE.Menu || gameState == STATE.Quit || gameState == STATE.Help || gameState == STATE.Select) {
      timer--;
      if (timer <= 0) {
        timer2--;
        if (timer2 <= 0) {
          background(random(0, 255), random(0, 255), random(0, 255));
          timer = 6;
          timer2 = 8;
        }
      }
      databaseMenu.render();
    }
    if (gameState == STATE.Menu) {
      title.render();
      bSolo.render();
      bDuo.render();
      bHelp.render();
      bQuit.render();
    }
    if (gameState == STATE.Help) {
      help.render();
    }
    if (gameState == STATE.Quit) {
      quit.render();
    }
    if (gameState == STATE.Select) {
      select.render();
    }
  }

  public void tick() {
    if (gameState == STATE.Menu || gameState == STATE.Quit || gameState == STATE.Help || gameState == STATE.Select) {
      if (!sound[0].isPlaying()) {
        sound[0].play();
      }
      databaseMenu.tick();
    }
    if (gameState == STATE.Menu) {
      if (bSolo.mouseOver() && mousePressed) {
        gameState = STATE.Select;
        mousePressed = false;
      } else if (bDuo.mouseOver() && mousePressed) {
        if (sound[0].isPlaying()) {
          sound[0].stop();
        }
        gameState = STATE.Multiplayer;
        gameDifficult = 1;
        mousePressed = false;
      } else if (bHelp.mouseOver() && mousePressed) {
        gameState = STATE.Help;
        mousePressed = false;
      } else if (bQuit.mouseOver() && mousePressed) {
        gameState = STATE.Quit;
        mousePressed = false;
      }
    }
    if (gameState == STATE.Help) {
      help.tick();
    }
    if (gameState == STATE.Quit) {
      quit.tick();
    }
    if (gameState == STATE.Select) {
      select.tick();
    }
  }
}
