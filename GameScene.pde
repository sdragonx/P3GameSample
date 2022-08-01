
//
// game scene
//

class GameScene extends Scene {
  PImage imTile;
  PImage imPlayer;
  PImage imPlant;
  
  private Map m_map;
  private Player m_player;
  
  public GameScene() {
    imTile = loadImage("dust.png");
    imPlayer = loadImage("ct1.png");
    imPlant = loadImage("plant1.png");
    
    // init map
    m_map = new Map();
    for(int i=0; i<8; ++i) {
      m_map.set(16, i, 1);
    }

    // init player
    m_player = new Player(this);
    m_player.setImage(imPlayer);
    m_player.setPosition(100, WIN_CY / 2.0f);
    m_player.setSize(40.0f);
    this.addObject(m_player);
    
    // init enemies
    for(int i=0; i<5; ++i) {
      Enemy e = new Enemy(this);
      e.setPosition(random(768, WIN_CX), random(0, WIN_CY));
      e.setDest(e.getPosition());
      e.setSize(40.0f);
      this.addObject(e);
    }
  }
  
  // return Map object
  public Map getMap() {
    return m_map;
  }
  
  // return player unit
  public Unit getPlayer() {
    return m_player;
  }

  /*
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
  */

  // update
  public void update(float t) {
    super.update(t);
    super.removeCleanable();
  }

  // draw
  public void draw() {
    tiledImage(imTile, 0, 0, WIN_CX, WIN_CY);
    drawGrid();
    
    m_map.draw();

    image(imPlant, 200, 200);
    image(imPlant, 700, 450);
    image(imPlant, 400, 300);
    image(imPlant, 750, 160);

    super.draw();
    
    // player state
    float hp = m_player.getHP();
    float maxHP = m_player.getMaxHP();
    
    stroke(0);
    noFill();
    rect(4, 4, 100, 16);
    fill(0, 255, 0);
    noStroke();
    rect(4, 4, 100 * hp / maxHP, 16);
    
    //textSize(20);
    //fill(255);
    //text("Gun ...", 4, 30 + 20);
    PImage im = m_player.getGun().getImage(); 
    image(im, 4 - 10, 20 - 5, im.width * 1.5, im.height * 1.5);
  }
}
