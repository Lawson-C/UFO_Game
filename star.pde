class star
{
  int y;
  int x;
  int c;
  
  star( int tempX, int tempY, int tempColor)
  {
    x = tempX;
    y = tempY;
    c = tempColor;
  }
  
  void display() {
    updatePos();
    fill(c);
    ellipse(x,y,5,5);
  }
  
  void updatePos() {
    if (x <= 0) {
      x = width;
    }
    x -= 5;
  }
}
