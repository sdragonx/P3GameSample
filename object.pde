
// game state
enum GameState {
  Menu,
  Play,
  End,
  Lost,
  Win,
}

// input state
class InputState {
  public boolean left = false;
  public boolean right = false;
  public boolean up = false;
  public boolean down = false;
}



//
// basic object
//

class Object {
  private boolean m_done = false;    // if object is cleanable, set true
  
  public Object() {
    //println("init Object");
  }
  
  // done
  public boolean isDone() {
    return m_done;
  }
  
  public void setDone(boolean value) {
    m_done = value;
  }
  
  public void update(float t) {
  }
  
  public void draw() {
  }
}
