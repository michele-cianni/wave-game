class LoadingWindow {

  public LoadingWindow() {
    fill(255);
    textSize(60);
    textAlign(CENTER, CENTER);
    background(0);
    text("LOADING...", 300, 300);
  }

  public void tick() {
    if (loadSound()) {
      gameState = STATE.Menu;
    }
  }
}
