class ParallaxBg {

  float speed;

  ParallaxBg dupeLayer;
  boolean isDupe = false;
  float spriteWidth;
  float startX, endX, offsetX;
  PVector delta = new PVector();
  boolean flip = false;

  ParallaxBg() {
    if (gameObject.name.Split('(')[0] != transform.parent.name.Split('(')[0]) {
      dupeLayer = GameObject.Instantiate(gameObject).GetComponent<Parallaxer>();
      dupeLayer.isDupe = true;
      dupeLayer.transform.SetParent(transform);

      SpriteRenderer ren = GetComponent<SpriteRenderer>();
      spriteWidth = ren.sprite.rect.width / 100f; // half pixel width / 100

      transform.Translate(new Vector3(spriteWidth, 0f, 0f));
      startX = transform.position.x;
      dupeLayer.startX = startX - spriteWidth;
      dupeLayer.transform.position = new Vector2(dupeLayer.startX, transform.position.y);
    }
  }

  void update() {
    if (!isDupe) {
      delta = Vector2.left * speed * Time.deltaTime;
      offsetX = (Screen.width / Camera.main.orthographicSize) / 100f;
      endX = startX - spriteWidth;
      //Debug.Log("spriteWidth: " + spriteWidth + ", startX: " + startX + ", endX: " + endX + ", offsetX: " + offsetX);

      transform.Translate(delta);

      if (transform.position.x < endX) {
        if (flip) {
          flip = false;
    } else {
          dupeLayer.startX += spriteWidth * 2;
          flip = true;
    }

    transform.position = new Vector2(startX, transform.position.y);
      }
    }
  }
  
  void draw() {
  }
  
  void run() {
    update();
    draw();
  }
  
}
