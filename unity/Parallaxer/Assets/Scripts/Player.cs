using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour {

    public float lerpSpeed = 0.1f;
    public Vector2 screenCoords;

    private void Update() {
        screenCoords = Camera.main.ScreenToWorldPoint(Input.mousePosition);
        transform.position = Vector2.Lerp(transform.position, new Vector2(screenCoords.x, transform.position.y), lerpSpeed);

		if (screenCoords.x < transform.position.x) {
            transform.localScale = new Vector3(-Mathf.Abs(transform.localScale.x), transform.localScale.y, transform.localScale.z);
        } else {
            transform.localScale = new Vector3(Mathf.Abs(transform.localScale.x), transform.localScale.y, transform.localScale.z);
        }
    }

}
