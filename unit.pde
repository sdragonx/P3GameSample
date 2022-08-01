
//
// basic unit object
//

class Unit extends Object
{
  private Scene m_scene;
  
  private PImage m_image = null;           // unit image, if the image is null, draw shape mode
  private color m_color = color(0);        // unit color
  
  private PVector m_pos = new PVector();   // unit position

  private float m_size = 10.0f;            // unit size
  private float m_angle = 0.0f;            // unit directon
  private float m_speed = 1.0f;            // unit move speed

  public Unit(Scene scene) {
    m_scene = scene;
  }

  // scene
  public Scene getScene() {
    return m_scene;
  }
  
  // image
  public PImage getImage() {
    return m_image;
  }
  
  public void setImage(PImage im) {
    m_image = im;
  }
  
  // color
  
  public color getColor() {
    return m_color;
  }
  
  public void setColor(color c) {
    m_color = c;
  }

  // pos

  public PVector getPosition() {
    return m_pos.copy();
  }

  public void setPosition(PVector pos) {
    m_pos.set(pos);
  }

  public void setPosition(float x, float y) {
    m_pos.set(x, y);
  }

  // size

  public float getSize() {
    return m_size;
  }

  public void setSize(float size) {
    m_size = size;
  }

  // angle

  public float getAngle() {
    return m_angle;
  }

  public void setAngle(float a) {
    m_angle = a;
  }

  // speed

  public float getSpeed() {
    return m_speed;
  }

  public void setSpeed(float speed) {
    m_speed = speed;
  }

  // move
  public void move(float t) {
    this.move(PVector.fromAngle(m_angle), t);
  }

  public void move(PVector dir, float t) {
    PVector v = dir.mult(m_speed * t);
    m_pos = m_pos.add(v);
  }

  // Check whether the unit has left the screen
  public boolean leaveScreen() {
    if (m_pos.x < -m_size || m_pos.x > WIN_CX + m_size || m_pos.y < -m_size || m_pos.y > WIN_CY + m_size) {
      return true;
    }
    return false;
  }
  
  // Collision with other Unit
  public boolean collision(Unit u) {
    float n = (this.getSize() + u.getSize()) * 0.5f;
    float d = PVector.dist(this.getPosition(), u.getPosition());
    return d < n;
  }

  // update
  public void update(float t) {
  }

  // draw
  public void draw() {
    if (m_image != null) {
      drawUint(m_image, m_pos.x, m_pos.y, m_size, m_size, m_angle);
    } else {
      stroke(getColor());
      drawUnit(m_pos.x, m_pos.y, m_size, m_angle);
    }
  }
}
