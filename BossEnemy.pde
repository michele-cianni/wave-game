public class BossEnemy extends GameObject {

  private class BulletBoss extends GameObject {
    private Database database;
    private ArrayList<PVector> history = new ArrayList<PVector>(0);
    private float alpha = 100;

    private BulletBoss(float x, float y, float velX, float velY, ID id, Database database) {
      super(x, y, id);
      this.database = database;
      w = 10;
      h = 10;
      rgb = color(0, 255, 200);
      this.velX = velX;
      this.velY = velY;
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
      checkEdges();
      x += velX;
      y += velY;

      PVector v = new PVector();
      v.add(x, y);
      history.add(v);

      if (history.size() > 20) {
        history.remove(0);
      }
    }

    private void checkEdges() {
      if (x >= width - 5 || x <= 5) {
        database.removeObject(this);
      }
      if (y >= height - 5 || y <= 5) {
        database.removeObject(this);
      }
    }
  }

  //Boss Enemy
  private Database bullet;
  private int alphaText = 255;
  private int timer1 = 300;
  private int timer2 = 100;
  private int timerBullet = 100;

  public BossEnemy(float x, float y, ID id, Database database) {
    super(x, y, id);
    w = 80;
    h = 80;
    rgb = color(0, 255, 200);
    velX = 0;
    velY = 2;
    bullet = database;
  }

  public void render() {
    noStroke();
    fill(rgb);
    rect(x, y, w, h);
    if (timer1 <= 300) {
      fill(255, alphaText);
      textSize(60);
      textAlign(CENTER, CENTER);
      text("BOSS LEVEL", 300, 300);
      alphaText--;
    }
    if (alphaText <= 0) {
      alphaText = 0;
    }
  }

  public void tick() {
    x += velX;
    y += velY;
    timer1--;
    if (timer1 == 0) { 
      velY = 0;
    }
    if (timer1 <= 0) {
      timer2--;
    }
    if (timer2 == 0) {
      velX = 1;
      velY = 1;
    }
    if (timer2 <= 0) {
      checkEdges();

      if (velX > 0) {
        velX += 0.002f;
      } else {
        velX -= 0.002f;
      }

      if (velY > 0) {
        velX += 0.002f;
      } else {
        velY -= 0.002f;
      }

      velX = clamp(velX, -10, 10);
      velY = clamp(velY, -10, 10);


      timerBullet--;
      if (timerBullet <= 0) {
        if (!sound[4].isPlaying()) {
          sound[4].play();
        }
        bullet.addObject(new BulletBoss(x, y, -1, 4, ID.BulletBoss, bullet));
        bullet.addObject(new BulletBoss(x, y, -2, 3, ID.BulletBoss, bullet));
        bullet.addObject(new BulletBoss(x, y, -3, 2, ID.BulletBoss, bullet));
        bullet.addObject(new BulletBoss(x, y, -4, 1, ID.BulletBoss, bullet));

        bullet.addObject(new BulletBoss(x, y, -1, -4, ID.BulletBoss, bullet));
        bullet.addObject(new BulletBoss(x, y, -2, -3, ID.BulletBoss, bullet));
        bullet.addObject(new BulletBoss(x, y, -3, -2, ID.BulletBoss, bullet));
        bullet.addObject(new BulletBoss(x, y, -4, -1, ID.BulletBoss, bullet));

        bullet.addObject(new BulletBoss(x, y, 1, 4, ID.BulletBoss, bullet));
        bullet.addObject(new BulletBoss(x, y, 2, 3, ID.BulletBoss, bullet));
        bullet.addObject(new BulletBoss(x, y, 3, 2, ID.BulletBoss, bullet));
        bullet.addObject(new BulletBoss(x, y, 4, 1, ID.BulletBoss, bullet));

        bullet.addObject(new BulletBoss(x, y, 1, -4, ID.BulletBoss, bullet));
        bullet.addObject(new BulletBoss(x, y, 2, -3, ID.BulletBoss, bullet));
        bullet.addObject(new BulletBoss(x, y, 3, -2, ID.BulletBoss, bullet));
        bullet.addObject(new BulletBoss(x, y, 4, -1, ID.BulletBoss, bullet));

        timerBullet = 100;
      }
    }
  }

  private void checkEdges() {
    if (x >= width - 40 || x <= 40) {
      velX *= -1;
    }
    if (y >= height - 40 || y <= 40) {
      velY *= -1;
    }
  }
}
