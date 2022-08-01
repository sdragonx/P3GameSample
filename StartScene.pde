
//
// main menu
//

class StartScene extends Scene {
  private PImage m_background;

  public StartScene() {
    //println("init StartScene");
    m_background = loadImage("bgMenu.jpg");
  }

  // process input
  public void processKeys() {
    if (keyPressed) {
      game.setScene(new GameScene());
    }
  }

  public void update() {
  }

  public void draw() {
    image(m_background, 0, 0, WIN_CX, WIN_CY);

    // draw title
    textSize(64);
    float w = textWidth(title);
    fill(0);
    text(title, (WIN_CX - w) / 2.0f + 2.0f, 302.0f);
    fill(255);
    text(title, (WIN_CX - w) / 2.0f, 300.0f);

    // draw text
    String s = "press any key to start";

    textSize(20);
    w = textWidth(s);
    fill(0);
    text(s, (WIN_CX - w) / 2.0f + 1.0f, 401.0f);
    fill(255);
    text(s, (WIN_CX - w) / 2.0f, 400.0f);
  }
}
