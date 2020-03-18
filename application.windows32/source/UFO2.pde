class UFO2
{
  int changex = 0;
  int changey = 0;
  UFO2()
  {
  }

  void display() {
    if (dead2 == false) {
      noStroke();
      fill(0, 255, 0);
      ellipse(xU2, yU2, 80, 30);
      ellipse(xU2, yU2-16, 28, 20);
      fill(255);
      ellipse(xU2-20, yU2, 14, 14);
      ellipse(xU2, yU2, 14, 14);
      ellipse(xU2+20, yU2, 14, 14);
    }
    if (dead2 == true && lives2 > 0) {
      fill(255, 55, 0);
      ellipse(xU2, yU2, 50, 50);
      fill(255, 105, 0);
      ellipse(xU2, yU2, 40, 40);
      fill(255, 155, 0);
      ellipse(xU2, yU2, 30, 30);
      fill(255, 205, 0);
      ellipse(xU2, yU2, 20, 20);
      
      String respawn = "Press [ SPACE ] or [ R ] to respawn" + ENTER + "YOU DIED! -1 lives";
      textSize(25);
      fill(255);
      text(respawn, 50, 50, 700, 200);
    }
  }

  void moveKey() {
    if (player2 == true) {
      if (keyPressed == true) {
        if (key == CODED) {
          if (keyCode == UP)
            changey = -5;
            //up
          if (keyCode == DOWN)
            changey = 5;
            //down
          if (keyCode == LEFT)
            changex = -5;
          if (keyCode == RIGHT)
            changex = 5;
        }
      }
    }
  }

  void edgeCheck() {
    if (yU2 > height)
      yU2 = 0;
    if (yU2 < 0)
      yU2 = height;
    if (xU2 > width)
      xU2 = 0;
    if (xU2 < 0)
      xU2 = width;
  }
}
