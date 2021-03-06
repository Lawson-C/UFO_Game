int ySub = 16;
int xSub = 20;
int lightSize = 14;
int xbodSize = 80;
int ybodSize = 30;
int xheadSize = 28;
int yheadSize = 20;

int score = 0;
int scoreADD;
int playerNum = 0;
float yU = 300;
float xU = 50;
float yU2 = 500;
float xU2 = 50;
float lives = 3;
float lives2 = 3;
float rot1 = 0;

boolean dead = false;
boolean dead2 = false;
boolean cont = true;
boolean arrowKeys = false;
boolean start = false;
boolean WASD = false;
boolean player2 = false;
boolean menu = true;
boolean title = true;
boolean scoreBoard = false;
boolean loading = false;

int[] scoreFinal = {0, 0, 0, 0, 0};
String[] player = {"", "", "", "", "", "High Score: "};
String sb = "Scores: null";

int count = 0;
int count2 = 0;
int count3 = 0;
int count5 = 0;
int count6 = 0;
int onceCount = 0;
int loadingCount = 0;

UFO ufo1 = new UFO();
UFO2 ufo2 = new UFO2();
debris[] debrisArray = new debris[7];
star[] starArray = new star[200];

void setup() {
  size(800, 800, P3D);
  background(0);

  for (int a = 0; a < debrisArray.length; a++) {
    debrisArray[a] = new debris(50 + random(700), 700 + random(50), 1 + int(random(5)), 50 + random(101), 50 + random(101));
  }

  if (loading == false) {
    for (int a = 0; a < starArray.length; a++) {
      starArray[a] = new star(int(random(800)), int(random(800)), 255);
    }
  }

  for (int a = 0; a < starArray.length; a++) {
    starArray[a].display();
  }

  xU = width/2;
  yU = height/2;
  ySub *= 5;
  xSub *= 5;
  lightSize *= 5;
  xbodSize *= 5;
  ybodSize *= 5;
  xheadSize *= 5;
  yheadSize *= 5;
  fill(128, 127, 128);
  noStroke();
  translate(xU, yU);
  ellipse(0, 0, xbodSize, ybodSize);
  ellipse(0, 0-ySub, xheadSize, yheadSize);
  fill(255);
  translate(-xSub, 0, 0);
  sphere(lightSize/2);
  translate(xSub, 0, 0);
  sphere(lightSize/2);
  translate(xSub, 0, 0);
  sphere(lightSize/2);
  translate(-xSub, 0, 0);
  fill(255);
  translate(-xU, -yU);
  xU = 50;
  yU = 400;
  ySub = 16;
  xSub = 20;
  lightSize = 14;
  xbodSize = 80;
  ybodSize = 30;
  xheadSize = 28;
  yheadSize = 20;
}

void draw() {
  background(0);
  String s = "Final Score: " + score;
  if (onceCount < 1) {
    for (int i = 0; i < 5; i++) {
      player[i] = "Player"+(i+1)+": ";
    }
  }

  if (menu == true && title == false) {
    for (int a = 0; a < starArray.length; a++) {
      starArray[a].display();
    }
    //start screen
    button2();
  }

  if (menu == false && title == false) {
    for (int a = 0; a < starArray.length; a++) {
      starArray[a].display();
    }
  }

  //player1 lives
  if (start == true && menu == false && title == false) {
    if (lives == 3) {
      fill(255, 0, 0);
      rect(715, 10, 25, 25);
      rect(745, 10, 25, 25);
      rect(775, 10, 25, 25);
    }
    if (lives == 2) {
      fill(155);
      rect(715, 10, 25, 25);
      fill(255, 0, 0);
      rect(745, 10, 25, 25);
      rect(775, 10, 25, 25);
    }
    if (lives == 1) {
      fill(155);
      rect(745, 10, 25, 25);
      rect(715, 10, 25, 25);
      fill(255, 0, 0);
      rect(775, 10, 25, 25);
    }
    if (lives == 0) {
      fill(155);
      rect(745, 10, 25, 25);
      rect(715, 10, 25, 25);
      rect(775, 10, 25, 25);
    }
  }

  //solo final score
  if (lives == 0 && player2 == false) {
    fill(255);
    textSize(50);
    background(5);
    ufo1.colorChng();
    ufo1.winDisplay();
    text(s, 200, 550, 500, 200);
    dead = true;
    if (playerNum >= 6) {
      playerNum  = 0;
      for (int i =0; i < scoreFinal.length; i++) {
        scoreFinal[i] = 0;
        player[i] = "Player"+(i+1)+": "+scoreFinal[i];
      }
    }
    if (count6 < 1) {
      playerNum += 1;
      if (playerNum == 1) {
        scoreFinal[0] = score;
        player[0] = "Player1: "+ scoreFinal[0];
      }
      if (playerNum == 2) {
        scoreFinal[1] = score;
        player[1] = "Player2: "+ scoreFinal[1];
      }
      if (playerNum == 3) {
        scoreFinal[2] = score;
        player[2] = "Player3: "+ scoreFinal[2];
      }
      if (playerNum == 4) {
        scoreFinal[3] = score;
        player[3] = "Player4: "+ scoreFinal[3];
      }
      if (playerNum == 5) {
        scoreFinal[4] = score;
        player[4] = "Player5: "+ scoreFinal[4];
      }
    }
    count6 += 1;
    resetButton();
  }

  //player2 lives
  if (start == true && menu == false && player2 == true && title == false) {
    if (lives2 == 3) {
      fill(255, 0, 0);
      rect(715, 765, 25, 25);
      rect(745, 765, 25, 25);
      rect(775, 765, 25, 25);
    }
    if (lives2 == 2) {
      fill(155);
      rect(715, 765, 25, 25);
      fill(255, 0, 0);
      rect(745, 765, 25, 25);
      rect(775, 765, 25, 25);
    }
    if (lives2 == 1) {
      fill(155);
      rect(745, 765, 25, 25);
      rect(715, 765, 25, 25);
      fill(255, 0, 0);
      rect(775, 765, 25, 25);
    }
    if (lives2 == 0) {
      fill(155);
      rect(745, 765, 25, 25);
      rect(715, 765, 25, 25);
      rect(775, 765, 25, 25);
    }
  }

  //both dead
  if (lives == 0 && lives2 == 0 && player2 == true) {
    fill(155);
    rect(745, 10, 25, 25);
    rect(715, 10, 25, 25);
    rect(775, 10, 25, 25);
    fill(255);
    textSize(50);
    background(5);
    ufo1.colorChng();
    ufo1.winDisplay();
    text(s, 200, 550, 500, 200);
    dead = true;
    if (playerNum >= 6) {
      playerNum  = 0;
      for (int i=0; i < scoreFinal.length; i++) {
        scoreFinal[i] = 0;
        player[i] = "Player"+(i+1)+": "+scoreFinal[i];
      }
    }
    if (count6 < 1) {
      playerNum += 1;
      if (playerNum == 1) {
        scoreFinal[0] = int(score/2);
        player[0] = "Player1: "+ scoreFinal[0];
      }
      if (playerNum == 2) {
        scoreFinal[1] = int(score);
        player[1] = "Player2: "+ scoreFinal[1];
      }
      if (playerNum == 3) {
        scoreFinal[2] = int(score);
        player[2] = "Player3: "+ scoreFinal[2];
      }
      if (playerNum == 4) {
        scoreFinal[3] = int(score);
        player[3] = "Player4: "+ scoreFinal[3];
      }
      if (playerNum == 5) {
        scoreFinal[4] = int(score);
        player[4] = "Player5: "+ scoreFinal[4];
      }
    }
    count6 += 1;
    resetButton();
  }

  //ufo appear
  if (start == true && menu == false && title == false) {
    if (cont == true) {
      if (lives > 0) {
        ufo1.display();
        ufo1.colorChng();
        ufo1.moveKey();
        xU += ufo1.changex;
        yU += ufo1.changey;
        ufo1.edgeCheck();
      }
      if (player2 == true && lives2 > 0) {
        ufo2.display();
        ufo2.moveKey();
        xU2 += ufo2.changex;
        yU2 += ufo2.changey;
        ufo2.edgeCheck();
      }
    }
  }

  //debris appear
  if (cont == true && title == false && menu == false) {
    for (int a = 0; a < debrisArray.length; a++) {
      debrisArray[a].display();
      collision();
      debrisArray[a].move();
      debrisArray[a].xCheck();
    }
  }
  //death and respawn
  if (cont == true && start == true && menu == false && lives > 0 && title == false && player2 == false)
    ufo1.display();

  if (dead == true) {
    ufo1.display();
    if (lives2 > 0 && player2 == true) 
      ufo2.display();
  }
  if (dead2 == true && player2 == true && lives2 > 0) {
    ufo2.display();
    if (lives > 0)
      ufo1.display();
  }
  if (cont == false && keyPressed == true && lives > 0 && player2 == false && title == false) {
    if (key == ' ' || key == 'r') {
      setup();
      xU = 50;
      yU = height/2;
      cont = true;
      dead = false;
      dead2 = false;
      ufo2.display();
      ufo1.display();
    }
  }
  if (cont == false && keyPressed == true && (lives > 0 || lives2 > 0) && player2 == true && title == false) {
    if (key == ' ' || key == 'r') {
      setup();
      xU = 50;
      yU = height/2;
      cont = true;
      dead = false;
      dead2 = false;
    }
  }

  //menu
  if (start == false && menu == false && title == false) {
    background(0);
    button();
  }

  if (title == true) {
    background(0);
    for (int a = 0; a < starArray.length; a++) {
      starArray[a].display();
    }
    mainTitle();
  }
  if (loading == true) {
    loading();
    fill(255);
    textSize(50);
    text("Loading...", 150, 100, 700, 100);
  }
  onceCount += 1;
}

void button() {
  strokeWeight(5);
  stroke(255);
  textSize(50);

  fill(0);
  rect(50, 50, 300, 300);
  String b1 = "ARROW KEYS";
  fill(255);
  text(b1, 100, 100, 200, 200);

  fill(0);
  rect(450, 50, 300, 300);
  String b2 = "WASD";
  fill(255);
  text(b2, 500, 100, 200, 200);

  fill(0);
  rect(50, 400, 700, 300);
  String b3 = "2 PLAYER";
  fill(255);
  text(b3, 100, 450, 600, 200);
  strokeWeight(1);

  if (loading == false && mousePressed == true && (mouseX > 50 && mouseX < 350) && (mouseY > 50 && mouseY < 350) && menu == false && start == false && title == false) {
    arrowKeys = true;
    start = true;
    score = 0;
    setup();
    xU = 50;
    yU = width/2;
    ySub = 16;
    xSub = 20;
    lightSize = 14;
    xbodSize = 80;
    ybodSize = 30;
    xheadSize = 28;
    yheadSize = 20;
  }

  if (loading == false && mousePressed == true && (mouseX > 450 && mouseX < 750) && (mouseY > 50 && mouseY < 350) && menu == false && start == false && title == false) {
    WASD = true;
    start = true;
    score = 0;
    setup();
    xU = 50;
    yU = width/2;
    ySub = 16;
    xSub = 20;
    lightSize = 14;
    xbodSize = 80;
    ybodSize = 30;
    xheadSize = 28;
    yheadSize = 20;
  }

  if (loading == false && mousePressed == true && (mouseX > 50 && mouseX < 750) && (mouseY > 450 && mouseY < 750) && menu == false && start == false && title == false) {
    player2 = true;
    start = true;
    score = 0;
    setup();
    xU = 50;
    yU = width/2;
    ySub = 16;
    xSub = 20;
    lightSize = 14;
    xbodSize = 80;
    ybodSize = 30;
    xheadSize = 28;
    yheadSize = 20;
  }
}

void button2() {
  strokeWeight(5);
  stroke(255);
  fill(0);
  rect(300, 300, 200, 200);
  triangle(320, 320, 320, 480, 480, 400);
  strokeWeight(1);
  stroke(0);

  if (mousePressed == true && (mouseX > 300 && mouseX < 500) && (mouseY > 300 && mouseY < 500) && menu == true && start == false && title == false) {
    menu = false;
    start = false;
    loadingCount = 0;
    loading = true;
    loading();
  }

  fill(255);
  String play = "START";
  textSize(60);
  text(play, 300, 200, 200, 100);
}

void resetButton() {
  stroke(255);
  fill(55);
  rect(50, 50, 300, 150);
  fill(255);
  textSize(100);
  String exit = "EXIT";
  text(exit, 50, 50, 300, 150);
  if (mousePressed == true && (mouseX > 50 && mouseX < 350) && (mouseY > 50 && mouseY < 200) && lives <= 0) {
    loadingCount = 0;
    loading = true;
    loading();
    if (player2 == true && lives2 <= 0) {
      ySub = 16;
      xSub = 20;
      lightSize = 14;
      xbodSize = 80;
      ybodSize = 30;
      xheadSize = 28;
      yheadSize = 20;

      yU = 300;
      xU = 50;
      yU2 = 500;
      xU2 = 50;
      lives = 3;
      lives2 = 3;
      dead = false;
      dead2 = false;
      cont = true;
      arrowKeys = false;
      start = false;
      WASD = false;
      player2 = false;
      menu = false;
      title = true;
      count = 0;
      count2 = 0;
      count3 = 0;
      count5 = 0;
      count6 = 0;
      setup();
      scoreBoard = true;
    } else if (player2 == false) {
      ySub = 16;
      xSub = 20;
      lightSize = 14;
      xbodSize = 80;
      ybodSize = 30;
      xheadSize = 28;
      yheadSize = 20;
      yU = 300;
      xU = 50;
      yU2 = 500;
      xU2 = 50;
      lives = 3;
      lives2 = 3;
      dead = false;
      dead2 = false;
      cont = true;
      arrowKeys = false;
      start = false;
      WASD = false;
      player2 = false;
      menu = false;
      title = true;
      count = 0;
      count2 = 0;
      count3 = 0;
      count5 = 0;
      count6 = 0;
      setup();
      scoreBoard = true;
    }
  }
}

void addShow() {
  fill(255);
  textSize(50);
  String scadd = "+" + scoreADD;
  if (count5 < 80)
    text(scadd, 100, 50, 300, 75);

  count5 += 1;
}

//Main title and score board
void mainTitle() {
  String titles = "You are an alien researcher sent out to discover the Asteroid Belt of the Solar System." + ENTER + 
    "Now if you are ready, you will be sent out to avoid asteroids and as each one passes you, you will have scanned it for information. Now go research..."
    + ENTER + "CLICK";
  fill(205, 205, 0);
  textSize(45);
  text(titles, 50, 50, 700, 700);

  if (mousePressed == true && title == true && loading == false && mouseY > 500) {
    title = false;
    menu = true;
    loadingCount = 0;
    loading = true;
    loading();
    scoreBoard = false;
  }

  if (scoreBoard == true) {
    stroke(255);
    fill(0);
    rect(75, 75, 250, 480);
    noStroke();
    rect(50, 50, 700, 600);
    resetScore();
    fill(255);
    textSize(25);
    //scores
    for (int i = 0; i < player.length; i++) {
      player[5] = "High Score: "+max(scoreFinal); 
      text(player[i], 100, 120+60*i);
    }
  }
}

void resetScore() {
  stroke(255);
  fill(0);
  rect(400, 100, 300, 150);
  noStroke();
  fill(255);
  textSize(50);
  text("Reset Scoreboard", 400, 100, 300, 150);
  if (mousePressed == true && (mouseX > 400 && mouseX < 700) && (mouseY > 100 && mouseY < 250) && scoreBoard == true && loading == false) {
    for (int i = 0; i < scoreFinal.length; i++) {
      scoreFinal[i] = 0;
      playerNum = 0;
      player[i] = "Player"+(i+1)+": "+scoreFinal[i];
    }
  }
}

void loading() {
  if (loadingCount <= 50) {
    setup();
  }
  if (loadingCount > 50) {
    loading = false;
  }
  loadingCount += 1;
}

void collision() {
  if (menu == false && start == true) {
    for (int i=0; i < debrisArray.length; i++) {
      if ((xU >= debrisArray[i].xR - debrisArray[i].xSize/2 && xU <= debrisArray[i].xR + debrisArray[i].xSize/2) && (yU >= debrisArray[i].yR - debrisArray[i].ySize/2 && yU <= debrisArray[i].yR + debrisArray[i].ySize) && lives > 0) {
        if (count < 1)
          lives -= 1;
        xU = 50;
        yU = 300;
        xU2 = 50;
        yU2 = 500;
        cont = false;
        dead = true;
        debrisArray[i].count1 += 1;
      }

      if ((xU2 >= debrisArray[i].xR - debrisArray[i].xSize/2 && xU2 <= debrisArray[i].xR + debrisArray[i].xSize/2) && (yU2 >= debrisArray[i].yR - debrisArray[i].ySize/2 && yU2 <= debrisArray[i].yR + debrisArray[i].ySize) && player2 == true && lives2 > 0) {
        if (count < 1)
          lives2 -= 1;
        xU2 = 50;
        yU2 = 500;
        xU = 50;
        yU = 300;
        cont = false;
        dead2 = true;
        debrisArray[i].count4 += 1;
      }
    }
  }
}

void keyReleased() {
  if (arrowKeys == false && key == 'w' || key == 'a')
    ufo1.changey = 0;
  if (arrowKeys == false && key == 's' || key == 'd')
    ufo1.changex = 0;
  if (key == CODED)
    if (player2 == false && key == UP || key == DOWN)
      ufo1.changey = 0;
    if (player2 == false &&  key == LEFT || key == RIGHT )
      ufo1.changex = 0;
      
    if (player2 == true && key == UP || key == DOWN)
      ufo2.changey = 0;
    if (player2 == true && key == LEFT || key == RIGHT)
      ufo2.changex = 0;
}

void keyPressed() {
  ufo1.moveKey();
  ufo2.moveKey();
}
