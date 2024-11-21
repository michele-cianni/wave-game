public static float HEALTH = 100;
public static float HEALTH2 = 100;
public static float MAXHEALTH = 100;

public class HUD implements Renderizable {

  private float greenValue = color(0, 255, 0);
  private float greenValue2 = color(0, 255, 0);

  private int score = 0;
  private int level = 0;


  public void tick() {
    HEALTH = clamp(HEALTH, 0, MAXHEALTH);
    greenValue = clamp(greenValue, 0, 255);
    greenValue = HEALTH * 2;
    
    if (gameState == STATE.Multiplayer) {
      HEALTH2 = clamp(HEALTH2, 0, MAXHEALTH);
      greenValue2 = clamp(greenValue, 0, 255);
      greenValue2 = HEALTH2 * 2;
    }
    
    score++;
  }

  public void render() {
    if (gameState == STATE.SinglePlayer) {
      noStroke();
      rectMode(CORNER);
      rect(200, 15, MAXHEALTH, 32);
      fill(100);
      rect(200, 15, MAXHEALTH, 32);
      fill(color(75, greenValue, 0));
      rect(200, 15, HEALTH, 32);

      fill(255);
      textSize(20);
      textAlign(LEFT, CENTER);
      text("Level: " + (level + 1), 20, 15);
      text("Score: " + score, 20, 35);
      text("FPS " + round(frameRate), 20, 55);
      
      if(gameDifficult == 1) {
        textSize(30);
        textAlign(LEFT,CENTER);
        text("EASY", 500, 28);
      }
      if(gameDifficult == 2) {
        textSize(30);
        textAlign(LEFT,CENTER);
        text("NORMAL", 450, 28);
      }
      if(gameDifficult == 3) {
        textSize(30);
        textAlign(LEFT,CENTER);
        text("HARD", 500, 28);
      }
    }
    if(gameState == STATE.Multiplayer) {
      noStroke();
      rectMode(CORNER);
      rect(15, 40, HEALTH * 2, 32);
      fill(100);
      rect(15, 40, 200, 32);
      fill(color(75, greenValue, 0));
      rect(15, 40, HEALTH * 2, 32);
      
      noStroke();
      rectMode(CORNER);
      rect(385, 40, HEALTH2 * 2, 32);
      fill(100);
      rect(385, 40, 200, 32);
      fill(color(75, greenValue2, 0));
      rect(385, 40, HEALTH2 * 2, 32);
      
      fill(255);
      textSize(20);
      textAlign(CENTER, CENTER);
      text("FPS " + round(frameRate), 300, 20);
      text("Level: " + (level + 1), 300, 45);
      text("Score: " + score, 300, 70);
      textAlign(LEFT, CENTER);
      text("Player 1", 15, 15);
      text("Player 2", 385, 15);
    }
  }

  public void setLevel(int level) {
    this.level = level;
  }

  public int getLevel() {
    return level;
  }

  public void setScore(int score) {
    this.score = score;
  }

  public int getScore() {
    return score;
  }
}
