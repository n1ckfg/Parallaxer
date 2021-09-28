import gifAnimation.*;

Parallaxer bg0, bg1;
Gif player;
float xPos;

void setup() {
  size(1024, 512, P2D);
  noSmooth();
  bg0 = new Parallaxer("bg0.png", 5, new PVector(0, 0));
  bg1 = new Parallaxer("bg1.png", 10, new PVector(0, 0));
  ((PGraphicsOpenGL)g).textureSampling(3); // disables smoothing
  
  player = new Gif(this, "megaman.gif");
  player.loop();
  player.play();
  
  xPos = width/2;
}

void draw() {
  background(0);
  
  imageMode(CORNER);
  pushMatrix();
  scale(height / bg0.img.height);
  bg0.run();
  bg1.run();
  popMatrix();
  
  imageMode(CENTER);
  pushMatrix();
  xPos = lerp(xPos, mouseX, 0.1);
  translate(xPos, height/2);
  if (mouseX < xPos) {
    scale(0.5, 0.5);
  } else {
    scale(-0.5, 0.5);
  }
  image(player, 0, 0);
  popMatrix();
}
