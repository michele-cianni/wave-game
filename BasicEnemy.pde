public class BasicEnemy extends GameObject {
  private ArrayList<PVector> history = new ArrayList<PVector>(0);
  private float alpha = 100;
  private int timer = 100;

  public BasicEnemy(float x, float y, ID id) {
    super(x, y, id);
    w = 30;
    h = 30;
    rgb = color(255, 0, 0);
    if (x < 0 && y < 0) {
      velX = 3;
      velY = 2;
    }
    if (x < 0 && y > height) {
      velX = 2;
      velY = -3;
    }
    if (x > width && y > height) {
      velX = -3;
      velY = -2;
    }
    if (x > width && y < 0) {
      velX = -2;
      velY = 3;
    }
    if ((x > 0 &&  x < width) && (y > 0 && y < height)) {
      timer = 0;
      velX = 3;
      velY = random(-2, 2);
    }
  }

  public void render() {
    noStroke();
    fill(rgb);
    rect(x, y, w, h);

    fill(rgb, alpha);
    for (int i = 0; i < history.size(); i++) {
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
    if (timer <= 0) {
      checkEdges();
    }

    PVector v = new PVector();
    v.add(x, y);
    history.add(v);

    if (history.size() > 20) {
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
