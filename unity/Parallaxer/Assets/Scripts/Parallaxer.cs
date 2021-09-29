using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Parallaxer : MonoBehaviour {

    public float speed;

    private Parallaxer dupeLayer;
    private bool isDupe = false;
    private float spriteWidth;
    private float startX, endX;
    private Vector2 delta = Vector2.zero;

    private void Start() {
        if (gameObject.name.Split('(')[0] != transform.parent.name.Split('(')[0]) {
            dupeLayer = GameObject.Instantiate(gameObject).GetComponent<Parallaxer>();
            dupeLayer.isDupe = true;
            dupeLayer.transform.SetParent(transform);

            SpriteRenderer ren = GetComponent<SpriteRenderer>();
            spriteWidth = ren.sprite.rect.width / 100f; // half pixel width / 100

            transform.Translate(new Vector3(spriteWidth, 0f, 0f));
            startX = transform.position.x;
            endX = startX - spriteWidth;

            dupeLayer.startX = startX - spriteWidth;
            dupeLayer.transform.position = new Vector2(dupeLayer.startX, transform.position.y);
        }
    }

    private void Update() {
        if (!isDupe) {
            delta = Vector2.left * speed * Time.deltaTime;

            transform.Translate(delta);

            if (transform.position.x < endX) {
				transform.position = new Vector2(startX, transform.position.y);
            } else if (transform.position.x > startX) {
                transform.position = new Vector2(endX, transform.position.y);
            }
        }
    }

}
