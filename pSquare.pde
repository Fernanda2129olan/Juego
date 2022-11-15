class pSquare {
  float x;
  float y;
  float wid;
  color colour;
  boolean perfect;
  void display() {
    fill(colour);
    rect(x, y, wid, 40);
    if (perfect){
      fill(0, 100);
     star(x + wid/2, y + 20, 7, 15, 5);  
    }
  }
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a + radians(45)) * radius2;
    float sy = y + sin(a + radians(45)) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle + radians(45)) * radius1;
    sy = y + sin(a+halfAngle + radians(45)) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
