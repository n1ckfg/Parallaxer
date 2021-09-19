class ParallaxBg {

  float speed;
  PImage img;
  float spriteWidth;
  float startX, startX2, endX;
  boolean flip = false;
  PVector position, position2;

  ParallaxBg(PImage _img, float _speed, PVector _position) {
    img = _img;
    speed = _speed;
    position = _position;
    
    init();
  }
  
  ParallaxBg(String _url, float _speed, PVector _position) {
    img = loadImage(_url);
    speed = _speed;
    position = _position;
    
    init();
  }
  
  void init() {
    spriteWidth = img.width;
    startX = position.x;
    endX = startX + spriteWidth;
    startX2 = startX - spriteWidth;
    position2 = new PVector(startX2, 0);
  }
  
  void update() {
    position.x += speed;

    if (position.x > endX) {
      if (flip) {
        flip = false;
      } else {
        startX2 -= spriteWidth;
        flip = true;
      }
  
      position = new PVector(startX, position.y);
    }
  }
  
  void draw() {
    pushMatrix();
    translate(position.x, position.y);
    image(img, 0, 0);
    image(img, position2.x, position2.y);
    popMatrix();
  }
  
  void run() {
    update();
    draw();
  }

}
