using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MouseControl : MonoBehaviour {

    public float lerpSpeed = 0.1f;
    public float parallaxSpeed = 2f;
    public Parallaxer[] parallaxers;

    private void Update() {
        Vector2 screenCoords = Camera.main.ScreenToWorldPoint(Input.mousePosition);
        transform.position = Vector2.Lerp(transform.position, new Vector2(screenCoords.x, transform.position.y), lerpSpeed);

		if (screenCoords.x < 0f) {
            transform.localScale = new Vector3(-Mathf.Abs(transform.localScale.x), transform.localScale.y, transform.localScale.z);
        } else {
            transform.localScale = new Vector3(Mathf.Abs(transform.localScale.x), transform.localScale.y, transform.localScale.z);
        }

        for (int i = 0; i < parallaxers.Length; i++) {
            parallaxers[i].speed = transform.position.x * (i+1) * parallaxSpeed;
            if (screenCoords.x < transform.position.x) parallaxers[i].speed = -Mathf.Abs(parallaxers[i].speed);
        }
    }

}
