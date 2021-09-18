PImage img1, img2;
ParallaxBg bg1;

void setup() {
  size(800, 600, P2D);
  img1 = loadImage("bg1.png");
  bg1 = new ParallaxBg(img1, new PVector(0, 0), false);
}

void draw() {
  bg1.run();
}
