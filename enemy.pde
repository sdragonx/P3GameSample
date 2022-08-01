
//
// Enemy
//

class Enemy extends Human {
  private PVector m_dest;             // Unit mobile destination
  
  public Enemy(Scene scene) {
    super(scene);
    this.setColor(color(128, 0, 0));
    this.setHP(20.0f);
    this.setMaxHP(20.0f);
    this.setSpeed(50.0f);
    
    Gun g = getGun();
    g.setDamage(5.0f);
    g.setDelay(2.0f);
    g.randomShootTime();
    
    randomNext();
  }
  
  // destination
  
  public PVector getDest() {
    return m_dest.copy();
  }
  
  public void setDest(PVector v) {
    m_dest.set(v);
  }
  
  void moving(float t) {
    float d = PVector.dist(getPosition(), getDest());
    if(getSpeed() < d) {
      PVector dir = getDest().sub(getPosition());
      dir = dir.normalize();
      dir .mult(getSpeed() * t);
      setPosition(getPosition().add(dir));
    }
    else {
      setPosition(getDest());
      // random next target
      randomNext();
    }
  }
  
  void randomNext() {
    m_dest = new PVector(random(768, WIN_CX), random(0, WIN_CY));
  }
  
  // update
  public void update(float t) {
    if(this.isDone()) {
      return;
    }
    
    // move
    moving(t);
    
    // lookat player
    GameScene gs = (GameScene) getScene();
    setAngle(angleOf(getPosition(), gs.getPlayer().getPosition()));
    
    // shooting
    Gun g = getGun();
    g.update(t);
    g.shoot(color(255, 0, 0));
  }
}
