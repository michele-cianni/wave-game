public class Database implements Renderizable {

  private ArrayList<GameObject> gameObject;

  public Database() {
    gameObject = new ArrayList<GameObject>(0);
  }

  public Player getPlayer() {
    GameObject tempObject = null;
    for (int i = 0; i < gameObject.size(); i++) {
      if (gameObject.get(i).getId() == ID.Player) {
        tempObject = gameObject.get(i);
      }
    }
    return (Player) tempObject;
  }

  public void removeAllObject() {
    gameObject.clear();
  }

  public void addObject(GameObject o) {
    gameObject.add(o);
  }

  public boolean removeObject(GameObject o) {
    return gameObject.remove(o);
  }

  public void render() {
    for (int i = 0; i < gameObject.size(); i++) {
      gameObject.get(i).render();
    }
  }

  public void tick() {
    for (int i = 0; i < gameObject.size(); i++) {
      gameObject.get(i).tick();
    }
  }

  public int getSize() {
    return gameObject.size();
  }

  public GameObject getGameObject(int index) {
    return gameObject.get(index);
  }

  public boolean isEmpty() {
    return gameObject.isEmpty();
  }

  public void removeAllEnemy() {
    GameObject player  = gameObject.get(indexOfPlayer());
    GameObject player2  = gameObject.get(indexOfPlayer2());
    for (int i = gameObject.size() - 1; i >= 0; i--) {
      GameObject tempObject = gameObject.get(i);
      if (tempObject.getId() != player.getId() && tempObject.getId() != player2.getId() ) {
        gameObject.remove(i);
      }
    }
  }

  private int indexOfPlayer() {
    int index = 0;
    for (int i = 0; i < gameObject.size(); i++) {
      GameObject tempObject = gameObject.get(i);
      if (tempObject.getId() == ID.Player) {
        index = gameObject.indexOf(tempObject);
      }
    }
    return index;
  }
  private int indexOfPlayer2() {
    int index = 0;
    for (int i = 0; i < gameObject.size(); i++) {
      GameObject tempObject = gameObject.get(i);
      if (tempObject.getId() == ID.Player2) {
        index = gameObject.indexOf(tempObject);
      }
    }
    return index;
  }
}
