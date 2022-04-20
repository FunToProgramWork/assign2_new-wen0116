PImage bgImg;
PImage soilImg;
PImage lifeImg;
PImage soldierImg;
PImage cabbage;
PImage groundhogIdle;
PImage groundhogLeft;
PImage groundhogDown;
PImage groundhogRight;

int x =0;
int cabbage_x=(random(0,640)/80)*80,cabbage_y=(random(160,480)/80)*80;

void setup() {
	size(640, 480, P2D);
	bgImg = loadImage("img/bg.jpg");
  soilImg = loadImage("img/soil.png");
  lifeImg= loadImage("img/life.png");
  soldierImg = loadImage("img/soldier.png");
  groundhogIdle = loadImage("img/groundhogIdle.png");
  cabbage = loadImage("img/cabbage.png");
  groundhogLeft = loadImage("img/groundhogLeft.png");
  groundhogDown = loadImage("img/groundhogDown.png");
  groundhogRight = loadImage("img/groundhogRight.png");
  
}

void draw() {
  image(bgImg,0,0);
  strokeWeight(15.0);
  stroke(124,204,25);
  line(0,152.5,640,152.5);

  image(soilImg, 0,160);

  strokeWeight(5.0);  
  stroke(255,255,0);
  ellipse(590, 50, 130, 130); 
  ellipseMode(CENTER);  
  fill(253,184,19);  
  ellipse(590, 50, 120,120); 
  
  image(lifeImg,10,10);
  image(lifeImg,80,10);
  
  image(groundhogIdle,280,80);
  
  image(soldierImg, x, 160);
  x=x+2;
  if(x>640)
  x=-80;

  image(cabbage,cabbage_x,cabbage_y);  
if(groundhogIdle==soldierImg){
  clear(image(lifeImg,80,10));
}

  
}


void keyPressed(){

  if(keyCode==LEFT){
  groundhogIdle = groundhogLeft;
  }  
  else if(keyCode==RIGHT){
  groundhogIdle = groundhogRight;
  }
  else if(keyCode==DOWN){
  groundhogIdle = groundhogDown;
  }
}

void keyReleased(){


}
