public class FastEnemy extends GameObject {
  private ArrayList<PVector> history = new ArrayList<PVector>(0);
  private float alpha = 100;
  private int timer = 50;

  public FastEnemy(float x, float y, ID id) {
    super(x, y, id);
    w = 20;
    h = 20;
    rgb = color(0, 0, 255);
    if(x < 0 && y < 0) {
      velX = 7;
      velY = 4;
    }
    if(x < 0 && y > 600) {
      velX = 4;
      velY = -7;
    }
    if(x > 600 && y > 600) {
      velX = -7;
      velY = -4;
    }
    if(x > 600 && y < 0) {
      velX = -4;
      velY = 7;
    }
  }

  public void render() {
    noStroke();
    fill(rgb);
    rect(x, y, w, h);
    
    fill(rgb, alpha);
    for(int i = 0; i < history.size(); i++) {
      PVector tempV = history.get(i);
      rect(tempV.x, tempV.y, w, h);
      alpha--;
    }
    
    if (alpha <= 0) {
       alpha = 100; 
    }
  }

  public void tick() {
    
    x += velX;
    y += velY;
    
    timer--;
    if(timer <= 0) {
      checkEdges();
    }
    
    PVector v = new PVector();
    v.add(x,y);
    history.add(v);
    
    if(history.size() > 20) {
     history.remove(0);
    }
  }

  private void checkEdges() {
    if (x >= width - 10 || x <= 10) {
      velX *= -1;
    }
    if (y >= height - 10 || y <= 10) {
      velY *= -1;
    }
  }
}
