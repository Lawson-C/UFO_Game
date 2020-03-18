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
    fill(c);
    ellipse(x,y,5,5);
  }
}
