
//
// Human
//

class Human extends Unit {
  private Gun m_gun = new Gun(this);
  
  private float m_HP;      // unit health
  private float m_maxHP;
  
  public Human(Scene scene) {
    super(scene);
    
    m_HP = m_maxHP = 100.0f;
  }
  
  // gun
  public Gun getGun() {
    return m_gun;
  }
  
  // health
  public float getHP() {
    return m_HP;
  }
  
  public void setHP(float value) {
    m_HP = value;
  }
  
  // max health
  public float getMaxHP() {
    return m_maxHP;
  }
  
  public void setMaxHP(float value) {
    m_maxHP = value;
    if(m_HP > m_maxHP) {
      m_HP = m_maxHP;
    }
  }
  
  // hit
  public void hit(float value) {
    m_HP -= value;
    if(m_HP < 0.0f) {
      m_HP = 0.0f;
      this.setDone(true);
    }
  }
}
