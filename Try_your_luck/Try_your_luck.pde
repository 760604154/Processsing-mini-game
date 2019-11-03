/*This program is done by Chen, Haolin and Ren, Zejun.*/
/*The game will start when the player clicked on start button.*/
/*This program is a simple rock paper scissor game, but different from the 
original game, this game have more advance playing style. */
/*There are two phases that the player would enter, one is attack phase
and the other one is defense phase. */
/*The player will always start with attack phase, but if the player fail
his or her attack, then the phase turn to defense. */
/*Similar to attack phase changing, when the opponent fails it's attack,
the player would enter back to the attack phase*/
/*This game is meant to be click-only game, but we have also set up some
keys that will decrease player's hp, decrease opponent's hp, and changing
the phases*/
/*Those keys are capital P, O, A, and D. P will decrease player's hp, O will
decrease opponent's hp, A will change to attack phase, and D will change to
defense phase.*/
/*We hope that the player would enjoy this game.*/


/*variables declaration */
//enemy option
int playerOption;
int OppOption;
//bullet
float Bulletx= 430;
float OppBulletx= 660;
float Bdirection= 0;
//tanks
float tank1x= 0;
float tank2x= 1400;
float tank1spd= 0;
float tank2spd= 0;
//hp bars
float playerHealth = 100;
float OppHealth= 100;
float maxHealth = 100;
float rectWidth = 350;
float OppBarDown = 770;
//cloud
float cloud1X = 0;
float cloud1Y = 0;
float cloud2X = 800;
float cloud2Y = 25;
float cloudSpeed = 0.2;
float cloudSpeed1 = 0.3;
//winning and losing counts
int wincount=0;
int losecount=0;
String wintxt;
String losetxt;
//Win=1 Draw=2 Lose=3
int wdl=0;
//First round must be player round
boolean playerRound = true;
//list of booleans to set up in what condition the drawing will display or what condition to calculate
boolean startkey = false;
boolean atkSuc = false;
boolean defendSuc = false;
boolean ButtonClicked= false;
boolean selectOpen= false;
boolean drivein = false;
boolean arrived= false;
boolean clicked= false;
//declare classes variables
RockPaperScissor rps = new RockPaperScissor ();
background bg = new background ();
tank tk= new tank(tank1x, tank2x);
//pixel images naming
PImage Bullet, Spark, OppBullet, OppSpark, Barrier, OppBarrier, cloud1, cloud2, start, rock, paper, scissor, ufo;
   
void setup() {
  //load all the pixel images and set the frame rate to 30 and set the size to 1200x600
  background(#FFFFFF);
  Bullet = loadImage("Bullet.png");
  Spark = loadImage("Spark.png");
  OppBullet = loadImage("Opp Bullet.png");
  OppSpark = loadImage("Opp Spark.png");
  Barrier = loadImage("spr_shield.png");
  OppBarrier = loadImage("spr_shield.png");
  cloud1 = loadImage("cloud11.png");
  cloud2 = loadImage("cloud22.png");
  start= loadImage("start0.png");
  rock= loadImage("rock.png");
  paper= loadImage("paper.png");
  scissor= loadImage("scissor.png");
  ufo= loadImage("UFO.png");
  size(1200, 600);
  frameRate(30);
}
void draw() {
  background(#FFFFFF);
  //reset all the datas
  dataReset();
  //text of winning and losing count
  wintxt= "Wins: "+wincount;
  losetxt= "Loss: "+losecount;
  //malphite(mountain)'s body color
  bg1();
  //cliffs
  bg.leftClif();
  bg.rightClif();
  //rock paper scissor option displaying
  rps.display();
  
  //once the selection is not open then rps disappear
  if (!selectOpen) {
    background(#FFFFFF);
    bg1();
    bg.leftClif();
    bg.rightClif();
  }
  
  //once the tanks arrived then display the hp bars
  if (arrived) {
    //Player HP Bar
    playerHpBar();
    //Opponent HP Bar
    oppHpBar();
  }
  //tanks movement
  tank1x += tank1spd;
  tank2x += tank2spd;
  tk= new tank(tank1x, tank2x);
  
  //when the tank arrived to correct position
  if (tank1x == 500 && !arrived) {
    //the tanks will stop
    tank1spd= 0;
    tank2spd= 0;
    arrived=true;
    //the option will open
    selectOpen=true;
  }
  //tank drawings
  tk.tankbase();
  tk.color1();
  tk.tankbody();
  tk.tankcannon();
  tk.tank1();
  
  //if player haven't click on start key
  if (!startkey) {
    //the tanks will disappear
     background(#FFFFFF);
     bg1();
     bg.leftClif();
     bg.rightClif();
     start1();
     image(start, 507, 350, 200, 200);
     playerRound=true;
  }
  
  //the sky
  bg2();
  
  //text of phase status
  if (playerRound) {
    atkphase();
  }
  else {
    defphase();
  }
  
  //malphite's body structures
  bg.malphite();
  bg.malphiteline();
  //clouds
  cloudDisplay();
  
  //displaying the total numbers of win and lose counts
  fill(0);
  textSize(32);
  text(wintxt, 1070, 50);
  text(losetxt, 1070, 100);
  
  //bullets movement
  Bulletx= Bulletx+Bdirection;
  OppBulletx= OppBulletx+Bdirection;
  
  //once the bullet is out and when the bullet haven't reach to their opponent
  if (Bulletx < 800 && Bulletx >460 || OppBulletx >400 &&  OppBulletx < 660) {
    //if player choose rock, display image
    if (playerOption==1) {
      image(rock, 140, 210, 150, 150);
    }
    //if player choose paper, display image
    if (playerOption==2) {
      image(paper, 140, 210, 150, 150);
    }
    //if player choose scissor, display image
    if (playerOption==3) {
      image(scissor, 140, 210, 150, 150);
    }
    //if opponent choose rock, display image
    if (OppOption==1) {
      image(rock, 900, 210, 150, 150);
    }
    //if opponent choose paper, display image
    if (OppOption==2) {
      image(paper, 900, 210, 150, 150);
    }
    //if opponent chose scissor, display image
    if (OppOption==3) {
      image(scissor, 900, 210, 150, 150);
    }
  }
  
  //Player's attack phase
  if (Bulletx > 720) {
    //reset the bullet position
    bulletReset();
    //option will open again
    selectOpen=true;
    ButtonClicked = false;
    //if the attack fails then turn to opponent's atk phase
    if (wdl==3) {
      playerRound=false;
    }
    //if the attack success then opponent will lose health points 
    if (wdl==1) {
      OppHealth= OppHealth-25;
      OppBarDown= OppBarDown+87.5;
    }
  }
  
  //opponent's attack phase
  //when the bullet reach to the player
  if (OppBulletx < 380) {
    //reset the bullet position
    bulletReset();
    selectOpen=true;
    ButtonClicked = false;
    //if the attack fails then turn back to player atk phase
    if (wdl==1) {
      playerRound=true;
    }
    //if the attack success then player will lose health points
    if (wdl==3) {
      playerHealth = playerHealth-25;
    }
  }

  //upon clicking the button, the program will decide what pixel images would be drawn.
  if (ButtonClicked) {
    //when it is attack phase
    if (playerRound) {
      image (Spark, 405, 380, 50, 50);
      image (Bullet, Bulletx, 358, 100, 100);
      //malphite(mountain) will say certain things
      dialogBox();
      //bullet speed
      Bdirection = 10;
      //if player win
      if (wdl==1) {
        rps.wintxt();
      }
      //if player draw
      else if (wdl==2) {
        rps.drawtxt();
        image (OppBarrier, 770, 240, 350, 350);
      }
      //if player lose
      else {
        rps.losetxt();
        image (OppBarrier, 770, 240, 350, 350);
      }
    }
    //when it is defense phase
    else {
      image (OppSpark, 745, 380, 50, 50);
      image (OppBullet, OppBulletx, 355, 100, 100);
      //malphite(mountain) will say certain things
      dialogBox();
      Bdirection = -10;
      //if player win
      if (wdl==1) {
        rps.wintxt();
        image (Barrier, 75, 240, 350, 350);
      }
      //if player draw
      else if (wdl==2) {
        rps.drawtxt();
        image (Barrier, 75, 240, 350, 350);
      }
      //if player lose
      else {
        rps.losetxt();
      }
    }
  }
  //an ufo will follow player's mouse position
  image(ufo, mouseX, mouseY, 50, 50);
  
}

//reset the bullet location
void bulletReset() {
  Bulletx = 460;
  OppBulletx= 660;
  Bdirection= 0;
}

//player hp bar
void playerHpBar() {
  if (playerHealth < 25) {
    fill(255, 0, 0);
  }
  else if(playerHealth < 50){
    fill(255, 200, 0);
  }
  else {
    fill(0, 255, 0);
  }
  float drawWidth = (playerHealth / maxHealth) * rectWidth;
  rect(80, 330, drawWidth, 20);
  noFill();
  rect(80, 330, rectWidth, 20);
}

//opponent hp bar
void oppHpBar() {
  if (OppHealth < 25) {
    fill(255, 0, 0);
  }
  else if(OppHealth < 50){
    fill(255, 200, 0);
  }
  else {
    fill(0, 255, 0);
  }
  float dWidth = (OppHealth / maxHealth) * rectWidth;
  rect(OppBarDown, 330, dWidth, 20);
  noFill();
  rect(770, 330, rectWidth, 20);
}

//displaying the cloud, and movement
void cloudDisplay(){  
    image(cloud1, cloud1X,cloud1Y, 250, 130);
    image(cloud2, cloud2X, cloud2Y, 250, 130);
  
    cloud1X= cloud1X+cloudSpeed;
    cloud2X += cloudSpeed1*-1;
    
    if(cloud1X >= 300){
      cloudSpeed *= -1;
    }
    if(cloud1X <= -20){
      cloudSpeed *=-1;
    }
    if(cloud2X >= 950){
      cloudSpeed1 *= -1;
    }  
    if(cloud2X <= 550){
      cloudSpeed1 *=-1;
    }
  }
  
//start button
void start1() {
  fill(255);
  rect(525, 400, 150, 50, 20);
}

//dialog box
void dialogBox() {
  fill(255);
  beginShape();
  vertex(670, 185);
  vertex(630, 200);
  vertex(630, 190); //top line 
  vertex(500, 190); //leftline
  vertex(500, 270); //left line
  vertex(630, 270);
  vertex(630, 215); //endpoint?
  vertex(670, 185);
  endShape();
}

//text that display the current phase
void atkphase() {
  fill(255, 0, 0);
  textAlign(CENTER);
  text("Attack Phase", 600, 50);
}
void defphase() {
  fill(255, 0, 0);
  textAlign(CENTER);
  text("Defense Phase", 600, 50);
}

//reset data once player or oppnenet hp reach to 0
void dataReset() {
  if (playerHealth==0) {
    losecount++;
    startkey=false;
    drivein=false;
    selectOpen=false;
    arrived=false;
    tank1x=0;
    tank2x=1400;
    playerHealth= 100;
    OppHealth= 100;
    OppBarDown= 770;
  }
  if (OppHealth==0) {
    wincount++;
    startkey=false;
    drivein=false;
    selectOpen=false;
    arrived=false;
    tank1x=0;
    tank2x=1400;
    playerHealth= 100;
    OppHealth= 100;
    OppBarDown= 770;
  }
}

//test mode, also called hack mode
void keyPressed() {
  if (key=='P') {
    playerHealth -=25;
  }
  if (key=='O') {
    OppHealth -=25;
  }
  if (key=='A') {
    playerRound=true;
  }
  if (key=='D') {
    playerRound=false;
  }
}

void mouseClicked () {
  //start button
  if (!startkey) {
    if (mouseX>525 && mouseX<675 && mouseY>400 &&mouseY<450) {
      startkey=true;
      drivein= true;
      tank1spd = 10;
      tank2spd = -10;
    }
  }
  
  //when player click rock button
  if (mouseX>70 &&mouseX<160 &&mouseY> 540 &&mouseY<580 && selectOpen) {
    OppOption= rps.result();
    playerOption= 1;
    wdl= rps.userRock(OppOption);
    ButtonClicked=true;
    selectOpen=false;
  }
  //when player click paper button
  if (mouseX>170 &&mouseX<270 &&mouseY> 540 &&mouseY<580 && selectOpen) {
    OppOption= rps.result();
    playerOption= 2;
    wdl= rps.userPaper(OppOption);
    ButtonClicked=true;
    selectOpen=false;
  }
  //when player click scissor button
  if (mouseX>280 &&mouseX<390 &&mouseY> 540 &&mouseY<580 && selectOpen) {
    OppOption= rps.result();
    playerOption= 3;
    wdl= rps.userScissor(OppOption);
    ButtonClicked=true;
    selectOpen=false;
  }
}
