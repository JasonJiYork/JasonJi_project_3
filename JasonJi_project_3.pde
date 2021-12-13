/* Jason Ji
 Press q to make the pixels large 
 Press w to make the pixels small
 Press e to make background blue
 Press r to redraw image and add pixels
 Press t to redraw 2nd image and add pixels
 */
PImage img, img1, background;
ArrayList<Dot> dots;
int scaler = 10; 

void setup() {
  size(100, 100, P2D);  
  img = loadImage("kotaro.PNG");
  img1 = loadImage("kotaro1.jpg");
  surface.setSize(img.width, img.height);

  background = loadImage("blue.png");
  background.resize(width, height);

  img.loadPixels();
  img1.loadPixels();
  
  dots = new ArrayList<Dot>();

  for (int x = 0; x < img.width; x += scaler) {
    for (int y = 0; y < img.height; y += scaler) {
      int location = x + y * (img.width);

      dots.add(new Dot(x, y, img.pixels[location]));
    }
  }
  
  for (int x = 0; x < img1.width; x += scaler) {
    for (int y = 0; y < img1.height; y += scaler) {
      int location = x + y * img1.width;

      if (brightness(img1.pixels[location]) > 50) {
        dots.add(new Dot(x, y, img1.pixels[location]));
      }
    }
 }
}

void draw() { 

  for (Dot dot : dots) {
    dot.run();
  }

  surface.setTitle("Framerate: " + frameRate);
}

void keyPressed() {
  if (key == 'e') {
    background(background);
  }
  if (key == 'r') {
    image(img, 0, 0);
    for (Dot dot : dots) {
      dot.run();
    }
  }
    if (key == 't') {
    image(img1, 0, 0);
    for (Dot dot : dots) {
      dot.run();
    }
  }
}
