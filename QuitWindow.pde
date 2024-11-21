class QuitWindow implements Renderizable {
  private Button bYes;
  private Button bNo;

  public QuitWindow() {
    bYes = new Button(150, 450, 180, 60, "Yes");
    bNo = new Button(450, 450, 180, 60, "No");
  }

  public void render() {
    fill(255);
    textSize(40);
    textAlign(CENTER, CENTER);
    text("Are you sure to exit game?", 300, 350);
    bYes.render();
    bNo.render();
  }

  public void tick() {
    if (bYes.mouseOver() && mousePressed) {
      System.exit(0);
    } else if (bNo.mouseOver() && mousePressed) {
      gameState = STATE.Menu;
      mousePressed = false;
    }
  }
}
