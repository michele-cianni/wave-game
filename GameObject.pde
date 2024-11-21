static float clamp(float v, float min, float max) {
  if (v >= max)
    return v = max;
  else if (v <= min)
    return v = min;
  else
    return v;
}

public abstract class GameObject implements Renderizable {
  protected float x;
  protected float y;
  protected float w;
  protected float h;
  protected float velX;
  protected float velY;
  protected int rgb;
  private ID id;

  public GameObject(float x, float y, ID id) {
    this.x = x;
    this.y = y;
    this.id = id;
  }

  public abstract void tick();
  public abstract void render();
  
  public ID getId() {
    return id;
  }
  
  public void setVelX(float velX) {
    this.velX = velX;
  }
  
  public void setVelY(float velY) {
    this.velY = velY;
  }
  
  public float getVelX() {
   return velX; 
  }
  
  public float getVelY() {
   return velY; 
  }
}
