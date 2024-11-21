public class Button implements Renderizable {
    private float x;
    private float y; 
    private float w;
    private float h;
    private int rgbFill = color(160, 160, 160);
    private int rgbFillOnClick = color(0);
    private int rgbText = color(255);
    private String stringText;

    public Button(float x, float y, float w, float h, String stringText) {
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
      this.stringText = stringText;
    }

    public void render() {
      rectMode(CENTER);
      noStroke();
      fill(rgbFill,100);
      if (mouseOver()) {
        fill(rgbFillOnClick,150);
      }
      rect(x, y, w, h, 20);
      fill(rgbText);
      textSize(50);
      textAlign(CENTER, CENTER);
      text(stringText, x, y - 7);
    }
    
    public void tick(){}

    public boolean mouseOver() {
      if (mouseX > this.x - w / 2 && mouseX < this.x - w / 2 + this.w) {
        if (mouseY > this.y - h / 2 && mouseY < this.y - h / 2 + this.h) {
          return true;
        } else return false;
      } else return false;
    }
}
