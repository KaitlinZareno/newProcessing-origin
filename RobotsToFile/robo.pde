
class myRobo
{
  int roboW = 190;  
  int roboH = 0;// Width and Height of the robot
  float xpos,ypos;  
  
  float xspeed = random(10);  // Speed of the shape
  float yspeed = random(10);  // Speed of the shape
  
  int xdirection = 1;  // Left or Right
  int ydirection = 1; 
  
  
  myRobo(float xp, float yp)
  {
     xpos = xp;
     ypos= yp;
  }
  

    void move() 
  {
    //  background(102); --> THIS WAS THE BUG _ HIDING THE OTHER ONE

    // Update the position of the shape
    
    xpos = xpos + ( xspeed * xdirection );
    ypos = ypos + ( yspeed * ydirection );
    
    // Test to see if the shape exceeds the boundaries of the screen
    // If it does, reverse its direction by multiplying by -1
    if (xpos > width*4+roboW || xpos <=0) {
      // its not going all the way why tho
      xdirection *= -1;
    }
    if (ypos > height*4 -roboH|| ypos <=0) {
      ydirection *= -1;
    }

  }
  
  void render()
  {
    pushMatrix();
    scale(.2);
    myRobot(xpos, ypos);
    scale(5);
    popMatrix();
  }
  
  void myRobot(float xpos, float ypos)
  {

    fill(250);
    stroke(0,0,0);
    
    // front wheels
    {
      fill(70);
      ellipse(xpos+250,ypos+290,35,35);
      ellipse(xpos+350,ypos+290,35,35);
      ellipse(xpos+410,ypos+290,35,35);
    }
    
    //back
    {
      stroke(120);
      strokeWeight(64);
      line(xpos+462,ypos+195,xpos+387,ypos+248);  
      strokeWeight(1);
      fill(150);
      ellipse(xpos+465,ypos+192,60,60);
    }
    
    strokeWeight(1);
    {//body
      stroke(0);
      fill(217);
      rect(xpos+200,ypos+200,200,80);
      fill(70);
      rect(xpos+210,ypos+210,60,60);
      fill(120);
      rect(xpos+290,ypos+210,100,60);
    }
    
    {// back wheels
      fill(70);
      ellipse(xpos+200,ypos+320,40,40);
      ellipse(xpos+310,ypos+320,40,40);
      ellipse(xpos+380,ypos+320,40,40);
      strokeWeight(1);
     }
     
     {//joints
      stroke(0);
      strokeWeight(7);
      line(xpos+200,ypos+300,xpos+277,ypos+274);
      line(xpos+277,ypos+274,xpos+379,ypos+300);
      line(xpos+311,ypos+300,xpos+346,ypos+293);
      line(xpos+197,ypos+221,xpos+136,ypos+260);
      line(xpos+70,ypos+210,xpos+136,ypos+260);
    }
    strokeWeight(1);
    
    {// rear camera 
      fill(250);
      rect(xpos+50,ypos+190,40,20);
      fill(20);
      rect(xpos+90,ypos+195,10,10);
      ellipse(xpos+70,ypos+200,10,10);
      fill(220);
      rect(xpos+40,ypos+195,10,10);
       
      strokeWeight(1);
   }
   
   //top
   {
     rect(xpos+272,ypos+116,15,84);
     rect(xpos+253,ypos+78,50,50);   
   }
   
   //solar panels
   {
     stroke(0);
     strokeWeight(10);
     line(xpos+255,ypos+195,xpos+231,ypos+175);
     line(xpos+225,ypos+195,xpos+201,ypos+175);
     strokeWeight(1);
   }
   //scale(5);
  }
  
  
  float getX()
  {
    return xpos;
  }
  
  float getY()
  {
    return ypos;
    //turns out the glitch was that i was using xpos in getY 
  }
  
}