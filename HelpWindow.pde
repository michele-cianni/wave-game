class HelpWindow implements Renderizable {
  private TitleWindow title;
  private Button bBack;
  
  public HelpWindow() {
    title = new TitleWindow("Help", 60, 300, 50);
    
    bBack = new Button(300, 500, 180, 60, "Back");
  }

  public void render() {
    title.render();
    fill(color(0, 150));
    rectMode(CENTER);
    rect(300, 275, 550, 350);
    fill(255);
    textSize(40);
    textAlign(LEFT, CENTER);
    text("- P for pause", 40, 150);
    text("- Spacebar for open shop", 40, 200);
    text("- W, A, S, D for move", 40, 250);
    text("   Player 1", 40, 300);
    text("- Up, Down, Right and Left", 40, 350);
    text("   for move Player 2", 40, 400);
    bBack.render();
  }

  public void tick() {
    if (bBack.mouseOver() && mousePressed) {
      gameState = STATE.Menu;
      mousePressed = false;
    }
  }
}
