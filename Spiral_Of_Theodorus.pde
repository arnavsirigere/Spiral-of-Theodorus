final float len = 50; // No. of pixels for one unit
int hu = 0;
Line base;
Line side;
Line hypotenuse;

void setup() {
  size(600, 600);
  background(0);
  colorMode(HSB);
  base = new Line(new PVector(0, 0), new PVector(50, 0));
}

void draw() {
  frameRate(15);
  translate(width / 2, height / 2);
  side = new Line(base.v2, orthogonalVector(base));
  hypotenuse = new Line(base.v1, side.v2);
  fill(hu, 255, 255, 150);
  noStroke();
  beginShape();
  vertex(base.x1, base.y1);
  vertex(side.x1, side.y1);
  vertex(hypotenuse.x2, hypotenuse.y2);
  endShape();
  base = hypotenuse.copy();
  PVector origin = new PVector();
  if (hypotenuse.v2.dist(origin) > height / 2 + 30) {
    reset();
  }
  hu += 10;
  if (hu > 255) {
    hu = 0;
  }
}

void reset() {
  background(0);
  base = new Line(new PVector(0, 0), new PVector(50, 0));
  hu = 0;
}

PVector orthogonalVector(Line l) {
  float dx = l.x2 - l.x1;
  float dy = l.y2 - l.y1;
  float dist = sqrt(dx * dx + dy * dy);
  dx /= dist;
  dy /= dist;
  float x = l.x2 + len * dy;
  float y = l.y2 - len * dx;
  return new PVector(x, y);
}
