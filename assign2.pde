PImage bgImg;
PImage soilImg;
PImage lifeImg;
PImage soldierImg;
PImage cabbage;
PImage groundhogIdle;
PImage groundhogLeft;
PImage groundhogDown;
PImage groundhogRight;
PImage bg;
PImage title;
PImage gameover;
PImage startNormal;
PImage startHovered;
PImage restartHovered;
PImage restartNormal;

int area=80;
int cabbage_x, cabbage_y;
int groundhogIdle_x ,groundhogIdle_y;
int speed_x,speed_y;
int groundhog_x, groundhog_y;
int groundhog_a, groundhog_b;
int move_x, move_y;
int soldier_x,soldier_y;


int lifeone = 10;
int lifetwo = 80;
int lifethree = 150;
int lifelose = -100;
int countlife =2;

int game;
final int game_start = 0;
final int game_run = 1;
final int game_over = 2;


boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
boolean upPressed = false;



void setup() {
	size(640, 480, P2D);
  bgImg = loadImage("img/bg.jpg");
  title = loadImage("img/title.jpg");
  lifeImg = loadImage("img/life.png");
  soilImg = loadImage("img/soil.png");
  cabbage = loadImage("img/cabbage.png");
  soldierImg = loadImage("img/soldier.png");
  gameover = loadImage("img/gameover.jpg");
  startNormal = loadImage("img/startNormal.png");
  startHovered = loadImage("img/startHovered.png");
  restartNormal = loadImage("img/restartNormal.png");
  restartHovered = loadImage("img/restartHovered.png");
  groundhogIdle = loadImage("img/groundhogIdle.png");
  groundhogDown = loadImage("img/groundhogDown.png");
  groundhogLeft = loadImage("img/groundhogLeft.png");
  groundhogRight = loadImage("img/groundhogRight.png");
  

  soldier_y = area*floor(random(2, 6));
  cabbage_x = area*floor(random(0, 8));
  cabbage_y = area*floor(random(2, 5));
  game = game_start;
  groundhog_x = 4*area;
  groundhog_y = area;
  groundhog_a = groundhog_x;
  groundhog_b = groundhog_y;
}

void draw() {
  image(title, 0, 0);
  image(startNormal, 248, 360);
  

  switch(game) {
   //開始遊戲畫面
  case game_start:
    if (mouseX>248 && mouseX<392 && mouseY>360 && mouseY<420) {
      if (mousePressed) {
        game = game_run;
      } 
      
      else {
        image(startHovered, 248, 360);
      }
    }
    break;
  //遊戲中畫面
  case game_run:
    image(bgImg, 0, 0);
    image(soilImg, 0, area*2);
    image(lifeImg, lifeone, 10);
    image(lifeImg, lifetwo, 10);

    //草地
    fill(124, 204, 25);
    rect(0, 145, 640, 15);
    noStroke();//無線框

    //太陽
    fill(255, 255, 0);
    ellipse(590, 50, 130, 130);
    fill(253, 184, 19);
    ellipse(590, 50, 120, 120);

    soldier_x += 5;
    soldier_x %= -720;
    image(soldierImg, soldier_x-area, soldier_y);


    if (downPressed) {
      if (move_y < groundhog_y) {
        image( groundhogDown, groundhog_x, move_y);
        move_y += floor(80/15);
      } 
      else {
        downPressed = false;
      }
    } 
    else if (upPressed) {
      if (move_y > groundhog_y) {
        image( groundhogDown, groundhog_x, move_y);
        move_y -= floor(80/15);
      } 
      else {
        downPressed = false;
      }
    }
    else if (leftPressed) {
      if (move_x > groundhog_x) {
        image( groundhogLeft, move_x, groundhog_y);
        move_x -= floor(area/15);
      } 
      else {
        leftPressed = false;
      }
    }
    else if (rightPressed) {
      if (move_x < groundhog_x) {
        image( groundhogRight, move_x, groundhog_y);
        move_x += floor(area/15);
      } 
      else {
        rightPressed = false;
      }
    } 
    else {
      image(groundhogIdle, groundhog_x, groundhog_y);
    }

    if (soldier_x>groundhog_x && soldier_x-area<groundhog_x+area) {
      if ( soldier_y<groundhog_y+area&&soldier_y+area>groundhog_y ) {
        groundhog_x = 4*area;
        groundhog_y = area;
        countlife -= 1;
      }
    }

    image(cabbage, cabbage_x, cabbage_y);
    if (cabbage_x+area>groundhog_x && cabbage_x<groundhog_x+area) {
      if (cabbage_y+area>groundhog_y && cabbage_y<groundhog_y+area) {
        cabbage_y = 600;
        countlife += 1;
      }
    }
    if (countlife == 0) {
      game = game_over;
    }
    
    if (countlife == 1) {
      lifetwo = lifelose;
      lifethree = lifelose;
    }
    
    if (countlife == 2) {
      lifetwo = 80;
      lifethree = lifelose;
    }
    
    if (countlife == 3) {
      lifetwo = 80;
      lifethree = 150;
      image(lifeImg, lifethree, 10);
    }
    
    break;
  case game_over:
    image(gameover, 0, 0);
    image(restartNormal, 248, 360);
    if (mouseX>248 && mouseX<392 && mouseY>360 && mouseY<420) {
      if (mousePressed) {

        countlife = 2;
        soldier_y = area*floor(random(2, 6));
        cabbage_x = area*floor(random(0, 8));
        cabbage_y = area*floor(random(2, 5));
        groundhog_x = area*4;
        groundhog_y = area;
        game = game_run;
      } else {

        image(restartHovered, 248, 360);
      }
    }
    break;
  }
}


void keyPressed() {
  if ( !leftPressed && !rightPressed && !downPressed) {
    if (key == CODED) {
      switch (keyCode) {

      case DOWN:
        move_y = groundhog_y;
        downPressed = true;
        groundhog_y += area;
        break;
        
      case UP:
        move_y = groundhog_y;
        downPressed = true;
        groundhog_y -= area;
        break;

      case LEFT:
        move_x = groundhog_x;
        leftPressed = true;
        groundhog_x -= area;
        break;

      case RIGHT:
        move_x = groundhog_x;
        rightPressed = true;
        groundhog_x+= area;
        break;
      }
    }
  }
}


void keyReleased() {
  if (key == CODED) {
    switch(keyCode) {
    case DOWN:
      break;
    case LEFT:
      break;
    case RIGHT:
      break;
    case UP:
      break;
    }
  }
}
