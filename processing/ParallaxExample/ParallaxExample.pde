import gifAnimation.*;

Parallaxer bg0, bg1;
Gif player;
float xPos, delta;
float stopDelta = 0.5;
float speed = 0.03;

void setup() {
  size(1024, 512, P2D);
  noSmooth();
  bg0 = new Parallaxer("bg0.png", delta, new PVector(0, 0));
  bg1 = new Parallaxer("bg1.png", delta*2, new PVector(0, 0));
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
  delta = abs(xPos-width/2) * speed;
  if (mouseX < xPos) delta = -delta;
  
  if (xPos > width/3 && xPos < (width/3)*2 && delta > -stopDelta && delta < stopDelta) {
    delta = 0;
    player.jump(1);
    player.pause();
  } else {
    player.play();
  }
  bg0.speed = delta;
  bg1.speed = delta * 2;
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
