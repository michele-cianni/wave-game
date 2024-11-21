class TitleWindow {
  
  private String text;
  private int size;
  private float x, y;

  public TitleWindow(String text, int size, float x, float y) {
    this.text = text;
    this.size = size;
    this.x = x;
    this.y = y;
    
  }
  
  public TitleWindow(String text) {
    this.text = text;
    this.size = 80;
    this.x = 300;
    this.y = 75;
  }
  
  public void render() {
    fill(255);
    textSize(size);
    textAlign(CENTER, CENTER);
    text(text, x, y);
  }
}
