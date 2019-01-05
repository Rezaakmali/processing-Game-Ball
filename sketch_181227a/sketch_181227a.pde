PImage img;
void setup() {
  size(500,500);
  img = loadImage("Asdf.jpg"); 
  background(img);
  smooth();
}
float circleA = 100;
float circleB = 50;
float speedA = 10;
float speedB = 5;
int score = 0;
int Error = 0;
boolean gamestate = false;

void draw() {
  //start is set to false until the player clicks on the screen
  if(gamestate != true) {
    textSize(30);
    background(img);
    textAlign(CENTER);
    fill(225);
    text("Start Click", width/2 , height/2);
    score = 0;
    Error = 0;
    if(mousePressed) {
    gamestate = true;
    }
 } else {
  float paddle = 1000 / (score + 10);
  background(img);
  if(circleA < 0 || circleA > width) 
    speedA = -speedA;
  if(circleB > height){
    speedB = -speedB; 
    float distance = abs(mouseX - circleA);
  if (distance < paddle)
      score += 1;
    else Error += 1;  
  } 
  else 
    speedB += 1;  
  
  circleA = circleA + speedA;
  circleB = circleB + speedB;
  //background(0,0,100);
  rect(mouseX-paddle,height-10,100,125);
  ellipse(circleA, circleB,35,35 );
  fill(224,225,0);
  text("score: " + score, 60, 40);
  text("Error: " + Error, 60, 80);
  
  if(Error == 5){ 
   text("NOT SO EASY HUH?!?!!?!", 250, 250);
}
  if(score == 10) {
      text("IT'S JUST GOIN TO KEEP GETTING HARDER!!!", 250,250);
       speedB += 1;
       //speedA += 1;
      }
  if(Error == 15) {
    text("Game Over",250,250);
  } 
  while (Error>15) {
 // System.out.println(gamestate);
      Error++;
      gamestate=false;
   }
}

} 
 void mousePressed() {
    if(gamestate == mousePressed && gamestate == false)
    gamestate = true;
  }
