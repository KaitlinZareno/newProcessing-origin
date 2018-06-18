void setup(){
  size(500,500);
}

void draw(){
  background(255);
  for (int count =0;count <9; count++)
  {
    line(count*10,0,count*10,height);
    line(0,count*10,width,count*10);
  }
  ellipse(mouseX,mouseY,20,20);
  
  translate(mouseX-200,mouseY-100);
  
 for (int c=0; c<5;c++)
 {
  for (int i = 0; i<5;i++)
  {
  translate(75,0);
  myRobot();
  //translate(75,0);
  }
  translate(-375,200);
}
}

void myRobot(){
  pushMatrix();
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
  popMatrix(); 
}