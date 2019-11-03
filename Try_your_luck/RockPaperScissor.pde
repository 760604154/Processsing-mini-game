//this class will display text, display options, and some method will 
//return a number determine whether the user win, draw, or lose
//1 as win, 2 as draw, and 3 as lose
class RockPaperScissor {
  //generate a random number from 1 to 3
  //1 as rock, 2 as paper, 3 as scissor
  int result() {
    int x= int(random(1,4));
    return x;
  }
  
  //when user choose rock and the method will return a number whether is win lose or draw
  int userRock(int x) {
    //draw
    if (x==1) {
      System.out.println ("Draw");
      return 2;
    }
    //lose
    else if (x==2) {
      System.out.println ("You Lose");
      return 3;
    }
    //win
    else {
      System.out.println ("You Win");
      return 1;
    }
  }
  //when user choose paper and the method will return a number whether is win lose or draw
  int userPaper(int x) {
    //win
    if (x==1) {
      System.out.println ("You Win");
      return 1;
    }
    //draw
    else if (x==2) {
      System.out.println ("Draw");
      return 2;
    }
    //lose
    else {
      System.out.println ("You Lose");
      return 3;
    }
  }
  //when user choose scissor and the method will return a number whether is win lose or draw
  int userScissor(int x) {
    //lose
    if (x==1) {
      System.out.println ("You Lose");
      return 3;
    }
    //win
    else if (x==2) {
      System.out.println ("You Win");
      return 1;
    }
    //draw
    else {
      System.out.println ("Draw");
      return 2;
    }
  }
  
  //display all the options that user can choose
  void display() {
    fill(255);
    rect(70, 540, 90, 40, 10);
    rect(170, 540, 100, 40, 10);
    rect(280, 540, 110, 40, 10);
    fill(100);
    textSize (32);
    textAlign(BASELINE);
    text("Rock", 80, 570);
    textSize(30);
    textAlign(BASELINE);
    text("Paper", 180, 570);
    textSize(27);
    textAlign(BASELINE);
    text("Scissor", 290, 570);
  }
  
  //the winning text
  void wintxt() {
    fill(255, 0, 0);
    textAlign(CENTER);
    text("You", 560, 225);
    text("Win", 560, 250);
  }
  //the losing text
  void losetxt() {
    fill(#d3d3d3);
    textAlign(CENTER);
    text("You", 560, 225);
    text("Lose", 560, 250);
  }
  //the draw text
  void drawtxt() {
    fill(0);
    textAlign(CENTER);
    text("Draw", 560, 240);
  }
}
