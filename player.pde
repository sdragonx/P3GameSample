
class Player extends Human {
  public Player(Scene scene) {
    super(scene);
    this.setHP(100.0f);
    this.setMaxHP(100.0f);
    this.setSpeed(100.0f);
    
    Gun g = getGun();
    g.setDamage(10.0f);
    g.setDelay(0.25f);
  }

  // update
  public void update(float t) {
    PVector v;

    // moving
    if (keyPressed) {
      //switch(key) {
      //case 'w': 
      //case 'W':
      //  break;
      //case 'a': 
      //case 'A':
      //  break;
      //case 's': 
      //case 'S':
      //  break;
      //case 'd': 
      //case 'D':
      //  break;
      //}

      v = new PVector();

      if (input.up) {
        v.y = -1;
      } else if (input.down) {
        v.y = 1;
      }

      if (input.left) {
        v.x = -1;
      } else if (input.right) {
        v.x = 1;
      }

      v = v.normalize();
      this.move(v, t);
    }

    // update direction
    float a = angleOf(this.getPosition(), mouse);
    this.setAngle(a);

    // shooting
    Gun g = getGun();
    g.update(t);
    if (mousePressed == true) {
      g.shoot(color(0, 0, 255));
    }
  }
  
  // draw
  public void draw() {
    super.draw();
  }
}
