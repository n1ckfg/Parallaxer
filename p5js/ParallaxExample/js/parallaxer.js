"use strict";

class Parallaxer {

	constructor(_img, _speed, _position) {
		this.img = _img;
		this.speed = _speed;
		this.position = _position;
		
		this.spriteWidth;
		this.startX;
		this.endX;
		this.position;
		this.position2;

		this.init();
	}
	 
	init() {
		this.spriteWidth = this.img.width;
		this.startX = this.position.x;
		this.endX = this.startX - this.spriteWidth;
		this.position2 = createVector(this.startX + this.spriteWidth, 0);
	}
 
	update() {
		this.position.x -= this.speed;
		
		if (this.position.x < this.endX) {
			this.position = createVector(this.startX, this.position.y);
		} else if (this.position.x > this.startX) {
			this.position = createVector(this.endX, this.position.y);
		}
	}
	
	draw() {
		push();
		translate(this.position.x, this.position.y);
		image(this.img, 0, 0);
		image(this.img, this.position2.x, this.position2.y);
		pop();
	}
	
	run() {
		this.update();
		this.draw();
	}

}
