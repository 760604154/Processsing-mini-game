//drawing corrodinate for both tanks
class tank {
  float startX = 900;
  float startY = 500;
  float tankX = 500;
  float tankY = 500;
  
  tank (float tankx, float startx) {
    startX= startx;
    tankX= tankx;
  }
  void tankbase(){
    //base botten line
    stroke(0);
    fill(240,175,46);
    line(startX, startY, startX+150,startY);
    //base left line
    line(startX, startY, startX-40, startY-40);
    //base right line
    line(startX+150, startY, startX+195, startY-50);
    
    //base right curve
    curve(startX+175, startY-45, startX+195, startY-50, startX+185, startY-70, startX+175, startY-55); 
    //base top line
    line(startX+185, startY-70, startX, startY-65);
    //base left curve
    curve(startX+45, startY-50, startX, startY-65, startX-40, startY-40, startX-25, startY-25);
}

  void color1(){
    fill(240,175,46);
    noStroke();
    //base color fill lower level
    quad(startX-40, startY-40, startX, startY,startX+150, startY,startX+195, startY-50);
    //base color fill upper level
    quad(startX+195, startY-49,startX+185, startY-69,startX, startY-64,startX-40, startY-39);
}
  
  void tankbody(){
    //player's tank body
    stroke(0);
    fill(240,175,46);
    beginShape();
    vertex(startX+150,startY-69);
    vertex(startX+165,startY-90);
    vertex(startX+160,startY-130);
    vertex(startX+50,startY-125);
    vertex(startX+10,startY-65);
    endShape();
  }

  void tankcannon(){
    //player's tank cannon
    stroke(0);
    fill(240,175,46);
    beginShape();
    vertex(startX+39,startY-110);
    vertex(startX-110,startY-100);
    vertex(startX-110, startY-90);
    vertex(startX+25,startY-90);
    endShape();
  }
  
  
  //tank1
  void tank1(){
    //tank1 cannon
    stroke(0);
    line(tankX-90, tankY-100,tankX-90, tankY-90);
    fill(240,175,46);
    beginShape();
    vertex(tankX-90,tankY-100);
    vertex(tankX-239, tankY-110);
    vertex(tankX-225,tankY-90);
    vertex(tankX-90,tankY-90);
    endShape();
  
    //tannk body
    stroke(0);
    line(tankX-250,tankY-125,tankX-210,tankY-65);
    fill(240,175,46);
    beginShape();
    vertex(tankX-210, tankY-65);
    vertex(tankX-350, tankY-69);
    vertex(tankX-365, tankY-90);
    vertex(tankX-360, tankY-130);
    vertex(tankX-250, tankY-125);
    endShape();
  
    //tank base
    noStroke();
    beginShape();
    vertex(tankX-200,tankY);
    vertex(tankX-350,tankY);
    vertex(tankX-395,tankY-50);
    vertex(tankX-160, tankY-40);
    endShape();
  
    //tank curve
    stroke(0);
    curve(tankX-375,tankY-45,tankX-395,tankY-50,tankX-385,tankY-70,tankX-375,tankY-55);
    curve(tankX-245,tankY-50,tankX-200,tankY-65,tankX-160,tankY-40,tankX-175,tankY-25);
  
    //tank top base
    noStroke();
    beginShape();
    vertex(tankX-395,tankY-50);
    vertex(tankX-385,tankY-70);
    vertex(tankX-200,tankY-65);
    vertex(tankX-160,tankY-40);
    vertex(tankX-200,tankY);
    endShape();
  
    stroke(0);
    //tanktop line
    line(tankX-200,tankY-65,tankX-385,tankY-70);
    //tankbot line
    line(tankX-160,tankY-40,tankX-200,tankY);
    line(tankX-200,tankY,tankX-350,tankY);
    line(tankX-350,tankY,tankX-395,tankY-50);
  } 

}
