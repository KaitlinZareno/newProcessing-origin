float roboX;
float roboY;
float speedX;
float speedY;

int screenSizeW;
int screenSizeH;

int rH;
;

//class robo
//{
//  float roboX=1;
//  float roboY=1;
//  float speedX=0.05;
//  float speedY=0.05;
  
//  int screenSizeW=500;
//  int screenSizeH=500;
//}

class Robo
// need parameters? maybe just set as random in each move -- may not need params
{
  //float rX = ;
  //float rY;
  //float sX;
  //float sY;
  
  //int screenSizeW=500;
  //int screenSizeH=500;
  
  //float dX;  // Left or Right
  //float dY;  // Top to Bottom
    
  //int rH;
  //int rW;
  
   float rX; // initial x & Y positions are randomly generated
   float rY;
   float sX = random(1);  // initial x & y speeds are randomly generated
   float sY = random(1);
    
   float dX = 1;  // Left or Right
   float dY = 1;  // Top to Bottom
    
   int rH = 10;
   int rW=10;

  
  void move() // need params for move ?? 
  {
    //make random generators for roboX, roboY, speedX, and speedY
    // move robot to new location at a certain speed  
    
     //rX = random(490); // initial x & Y positions are randomly generated
     //rY = random(490);
     sX = 5;//random(1);  // initial x & y speeds are randomly generated
     sY = 5;//random(1);
    
     dX = 10;  // Left or Right
     dY = 10;  // Top to Bottom
    
     //rH = 10;
     //rW=10;

    rX = random(490);
    rY = random(490);
    
    rX = rX + (sX * dX);
    rY = rY + (sY*dY);
    
    // NEED test to see how wide robot is (will change "10")
    if(rX > 500-rH || rX <=0) // left side and right side of screen
    {
      dX *=-1;
    }
    
    // NEED test to see how tall robot is (will change "10")
    if (rY > 500-rW || rY <=0)
    {
      dY *=-1;
    }
    
    render(); // create robot
  }
  
  
  void render()
  {
    scale(.25);
    myRobot(sX, sY);
    scale(4);
  }
  
  void myRobot(float sX,float sY)
  {
    pushMatrix();
    background(250,250);
    stroke(0,0,0);
    {// front wheels
      fill(70);
      ellipse(sX+250,sY+290,35,35);
      ellipse(sX+350,sY+290,35,35);
      ellipse(sX+410,sY+290,35,35);
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
    popMatrix(); 
  //}

}
}