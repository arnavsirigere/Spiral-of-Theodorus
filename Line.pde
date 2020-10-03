class Line {
  float x1, y1, x2, y2;
  PVector v1;
  PVector v2;

  Line(PVector v1, PVector v2) {
    this.v1 = v1;
    this.v2 = v2;
    x1 = v1.x;
    x2 = v2.x;
    y1 = v1.y;
    y2 = v2.y;
  }

  Line copy() {
    return new Line(v1, v2);
  }
}
