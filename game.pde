
int WIN_CX = 1024;
int WIN_CY = 576;
String title = "Shoot Game";

// game object
class Game extends Object {
  private Scene m_scene;
  
  public float time;
  public float delayTime = 0.0f;

  public Game() {
    time = millis() / 1000.0f;
    setScene(new StartScene());
  }

  // scene

  public Scene scene() {
    return m_scene;
  }

  public void setScene(Scene s) {
    m_scene = null;
    m_scene = s;
  }

  // update
  public void update(float t) {
    float now = millis() / 1000.0f;
    delayTime = now - time; 
    time = now;
    
    m_scene.processKeys();
    m_scene.update(delayTime);
  }

  // draw
  public void draw() {
    m_scene.draw();
  }
}

// global vars
PFont font;
InputState input = new InputState();
PVector mouse = new PVector();
Game game;
boolean debug = false;

void settings() {
  size(1024, 576, P2D);
  smooth(4);
}

void setup() {
  surface.setTitle(title);
  surface.setSize(WIN_CX, WIN_CY);
  surface.setResizable(false);
  frameRate(60);
  textureMode(NORMAL);

  font = createFont("SourceCodePro-Regular.ttf", 24);
  textFont(font);

  game = new Game();
}

public void keyPressed() {
  //println("pressed : ", key, keyCode);

  if (key == 'w' || key == 'W') {
    input.up = true;
  } 
  if (key == 's' || key == 'S') {
    input.down = true;
  }
  if (key == 'a' || key == 'A') {
    input.left = true;
  } 
  if (key == 'd' || key == 'D') {
    input.right = true;
  }
}

public void keyReleased() {
  //println("released: ", key, keyCode);
  if (key == 'w' || key == 'W') {
    input.up = false;
  } 
  if (key == 's' || key == 'S') {
    input.down = false;
  }
  if (key == 'a' || key == 'A') {
    input.left = false;
  } 
  if (key == 'd' || key == 'D') {
    input.right = false;
  }
}

void mousePressed() {
  //mouseX, mouseY
}

void mouseReleased() {
}

void mouseClicked() {
  game.scene().mouseClicked();
}

void mouseMoved() {
  //println("mouseMoved: ", mouseX, mouseY);
  game.scene().mouseMoved();
}

void mouseDragged() {
  //println("mouseDragged: ", mouseX, mouseY);
}

void draw() {

  // update
  mouse.x = mouseX;
  mouse.y = mouseY;
  game.update(0.0f);

  // draw
  background(0);
  game.draw();

  displayInfo();
}
