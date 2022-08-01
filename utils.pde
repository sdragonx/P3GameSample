
// compute angle
float angleOf(PVector v1, PVector v2) {
  PVector dir = v2.sub(v1);
  return atan2(dir.y, dir.x);
}

// draw grid
void drawGrid() {
  int gridSize = 40;
  
  noStroke();
  fill(255);

  for (int x = gridSize; x <= width - gridSize; x += gridSize) {
    for (int y = gridSize; y <= height - gridSize; y += gridSize) {
      rect(x-1, y-1, 3, 3);
      //stroke(255, 100);
      //line(x, y, width/2, height/2);
    }
  }
}

// draw image tiled
void tiledImage(PImage img, float x, float y, float w, float h) {
  //textureWrap(CLAMP);
  textureWrap(REPEAT);
  tint(255);

  float u = w / img.width;
  float v = h / img.height;

  beginShape();
  texture(img);
  vertex(x, y, 0.0f, 0.0f);
  vertex(x + w, y, u, 0.0f);
  vertex(x + w, y + h, u, v);
  vertex(x, y + h, 0.0f, v);
  endShape();
}

// draw unit with shapes
void drawUnit(float x, float y, float size, float a) {
  noFill();
  strokeWeight(1.0f);

  ellipse(x, y, size, size);
  PVector v = PVector.fromAngle(a).mult(size * 0.5f);
  line(x, y, x + v.x, y + v.y);
}

// draw unit with PImage
void drawUint(PImage im, float x, float y, float w, float h, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  translate(-x, -y);
  image(im, x - w * 0.5, y - h * 0.5, w, h);
  popMatrix();
}

// display infomation
void displayInfo() {
  int x = 4;
  int y = 450;
  fill(255, 255, 255);
  textSize(20);
  text("FPS: " + int(frameRate), x, y += 20);
  text("time: " + millis() / 1000.0f, x, y += 20);
  text("delay: " + game.delayTime, x, y += 20);
  text("mouse: " + mouseX + ", " + mouseY, x, y += 20);
  
  Scene s = game.scene(); 
  text("objects: " + s.objectSize(), 4, y += 20);

}
