
//
// Map
//

class Map extends Object {
  public static final int TILE_SIZE = 32;
  public static final int CX = 32;
  public static final int CY = 18;
  
  private int[] m_data = new int[CX * CY];
  
  public Map() {
  }
  
  public int getWidth() {
    return CX;
  }
  
  public int getHeight() {
    return CY;
  }
  
  // block
  public int get(int x, int y) {
    int id = y * CX + x;
    if(id >= 0 && id < m_data.length) {
      return m_data[id];
    }
    else {
      return 0;
    }
  }
  
  public void set(int x, int y, int value) {
    int id = y * CX + x;
    if(id >= 0 && id < m_data.length) {
      m_data[id] = value;
    }
  }
  
  public int getFromPosition(PVector pos) {
    int x = (int)pos.x / TILE_SIZE;
    int y = (int)pos.y / TILE_SIZE;
    return this.get(x, y);
  }
  
  // update
  //public void update(float t) {
  //}

  // draw
  public void draw() {
    for(int y = 0; y < CY; ++y) {
      for(int x = 0; x < CX; ++x) {
        int t = this.get(x, y);
        if(t != 0) {
          stroke(0);
          fill(128, 128, 0);
          rect(x * TILE_SIZE, y * TILE_SIZE, TILE_SIZE, TILE_SIZE);
        }
      }
    }
  }
}
