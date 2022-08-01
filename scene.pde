
//
// basic scene
//

class Scene extends Object {
  ArrayList<Object> m_objects = new ArrayList<Object>();  

  public Scene() {
    //println("init Scene");
  }

  // add object to scene
  public void addObject(Unit u) {
    m_objects.add(u);
  }

  // clear all objects
  public void clearObjects() {
    m_objects.clear();
  }
  
  // return m_objects.size()
  public int objectSize() {
    return m_objects.size();
  }
  
  // return objects (readonly)
  ArrayList<Object> getObjects() {
    return new ArrayList<Object>(m_objects);
  }

  // process input
  public void processKeys() {
  }

  // mouse click
  public void mouseClicked() {
  }

  // mouse move
  public void mouseMoved() {
    //println("mouseMoved: ", mouseX, mouseY);
  }
  
  // remove cleanable objects
  public void removeCleanable() {
    for (int i = m_objects.size() - 1; i >= 0; i--) {
      Object obj = m_objects.get(i);
      if (obj.isDone()) {
        m_objects.remove(i);
      }
    }
  }

  // update all objects
  public void update(float t) {
    /*
    for (int i = m_objects.size() - 1; i >= 0; i--) {
      Object obj = m_objects.get(i);
      obj.update(t);
      if (obj.isDone()) {
        //println("remove: ", obj.getClass().getName());
        //if(obj instanceof Bullet) {
        //  println("remove bullet");
        //}
        m_objects.remove(i);
      }
    }*/
    //for (Object o : m_objects) {
    for (int i = 0; i < m_objects.size(); ++i) {
      Object obj = m_objects.get(i);
      obj.update(t);
    }
  }

  // draw all objects
  public void draw() {
    for (Object o : m_objects) {
      o.draw();
    }
  }
}
