static int saveScore = 0;

public class Spawn {
  private Database database;
  private HUD hud; 
  private boolean levelOn[] = new boolean [10];
  private int scoreKeep = 0;

  public Spawn(Database database, HUD hud) {
    this.database = database;
    this.hud = hud;
    setLevelsOff();
  }

  public void update() {
    scoreKeep++;
    if (scoreKeep >= 1000) {
      hud.setLevel(hud.getLevel() + 1);
      scoreKeep = 0;
    }
    if (hud.getLevel() >= 10) {
      saveScore = hud.getScore();
      gameState = STATE.End;
    }
    if (hud.getLevel() == 0 && !levelOn[hud.getLevel()]) {
      
      if (gameState == STATE.SinglePlayer)
      {
        database.addObject(new Player(300, 300, ID.Player, database));
      }
      if (gameState == STATE.Multiplayer)
      {
        database.addObject(new Player(200, 300, ID.Player, database));
        database.addObject(new Player(400, 300, ID.Player2, database));
      }

      database.addObject(new BasicEnemy(-100, -100, ID.BasicEnemy));
      database.addObject(new BasicEnemy(700, 700, ID.BasicEnemy));
      database.addObject(new BasicEnemy(700, -100, ID.BasicEnemy));
      database.addObject(new BasicEnemy(-100, 700, ID.BasicEnemy));
      levelOn[hud.getLevel()] = true;
    }
    if (hud.getLevel() == 1 && !levelOn[hud.getLevel()]) {

      if (gameState == STATE.SinglePlayer) 
      {
        database.addObject(new SmartEnemy(-100, 700, ID.SmartEnemy, database));
      }
      database.addObject(new BasicEnemy(-100, -100, ID.BasicEnemy));
      database.addObject(new BasicEnemy(700, 700, ID.BasicEnemy));
      database.addObject(new BasicEnemy(700, -100, ID.BasicEnemy));
      database.addObject(new BasicEnemy(-100, 700, ID.BasicEnemy));
      levelOn[hud.getLevel()] = true;
    }
    if (hud.getLevel() == 2 && !levelOn[hud.getLevel()]) {
      database.addObject(new FastEnemy(-100, -100, ID.FastEnemy));
      database.addObject(new FastEnemy(700, 700, ID.FastEnemy));
      database.addObject(new FastEnemy(-100, 700, ID.FastEnemy));
      database.addObject(new FastEnemy(700, -100, ID.FastEnemy));
      levelOn[hud.getLevel()] = true;
    }
    if (hud.getLevel() == 3 && !levelOn[hud.getLevel()]) {
      levelOn[hud.getLevel()] = true;
    }
    if (hud.getLevel() == 4 && !levelOn[hud.getLevel()]) {
      levelOn[hud.getLevel()] = true;
    }
    if (hud.getLevel() == 5 && !levelOn[hud.getLevel()]) {
      levelOn[hud.getLevel()] = true;
    }
    if (hud.getLevel() == 6 && !levelOn[hud.getLevel()]) {
      levelOn[hud.getLevel()] = true;
    }
    if (hud.getLevel() == 7 && !levelOn[hud.getLevel()]) {
      levelOn[hud.getLevel()] = true;
    }
    if (hud.getLevel() == 8 && !levelOn[hud.getLevel()]) {
      levelOn[hud.getLevel()] = true;
    }
    if (hud.getLevel() == 9 && !levelOn[hud.getLevel()]) {
      database.removeAllEnemy();
      database.addObject(new BossEnemy(300, -300, ID.BossEnemy, database));
      levelOn[hud.getLevel()] = true;
    }
  }

  public void setLevelsOff() {
    for (int i = 0; i < levelOn.length; i++) {
      levelOn[i] = false;
    }
  }
}
