public class SmartEnemy extends GameObject {
  private ArrayList<PVector> history = new ArrayList<PVector>(0);
  private float alpha = 100;
  private GameObject player;
  private Database database;

  public SmartEnemy(float x, float y, ID id, Database database) {
    super(x, y, id);
    this.database = database;
    w = 30;
    h = 30;
    rgb = color(0, 255, 0);
    
    /*for(int i = 0; i < database.getSize(); i++) {
      if(database.getGameObject(i).getId() == ID.Player) player = database.getGameObject(i);
    }*/
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
    //checkEdges();
    for(int i = 0; i < database.getSize(); i++) {
      if(database.getGameObject(i).getId() == ID.Player) player = database.getGameObject(i);
    }
    
    if(gameDifficult == 2) {
      velX *= 2;
      velY *= 2;
    }
    
    if(gameDifficult == 3) {
      velX *= 4;
      velY *= 4;
    }
    
    x += velX;
    y += velY;
    
    float diffX = x - player.x - 16;
    float diffY = y - player.y - 16;
    float distance = (float) Math.sqrt((x - player.x) * (x - player.x) + (y - player.y) * (y - player.y));
    velX = ((-1 / distance) * diffX);
    velY = ((-1 / distance) * diffY);
    
    PVector v = new PVector();
    v.add(x,y);
    history.add(v);
    
    if(history.size() > 20) {
     history.remove(0);
    }
  }
}
