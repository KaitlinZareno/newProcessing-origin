myRobo[] rob= new myRobo[20];
myRobo rB;

float sX;
float sY;

float x;
float y;

//ArrayList <Float> xPos; 
//ArrayList <Float> yPos; 

//2d arrays -- 20 columns (1 for each robot) & "unlimited" rows
float[][] xPositions;
float[][] yPositions;
int ro =650;
int col = 20;
int tCount = 0;

int count; // make it so that if there is nothing in count, program stops
int height1 = 400;
int width1 = 700;
int colCount = 0;
int rowStart = 0;



void setup() {
  //noStroke();
 // frameRate(30);
  size(700, 400);
  //rB = new myRobo(sX, sY);
  //xPos = new ArrayList<Float>();
  //yPos = new ArrayList<Float>();

  xPositions = new float[ro][col];
  yPositions = new float[ro][col];
  
  for (int i=0;i<20;i++){
  rob[i] = new myRobo (xPositions[0][i], yPositions[0][i]);
  }

  count = 0;
  parseFile();
}

void parseFile() { // fill an array ; array = global variable ; use array in draw
  // Open the file from the createWriter() example
  BufferedReader reader = createReader("RoboPositions4.txt");
  String line = null;
  try {
    while ((line = reader.readLine()) != null) {
      String[] pieces = split(line, 't');
      // t is the separating value
     
       x = float(pieces[0]);
       y = float(pieces[1]);
 
      
     // rB.relocate(x,y);
      //rB.render(); // make robot move by changing its x+y positions constantly
     

      if (count < ro){
        xPositions [count][colCount] = x; // cuz of scale glitch
        yPositions  [count][colCount] = y;
        
        println(x + " & " + y + " & count:" + count + "colCount:" + colCount + " & xPos:"
      + xPositions[count][colCount] + " & yPos:" + yPositions[count][colCount]);
      
        
        colCount++; 
        // is essentially "t count"
        
        if (colCount == 20) // rows 1-20 (which is 20 elements)
        {
          colCount=0; // set the x value into robo0 (next set of values)
          count++; // increase the row number
        }    
      }
      
    }
    reader.close();
  } catch (IOException e) {
    e.printStackTrace();
  }
}

int start =0;

void draw()
{
  background(102);
 
  //rB.render();
  
  if(start < count){
  for (int i=0; i<20; i++){
  rob[i].render();
  rob[i].relocate(xPositions[start+1][rowStart],yPositions[start+1][rowStart]);
  //rB.render();
  //println(xPositions[start] + " and " + yPositions[start]);
    
  rowStart++;

    if (rowStart == 20){ // rows 1-20 (20 elements)
      rowStart = 0;
      start++;
    }
  }
  }
    
   else{
     println("end");
     count = 0;
     exit();
   }
  // increment value ex) recording count increases every time it goes through draw
  // recording count is less than the array of x and y values
}