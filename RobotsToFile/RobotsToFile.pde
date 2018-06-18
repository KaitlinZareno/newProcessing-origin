PrintWriter output;

myRobo rob[];
//Float sX; // starting x and y positions
//Float sY;

myRobo robo;
myRobo myrob;
//myRobo rob2;

myRobo rB;
float sX;
float sY;
//FIND WAY TO REPLICATE ROBOTS

int count;

void setup() 
{
  size(700, 400);
  noStroke();
  frameRate(30);
  // Set the starting position of the shape
  
  //make 20 robots and set to random x and ys
   rob = new myRobo[20];
   for (int i=0; i<rob.length;i++)
   {
     rob[i] = new myRobo (4*random(width),4*random(height));
   }
   
   //myrob = new myRobo(random(500),random(500));
   //robo = new myRobo(5,5);
   
   rB = new myRobo(4*random(width),4*random(height));
   output = createWriter("../RobotsCreateReader/RoboPositions5.txt"); 
   // path ".. to go back a level (roboToFile --> processing folder) /
   // RobotsCreateReader (put file in createReader / name of text 

}

void draw()
{
  background(102);
  
    
 for (int i=0; i< rob.length;i++)
 {
   rob[i].move();
   //rob[i].getX();
   //rob[i].get(y);
   rob[i].render();
   
   sX= rob[i].getX();
   sY= rob[i].getY();
   
   output.println(sX + "t" + sY);
   println(sX + "t" + sY);
   count++;
   
   //if (count ==20)
   //{
   //  output.println("set");
   //  count = 0;
   //}
 }
  
  //sX = rB.getX();
  //sY = rB.getY();
  
  //rB.move();
  //rB.render();
  
  //output.println(sX + "t" + sY);
 
  
 //for (int i=0; i< rob.length;i++)
 //{
 //  rob[i].move();
 //  rob[i].render();
 //}
}

void keyPressed() {
  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file
  exit(); // Stops the program
}