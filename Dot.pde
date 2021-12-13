class Dot {

  PVector position, target;
  color col;
  float speed;
  float dotSize;

  Dot(float x, float y, color _col) {
    position = new PVector(x, y);
    target = new PVector(random(width), random(height));
    col = _col;

    float b = brightness(col) / 500;
    speed = b / 1500;
    dotSize = abs(10 - (b * 10)) + 2;
  }

  void update() { //<>//
    position.lerp(target, speed);
  }

  void draw() {
    stroke(col);
    strokeWeight(dotSize);
    point(position.x, position.y);
  }

  void keyPressed() {
    if (key == 'q') {
      dotSize = 30;
    }
    if (key == 'w') {
      dotSize = 5;
    }
  }

  void run() {
    update();
    draw();
    keyPressed();
  }
}
