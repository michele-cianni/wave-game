public class MenuParticle extends GameObject {
  private ArrayList<PVector> history = new ArrayList<PVector>(0);
  private float alpha = 100;

  public MenuParticle(float x, float y, ID id) {
    super(x, y, id);
    w = 20;
    h = 20;
    rgb = color(random(0,255),random(0,255), random(0,255));
    velX = random(-10, 10);
    velY = random(-10, 10);
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
    checkEdges();
    x += velX;
    y += velY;
    
    PVector v = new PVector();
    v.add(x,y);
    history.add(v);
    
    if(history.size() > 20) {
     history.remove(0);
    }
  }

  private void checkEdges() {
    if (x >= width - 15 || x <= 15) {
      velX *= -1;
    }
    if (y >= height - 15 || y <= 15) {
      velY *= -1;
    }
  }
}
