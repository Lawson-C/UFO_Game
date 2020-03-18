class debris
{
  float xR, yR;
  int xSpeed = 0;
  float xSize, ySize;
  int count4 = 0;
  int count1 = 0;

  debris(  float tempy, float tempx, int tempSpeed, float tempxSize, float tempySize)
  {
    yR = tempy;
    xR = tempx;
    xSpeed = tempSpeed;
    xSize = tempxSize;
    ySize = tempySize;
  }

  void display() {
    noStroke();
    fill(155);
    ellipse(xR, yR, xSize, ySize);
    fill(0);
  }

  void move() {
    xR -= xSpeed;
  }

  void xCheck() {
    if (xR <= 0) {
      xR = 800;
      yR = 50 + random(700);
      xSize = 50 + int(random(151));
      ySize = 50 + int(random(151));
      scoreADD = int(ySize + xSize)/20;
      score += scoreADD;
      addShow();
    }
  }
}