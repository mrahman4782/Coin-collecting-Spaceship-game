boolean gamestart = false;
int startx = 100;
int starty = 50;
int startz = 32;
int startclick = 0;
int customization;
int xpos;
int ypos;
float b;
float moverate = 1;
boolean coinactive = true;
int score = 0;
int obstacle1posX = 70;
int obstacle1posY = 600;
boolean obstacle1moveway = true;
int obstacle2posX = 890;
int obstacle2posY = 70;
boolean obstacle2moveway = true;
int obstacle3posX1 = 890;
int obstacle3posX2 = 920;
int obstacle3posX3 = 920;
int obstacle3posY1 = 540;
int obstacle3posY2 = 520;
int obstacle3posY3 = 560;
boolean obstacle3moveway = true;
int obstacle4posX = 850;
int obstacle4posY = 200;
boolean obstacle4moveway = true;
int obstacle5posX = 50;
int obstacle5posY = 300;
boolean obstacle5moveway = true;
boolean gameend = false;
void setup()
{
 
  size(900, 700);
}
void draw()
{
  println(mouseX, mouseY);
  background(#f8fcda );
  startbutton();
  coingenerator();
  mousecursor();
  obstacles();
  gameborders();
  gameoveractivate();
  gameend();
 
}
void startbutton()
{
  if (gamestart == false)
  {
  fill(#98dfea);
  rect(400,300, startx, starty,40);
  textSize(startz);
  fill(#25283d);
  text("Start", 414, 340);
 
  }
  if (gamestart == true)
  {
   startx = 0;
   starty = 0;
   startz = 1;
   redraw();
   fill(255);
   rect(400,300, startx, starty,40);
   textSize(startz);
   fill(255);
   text("Start", 414, 340);
  
  }
}
void mouseClicked() {
  if (mouseX>400 && mouseX<500 && mouseY>300 && mouseY<350)
  {
  gamestart = true;
  
  }
  if (mouseX>760 && mouseX<800 && mouseY>140 && mouseY<180)
  {
  customization = #fc7753;
  
  }
  if (mouseX>830 && mouseX<870 && mouseY>140 && mouseY<180)
  {
  customization = #FFE30D;
  
  }
   if (mouseX>760 && mouseX<800 && mouseY>240 && mouseY<280)
  {
  customization = #E0391B;
  
  }
   if (mouseX>830 && mouseX<870 && mouseY>240 && mouseY<280)
  {
  customization = #057CF7;
  
  }
  if (mouseX > 170 && mouseX < 730 && mouseY > 0 && mouseY < 700)
  {
  if (gameend == true)
  {
    gameend = false;
    gamestart = true;
    score = 0;
  }
  }
}
void mousecursor()
{
  if (gamestart == true && gameend == false)
  {
  fill(50);
  ellipse(mouseX,mouseY,50,50);
  fill(customization);
  ellipse(mouseX,mouseY,14,14);
  ellipse(mouseX,mouseY+25,8,8);
  ellipse(mouseX,mouseY-25,8,8);
  ellipse(mouseX+25,mouseY,8,8);
  ellipse(mouseX-25,mouseY,8,8);
  fill(155);
  rect(mouseX+10,mouseY-3,6,6);
  rect(mouseX-16,mouseY-3,6,6);
  }
  // Creates the controllable spaceship
}
void gameborders()
{
  stroke(40);
  line(170,0,170,700);
  stroke(40);
  line(730,0,730,700);
  fill(#07beb8);
  rect(0,0,170,700);
  rect(730,0,170,700);
  fill(255);
  textSize(28);
  text("Customize", 745,100);
  fill(255);
  ellipse(780,160,50,50);
  ellipse(850,160,50,50);
  ellipse(780,260,50,50);
  ellipse(850,260,50,50);
  fill(#fc7753);
  ellipse(780.5,160,40,40);
  fill(#FFE30D);
  ellipse(850.5,160,40,40);
  fill(#E0391B);
  ellipse(780.5,260,40,40);
  fill(#057CF7);
  ellipse(850.5,260,40,40);
  fill(255);
  text("Score:", 45, 100);
  textSize(45);
  text(score,65, 200);
  fill(#F9FA17);
  textSize(18);
  text("Collect the coins!",10,500);
  
  // Sets the playable game screen
}
 
void coingenerator()
{
  if(gamestart == true && gameend == false)
  {
  position();
  coin(xpos,ypos);
  coinactive = false;
  if(mouseX < xpos+20 && mouseX > xpos-20 && mouseY < ypos+20 && mouseY > ypos-20)
  {
  score = score + 1;
  coinactive = true;
  
  }
 
  }
 
}
void coin(float x, float y)
{
  fill (255, 215, 0);
  ellipse(x,y,25,25);
  fill (255, 217, 0);
  ellipse(x,y,28,28);
  fill(35);
  line(x,y-5,x,y+5);
  
  // Randomly generate coins
}
void position()
{
  if(coinactive == true)
  {
  xpos = int(random(180,720));
  ypos = int(random(50,650));
  }
}
void obstacles()
{
   obstacle1();
   obstacle2();
   obstacle3();
   obstacle4();
   obstacle5();
   
   // Activate all obstacles
}
void obstacle1()
{
  fill(134);
   ellipse(obstacle1posX,obstacle1posY,50,50);
   fill(#46FFF1);
   ellipse(obstacle1posX-12,obstacle1posY+8,10,10);
   ellipse(obstacle1posX+5,obstacle1posY-9,10,10);
   ellipse(obstacle1posX+9,obstacle1posY+12,10,10);
   if (obstacle1moveway == true)
   {
   obstacle1posY = obstacle1posY - score;
   obstacle1posX = obstacle1posX + score;
   if (obstacle1posY<-50)
   {
     obstacle1moveway = false;
   }
   }
   if (obstacle1moveway == false)
   {
   obstacle1posY = obstacle1posY + score;
   obstacle1posX = obstacle1posX - score;
   if (obstacle1posY>950)
   {
     obstacle1moveway = true;
     
   }
   }
}
void obstacle2()
{
  fill(#E3223F);
  ellipse(obstacle2posX,obstacle2posY,20,20);
  if (obstacle1moveway == true)
   {
   obstacle2posX = obstacle2posX - (score/2);
   if (obstacle2posX<-20)
   {
     obstacle2moveway = false;
   }
   }
   if (obstacle2moveway == false)
   {
   obstacle2posX = obstacle2posX + (score/2);
   if (obstacle2posX>970)
   {
     obstacle2moveway = true;
   }
   }
}
void obstacle3()
{
  if(gamestart == true)
  {
  fill(#752E8B);
  triangle(obstacle3posX1,obstacle3posY1,obstacle3posX2,obstacle3posY2,obstacle3posX3,obstacle3posY3);
  if (obstacle3moveway == true)
  {
  obstacle3posX1 = obstacle3posX1 - 14;
  obstacle3posX2 = obstacle3posX2 - 14;
  obstacle3posX3 = obstacle3posX3 - 14;
  obstacle3posY1 = obstacle3posY1 - 3;
  obstacle3posY2 = obstacle3posY2 - 3;
  obstacle3posY3 = obstacle3posY3 - 3;
  if (obstacle3posX1 < 100)
  {
    obstacle3moveway = false;
  }
  }
   if (obstacle3moveway == false)
  {
  obstacle3posX1 = obstacle3posX1 + 14;
  obstacle3posX2 = obstacle3posX2 + 14;
  obstacle3posX3 = obstacle3posX3 + 14;
  obstacle3posY1 = obstacle3posY1 + 3;
  obstacle3posY2 = obstacle3posY2 + 3;
  obstacle3posY3 = obstacle3posY3 + 3;
  if (obstacle3posX1 > 700)
  {
    obstacle3moveway = true;
    
  }
  }
  }
}
void obstacle4()
{
  if (gamestart == true)
  {
  fill(#6F48F5);
  ellipse(obstacle4posX,obstacle4posY,32,32);
  if (obstacle4moveway == true)
  {
  obstacle4posX = obstacle4posX - 2;
  obstacle4posY = obstacle4posY + 1;
  if (obstacle4posX < -34)
  {
    obstacle4moveway = false;
  }
  }
  if (obstacle4moveway == false)
  {
  obstacle4posX = obstacle4posX + 2;
  obstacle4posY = obstacle4posX - 1;
  if (obstacle4posX > 950)
  {
    obstacle4moveway = true;
  }
  }
  }
}
void obstacle5()
{
  fill(22);
  if (gamestart == true)
  {
  rect(obstacle5posX,obstacle5posY,100,40);
  if (score == 13)
  {
 
    if (obstacle5moveway == true)
    {
      obstacle5posX = obstacle5posX + 40;
      if (obstacle5posX > 800)
      {
        obstacle5moveway = false;
      }
    }
   
  }
  }
  if (gameend == true)
  {
  obstacle5posX = 50;
  obstacle5posY = 300;
  }
}

void gameoveractivate()
{
  if (gamestart == true)
  {
  if (mouseX > obstacle1posX - 48 && mouseX < obstacle1posX + 48 && mouseY > obstacle1posY - 48 && mouseY < obstacle1posY + 48  )
  {
  gameend = true;
  }
  if (mouseX > obstacle2posX - 31 && mouseX < obstacle2posX + 31 && mouseY > obstacle2posY - 31 && mouseY < obstacle2posY + 31)
  {
  gameend = true;
  }
  if ( mouseX > obstacle3posX1 + 23 && mouseX < obstacle3posX1 - 23 && mouseY > obstacle3posY1 - 23 && mouseY < obstacle3posY1 + 23)
  {
  gameend = true;
  }
  if (mouseX > obstacle3posX2 - 23 && mouseX < obstacle3posX2 + 23 &&  mouseY > obstacle3posY2 - 23 && mouseY < obstacle3posY2 + 23)
  {
  gameend = true;
  }
  if (mouseX > obstacle3posX3 - 23 && mouseX < obstacle3posX3 + 23 && mouseY > obstacle3posY3 - 23 && mouseY < obstacle3posY3 + 23 )
  {
  gameend = true;
  }
  if (mouseX > obstacle4posX - 41 && mouseX < obstacle4posX + 41 && mouseY > obstacle4posY - 41 && mouseY < obstacle4posY + 41 || mouseX < 170)
  {
  gameend = true;
  }
  if (mouseX > obstacle5posX - 23 && mouseX < obstacle5posX + 123 && mouseY > obstacle5posY - 23 && mouseY < obstacle5posY + 63 || mouseX > 730){
  gameend = true;
  }
  }
  // Kill player and end the game when they come in contact with and obstacle or leave the gamescreen
}
void gameend()
{
  if (gameend == true)
  {
  fill(#f8fcda);
  rect(170,0,560,700);
  textSize(50);
  fill(65);
  text("Gameover", 330, 200);
  textSize(24);
  text("Your score is:", 370, 280);
  finalscore();
  fill(#5A0815);
  textSize(24);
  text("Click to restart", 369, 500);
  }
  // Final message
}
void finalscore()
{
  int fin = score;
  textSize(50);
  fill(65);
  text(fin, 427, 370);
}
