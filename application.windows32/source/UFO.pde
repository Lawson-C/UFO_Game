class UFO
{
  int changex = 0;
  int changey = 0;
  color c1 = 255;
  color c2 = 128;
  color c3 = 0;
  float chng1 = 5;
  float chng2 = 5;
  float chng3 = 5;
  float rot = 0;

  UFO()
  {
  }

  void colorChng() {
    if (player2 == false || lives <= 0) {
      c1 -= chng1;
      c2 -= chng2;
      c3 -= chng3;

      if (c1 > 255 || c1 < 0) {
        chng1 *= -1;
      }
      if (c2 > 255 || c2 < 0) {
        chng2 *= -1;
      }
      if (c3 > 255 || c3 < 0) {
        chng3 *= -1;
      }
    }
    else {
      c1 = 0;
      c2 = 0;
      c3 = 255;
    }
  }

  void display() {
    if (dead == false) {
      noStroke();
      fill(c1, c2, c3);
      ellipse(xU, yU, xbodSize, ybodSize);
      ellipse(xU, yU-16, xheadSize, yheadSize);
      fill(255);
      ellipse(xU-20, yU, lightSize, lightSize);
      ellipse(xU, yU, lightSize, lightSize);
      ellipse(xU+20, yU, lightSize, lightSize);
    }
    if (dead == true && lives > 0) {
      fill(255, 55, 0);
      ellipse(xU, yU, 50, 50);
      fill(255, 105, 0);
      ellipse(xU, yU, 40, 40);
      fill(255, 155, 0);
      ellipse(xU, yU, 30, 30);
      fill(255, 205, 0);
      ellipse(xU, yU, 20, 20);
      
      String respawn = "Press [ SPACE ] or [ R ] to respawn" + ENTER + "YOU DIED! -1 lives";
      textSize(25);
      fill(255);
      text(respawn, 50, 50, 700, 200);
    }
  }

  void moveKey() {
    if (dead == false) {
      if (keyPressed == true) {
        if (WASD == true || player2 == true) {
          if (key == 'w')
            changey = -5;
          if (key == 's')
            changey = 5;
          if (key == 'a')
            changex = -5;
          if (key == 'd')
            changex = 5;
        }

        if (arrowKeys == true && player2 == false && WASD == false) {
          if (key == CODED) {
            if (keyCode == UP)
              changey = 1;
            if (keyCode == DOWN)
              changey = 2;
            if (keyCode == LEFT)
              changex = -5;
            if (keyCode == RIGHT)
              changex = 5;
          }
        }
      }
    }
  }

  void edgeCheck() {
    if (yU > height)
      yU = 0;
    if (yU < 0)
      yU = height;
    if (xU > width)
      xU = 0;
    if (xU < 0)
      xU = width;
  }

  void winDisplay() {
    xU = width/2;
    yU = height/2;
    pushMatrix();
    noStroke();
    translate(xU, yU);
    rotateY(radians(rot));
    fill(c1, c2, c3);
    ellipse(0, 0, xbodSize, ybodSize);
    ellipse(0, 0-ySub, xheadSize, yheadSize);
    fill(255);
    translate(-xSub, 0, 0);
    sphere(lightSize/2);
    translate(xSub,0,0);
    sphere(lightSize/2);
    translate(xSub,0,0);
    sphere(lightSize/2);
    translate(-xSub, 0, 0);
    fill(255);
    if (count3 <= 20) {
      ySub *= 1.1;
      xSub *= 1.1;
      lightSize *= 1.1;
      xbodSize *= 1.1;
      ybodSize *= 1.1;
      xheadSize *= 1.1;
      yheadSize *= 1.1;
    }
    if (count3 > 20) {
      rot += .5;
    }
    popMatrix();

    count3 += 1;
  }
}
