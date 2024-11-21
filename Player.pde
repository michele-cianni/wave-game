public class Player extends GameObject {

  private ArrayList<PVector> history = new ArrayList<PVector>(0);
  private float alpha = 100;
  private Database database;
  private boolean speedUp = false;
  private boolean revive = false;

  Player(float x, float y, ID id, Database database) {
    super(x, y, id);
    this.database = database; 
    w = 40;
    h = 40;
    if (id == ID.Player) {
      rgb = color(255, 255, 255);
    }
    if (id == ID.Player2) {
      rgb = color(255, 255, 0);
    }
  }

  void render() {
    noStroke();
    fill(rgb);
    rectMode(CENTER);
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

  void tick() {
    move();

    if (speedUp) {
      velX *= 2;
      velY *= 2 ;
    }

    x += velX;
    y += velY;

    x = clamp(x, 20, width - 20);
    y = clamp(y, 20, height - 20);

    /*if((x - 20 <= 0 || x >= width - 20) || (y - 20 <= 0 || y >= height - 20)) {
     if(!sound[5].isPlaying()) {
     sound[5].play();
     }
     }*/

    PVector v = new PVector();
    v.add(x, y);
    history.add(v);

    if (history.size() > 20) {
      history.remove(0); 

      collision();
    }
  }


  private void move() {
    if (getId() == ID.Player) {
      if (keysP1[0]) velY = -5;

      if (keysP1[1]) velY = 5;

      if (keysP1[2]) velX = 5;

      if (keysP1[3]) velX = -5;

      if (!keysP1[2] && !keysP1[3]) velX = 0;
      if (!keysP1[0] && !keysP1[1]) velY = 0;
    }

    if (getId() == ID.Player2) {
      if (keysP2[0]) velY = -5;

      if (keysP2[1]) velY = 5;

      if (keysP2[2]) velX = 5;

      if (keysP2[3]) velX = -5;

      if (!keysP2[2] && !keysP2[3]) velX = 0;
      if (!keysP2[0] && !keysP2[1]) velY = 0;
    }
  }

  private void collision() {
    for (int i = 0; i < database.getSize(); i++) {

      GameObject tempObject = database.getGameObject(i);
      float d = dist(this.x, this.y, tempObject.x, tempObject.y);

      if (tempObject.getId() == ID.BasicEnemy && d < (w / 2 + tempObject.w / 2)) {
        if (!sound[1].isPlaying()) {
          sound[1].play();
        }
        if (getId() == ID.Player) {
          if(gameDifficult == 1) {
            HEALTH -= 10;
          }
          if(gameDifficult == 2) {
            HEALTH -= 15;
          }
          if(gameDifficult == 3) {
            HEALTH -= 20;
          }
          database.removeObject(tempObject);
        }
        if (getId() == ID.Player2) {
          HEALTH2 -= 10;
          database.removeObject(tempObject);
        }
      }
      if (tempObject.getId() == ID.FastEnemy && d < (w / 2 + tempObject.w / 2)) {
        if (!sound[2].isPlaying()) {
          sound[2].play();
        } 
        if (getId() == ID.Player) {
          if(gameDifficult == 1) {
            HEALTH -= 5;
          }
          if(gameDifficult == 2) {
            HEALTH -= 10;
          }
          if(gameDifficult == 3) {
            HEALTH -= 15;
          }
          database.removeObject(tempObject);
        }
        if (getId() == ID.Player2) {
          HEALTH2 -= 5;
          database.removeObject(tempObject);
        }
      }
      if (tempObject.getId() == ID.SmartEnemy && d < (w / 2 + tempObject.w / 2)) {
        if (!sound[3].isPlaying()) {
          sound[3].play();
        }
        if (getId() == ID.Player) {
          if(gameDifficult == 1) {
            HEALTH -= 15;
          }
          if(gameDifficult == 2) {
            HEALTH -= 20;
          }
          if(gameDifficult == 3) {
            HEALTH -= 25;
          }
          database.removeObject(tempObject);
        }
        if (getId() == ID.Player2) {
          HEALTH2 -= 15;
          database.removeObject(tempObject);
        }
      }

      if (tempObject.getId() == ID.BossEnemy && d < (w / 2 + tempObject.w / 2)) {

        if (getId() == ID.Player) {
          if(gameDifficult == 1) {
            HEALTH -= 1;
          }
          if(gameDifficult == 2) {
            HEALTH -= 2;
          }
          if(gameDifficult == 3) {
            HEALTH -= 3;
          }
        } 
        if (getId() == ID.Player2) {
          HEALTH2 -= 1;
        }
      }
      if (tempObject.getId() == ID.BulletBoss && d < (w / 2 + tempObject.w / 2)) {
        if (getId() == ID.Player) {
          if(gameDifficult == 1) {
            HEALTH -= 5;
          }
          if(gameDifficult == 2) {
            HEALTH -= 10;
          }
          if(gameDifficult == 3) {
            HEALTH -= 15;
          }
          database.removeObject(tempObject);
        }
        if (getId() == ID.Player2) {
          HEALTH2 -= 5;
          database.removeObject(tempObject);
        }
      }
    }
  }

  public boolean getSpeedUp() {
    return speedUp;
  }

  public void setSpeedUp() {
    speedUp = true;
  }
  
  public boolean getRevive() {
   return revive;
  }
  
  public void setRevive(boolean revive) {
    this.revive = revive;
  }
}
