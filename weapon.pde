
//
// Gun
//

class Gun extends Object {
  private Unit m_unit;            // shooter
  private PImage m_image;
  private float m_damage = 1.0f;  // damage
  private float m_delay = 1.0f;
  private float m_time = 0.0f;

  public Gun(Unit u) {
    m_unit = u;
    m_image = loadImage("ak47_d.png");
  }

  // return shooter
  public Unit getShooter() {
    return m_unit;
  }
  
  // image
  public PImage getImage() {
    return m_image;
  }
  
  // damage
  public float getDamage() {
    return m_damage;
  }
  
  public void setDamage(float value) {
    m_damage = value;
  }

  // shoot delay
  public float getDelay() {
    return m_delay;
  }

  public void setDelay(float t) {
    m_delay = t;
  }

  // shoot time
  public void randomShootTime() {
    m_time = random(0.0f, m_delay);
  }

  // check can be fire
  public boolean shoot(color c) {
    if (m_time > m_delay) {
      m_time = 0.0f;

      // shoot
      PVector v = PVector.fromAngle(m_unit.getAngle()).mult(m_unit.getSize() * 0.75f);
      v.add(m_unit.getPosition());

      Bullet b = new Bullet(this);
      b.setPosition(v);
      b.setAngle(m_unit.getAngle());
      b.setSpeed(200.0f);
      b.setColor(c);
      //println("add bullet");
      m_unit.getScene().addObject(b);      

      return true;
    }
    return false;
  }

  // update
  public void update(float t) {
    m_time += t;
  }
}

//
// Bullet
//

class Bullet extends Unit {
  private Gun m_gun;            // gun
  
  public Bullet(Gun g) {
    super(g.getShooter().getScene());
    m_gun = g;
  }
  
  // return shooter
  public Gun getGun() {
    return m_gun;
  }

  // update
  public void update(float t) {
    // moving
    this.move(t);
    
    // check leave screen
    if (leaveScreen()) {
      this.setDone(true);
      return;
    }
    
    // check collision with wall
    GameScene gs = (GameScene) m_gun.getShooter().getScene(); 
    int tile = gs.getMap().getFromPosition(this.getPosition());
    if(tile != 0) {
      this.setDone(true);
      return;
    }

    // collision
    ArrayList<Object> objs = getScene().getObjects();
    for (Object o : objs) {
      if (o instanceof Bullet) {// is Bullet
      }
      else if(o instanceof Human) {// is human
        //println("hit human");
        Human h = (Human) o;
        boolean isPlayer = m_gun.getShooter() instanceof Player;
        if (isPlayer) {
          if (h instanceof Enemy) {
            Enemy e = (Enemy) h;
            if(this.collision(e)) {// There was a collision
              println("hit enemy");
              e.hit(m_gun.getDamage());
              this.setDone(true);
              return;
            }
          }
        }
        else {
          if (h instanceof Player) {
            Player p = (Player) h;
            if(this.collision(p)) {// There was a collision
              println("hit enemy");
              p.hit(m_gun.getDamage());
              this.setDone(true);
              break;
            }
          }
        }
      }
      else {
        println("unknown object");
      }
    }
  }

  // draw
  public void draw() {
    super.draw();
  }
}
