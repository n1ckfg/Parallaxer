class Parallaxer {

  float speed;
  PImage img;
  float spriteWidth;
  float startX, endX;
  PVector position, position2;

  Parallaxer(PImage _img, float _speed, PVector _position) {
    img = _img;
    speed = _speed;
    position = _position;
    
    init();
  }
  
  Parallaxer(String _url, float _speed, PVector _position) {
    img = loadImage(_url);
    speed = _speed;
    position = _position;
    
    init();
  }
  
  void init() {
    spriteWidth = img.width;
    startX = position.x;
    endX = startX - spriteWidth;
    position2 = new PVector(startX + spriteWidth, 0);
  }
 
  void update() {
    position.x -= speed;
    
    if (position.x < endX) {
      position = new PVector(startX, position.y);
    } else if (position.x > startX) {
      position = new PVector(endX, position.y);
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
