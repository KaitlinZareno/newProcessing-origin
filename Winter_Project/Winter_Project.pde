Robo myRobo;

void setup()
{
  screenSizeW = 500;
  screenSizeH=500;
  size(500,500);  
  noStroke();
  myRobo = new Robo();
 // background (250,250);
 frameRate(10);
}


void draw()
{
  //create different robots with different starting positions
  //for (int i=0; i<2;i++){
    myRobo.render();
    myRobo.move();
    myRobo.render();
    
  //}
  
}