import gifAnimation.*;

Parallaxer bg0, bg1;
Gif player;
float xPos;
float speed = 5;

void setup() {
  size(1024, 512, P2D);
  noSmooth();
  bg0 = new Parallaxer("bg0.png", speed, new PVector(0, 0));
  bg1 = new Parallaxer("bg1.png", speed*2, new PVector(0, 0));
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
  speed = abs(xPos-mouseX) * 0.1;
  if (mouseX < xPos) speed = -speed;
  
  if (speed < 0.5) {
    speed = 0;
    player.jump(1);
    player.pause();
  } else {
    player.play();
  }
  bg0.speed = speed;
  bg1.speed = speed * 2;
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
