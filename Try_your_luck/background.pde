//this class is drawing corrdinate for background image
class background {
  //image for left clif
  void leftClif(){
    fill(129,69,23);
    stroke(0);
    beginShape();
    vertex(0, 500);
    vertex(85, 504);
    vertex(100, 499);
    vertex(145, 502);
    vertex(193, 509);
    vertex(221, 503);
    vertex(254, 498);
    vertex(263, 495);
    vertex(268, 497);
    vertex(300, 500);
    vertex(342, 510);
    vertex(355, 503);
    //right line
    vertex(394, 493);
    vertex(458, 518);
    vertex(467, 526);
    vertex(456, 575);
    vertex(459, 600);
    vertex(0, 600); 
    endShape();
  }
//image for right clif
  void rightClif() {
    fill(129,69,23);
    stroke(0);
    beginShape();
    vertex(1200, 500);
    vertex(1164, 498);
    vertex(1128, 509);
    vertex(1092, 500);
    vertex(1078, 499);
    vertex(1065, 505);
    vertex(1012, 498);
    vertex(983, 501);
    vertex(953, 498);
    vertex(889, 507);
    vertex(832, 502);
    vertex(785, 498);
    vertex(761, 502);
    vertex(749, 509);
    //left line
    vertex(738, 523);
    vertex(745, 573);
    vertex(742, 600);
    vertex(1200, 600);
    endShape();
  }

//a quad image for Maphite's face
  void malphite(){
    noStroke();
    fill(199,229,201);
    quad(400,187,640,350,1100, 220,700,100);
    
  }
//triangle line across the screen
  void malphiteline(){
    stroke(0);
    line(0,300,700, 100);
    line(700,100,1200,250);
    fill(0);
    ellipse(670, 150, 20, 20);
    ellipse(730, 158, 20, 20);
    line(675, 170, 715, 175);
    curve(725,50,675,170,715,175,693,50);
  }
}

//body color for malphite
void bg1(){
  fill(200);
  beginShape();
  vertex(0,300);
  vertex(700,100);
  vertex(1200,250);
  vertex(1200, 600);
  vertex(0,600);
  endShape();
}
//sky color
void bg2(){
  fill(137,246, 255);
  beginShape();
  vertex(0,300);
  vertex(700,100);
  vertex(1200,250);
  vertex(1200, 0);
  vertex(0,0);
  endShape();
}
