PImage img1, img2;
ParallaxBg bg1, bg2;

void setup() {
  size(1024, 512, P2D);
  img1 = loadImage("bg1.png");
  img1 = loadImage("bg1.png");
  bg1 = new ParallaxBg(img1, 10, new PVector(0, 0));
}

void draw() {
  background(0);
  bg1.run();
}
