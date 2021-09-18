class ParallaxBg {

  PImage img;
  ParallaxBg dupeLayer;
  boolean isDupe = false;
  float startX, endX;
  PVector position = new PVector();
  float delta = 10;
  boolean flip = false;
  int lastMillis = 0;

  ParallaxBg(PImage _img, PVector _position, boolean _isDupe) {
    img = _img;
    position = _position;
    isDupe = _isDupe;
    
    position.x += img.width;
    startX = position.x;
    
    if (!isDupe) {
      dupeLayer = new ParallaxBg(img, position, true);
      dupeLayer.startX = startX - img.width;
      dupeLayer.position = new PVector(dupeLayer.startX, position.y);  
    }
  }

  void update() {
    if (!isDupe) {
      endX = startX - img.width;

      position.x += delta;

      if (position.x < endX) {
        if (flip) {
          flip = false;
        } else {
          dupeLayer.startX += img.width * 2;
          flip = true;
        }

        position = new PVector(startX, position.y);
      }
    }
  }
  
  void draw() {
    image(img, position.x, position.y);
    image(dupeLayer.img, dupeLayer.position.x, dupeLayer.position.y);
  }
  
  void run() {
    update();
    draw();
  }
  
}
