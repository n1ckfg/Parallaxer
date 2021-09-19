ParallaxBg bg0, bg1;

void setup() {
  size(1024, 512, P2D);
  bg0 = new ParallaxBg("bg0.png", 5, new PVector(0, 0));
  bg1 = new ParallaxBg("bg1.png", 10, new PVector(0, 0));
}

void draw() {
  background(0);
  bg0.run();
  bg1.run();
}
