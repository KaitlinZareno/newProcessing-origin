int moveBotX = 0;
float rotateBot = 0;

void setup()
{
  size (1000,1000);
  moveBotX = 0;
  rotateBot =0;
}

void draw()
{
  moveBotX = moveBotX+1;
  //rotateBot = moveBotX -.95;
  
  translate (moveBotX,300); 
  // moves the rotate horizontally accross the screen
  rotate(radians(moveBotX));
  translate(-300,-250);
  // reset origin of robot to the center of the robot 
   
   if (moveBotX+200/3 >= 1200)
   {
     moveBotX = 0;
   }

  background(250);
  
  fill(250);
  stroke(0,0,0);
  {// front wheels
    fill(70);
    ellipse(250,290,35,35);
    ellipse(350,290,35,35);
    ellipse(410,290,35,35);
  }
  
  //back
  {
    stroke(120);
    strokeWeight(64);
    line(462,195,387,248);  
    strokeWeight(1);
    fill(150);
    ellipse(465,192,60,60);
  }
  
  strokeWeight(1);
  {//body
    stroke(0);
    fill(217);
    rect(200,200,200,80);
    fill(70);
    rect(210,210,60,60);
    fill(120);
    rect(290,210,100,60);
  }
  {// back wheels
    fill(70);
    ellipse(200,320,40,40);
    ellipse(310,320,40,40);
    ellipse(380,320,40,40);
    strokeWeight(1);
   }
  {//joints
    stroke(0);
    strokeWeight(7);
    line(200,300,277,274);
    line(277,274,379,300);
    line(311,300,346,293);
    line(197,221,136,260);
    line(70,210,136,260);
  }
  strokeWeight(1);
 {// rear camera 
    fill(250);
    rect(50,190,40,20);
    fill(20);
    rect(90,195,10,10);
    ellipse(70,200,10,10);
    fill(220);
    rect(40,195,10,10);
     
     strokeWeight(1);
 }
 
 //top
 {
   rect(272,116,15,84);
   rect(253,78,50,50);
   
 }
 
 //solar panels
 {
   stroke(0);
   strokeWeight(10);
   line(255,195,231,175);
   line(225,195,201,175);
   strokeWeight(1);
 }  
}