class SelectWindow implements Renderizable {

  private TitleWindow title;
  private Button bEasy;
  private Button bNormal;
  private Button bHard;
  private Button bBack;

  public SelectWindow() {
    title = new TitleWindow("Game Mode", 60, 300, 75);
    bEasy= new Button(300, 200, 200, 60, "Easy"); 
    bNormal = new Button(300, 300, 200, 60, "Normal");
    bHard = new Button(300, 400, 200, 60, "Hard");
    bBack = new Button(300, 500, 200, 60, "Back");
  }

  public void tick() {
    if (bEasy.mouseOver() && mousePressed) {
      if (sound[0].isPlaying()) {
        sound[0].stop();
      }
      gameDifficult = 1;
      gameState = STATE.SinglePlayer;
      mousePressed = false;
    }
    if (bNormal.mouseOver() && mousePressed) {
      if (sound[0].isPlaying()) {
        sound[0].stop();
      }
      gameDifficult = 2;
      gameState = STATE.SinglePlayer;
      mousePressed = false;
    }
    if (bHard.mouseOver() && mousePressed) {
      if (sound[0].isPlaying()) {
        sound[0].stop();
      }
      gameDifficult = 3;
      gameState = STATE.SinglePlayer;
      mousePressed = false;
    }
    if (bBack.mouseOver() && mousePressed) {
      gameDifficult = 0;
      gameState = STATE.Menu;
      mousePressed = false;
    }
  }

  public void render() {
    title.render();
    bEasy.render();
    bNormal.render();
    bHard.render();
    bBack.render();
  }
} 
