import processing.serial.*;
import org.firmata.*;
import cc.arduino.*;

int[][][] positionsToFile = new int[360][11][2];// 11 columns (test with 3 for now)
int servoPin7 = 7;
int servoPin4 = 4;
int numServo=1;
// change this line depending on the number of servos u have


int angle;
int count;
int colCount;
int record;
int col = 0;
Arduino demon;

void setup() {
  //size(360,50);
  //hard code so wherever mouse goes = angle of rotation
  // ex mouse in middle of screen (90), = servo rotation of 90 degrees
  frameRate(60);
  
  println(Arduino.list());
  demon = new Arduino(this,"/dev/tty.usbmodem1411", 57600);
  demon.pinMode(servoPin, Arduino.SERVO);
  // just initializing the servo and arduino to play back angles
  record = 0;
  count=0;
  colCount =0;
  
  for (int c =0; c<11;c++){
    for(int a=0;a<2;a++){
      for(int r=0;r<360;r++){
        positionsToFile[r][c][a] = 0;
      }
    }
  }
  
  parseFile();
}

void parseFile() { // essentially "read" function
  // fill an array ; array = global variable ; use array in draw
  // Open the file from the ServoArraystoFile() example (open ServoAngles1.txt)
  
  
  for (int i=0;i<4;i++){ 
    // WHERE YOU CHANGE THE # OF TXT FILES -- WILL CHANGE TO 11
    
  BufferedReader reader = createReader("ServoAngles" + i + ".txt"); //change to gestures
  //reads servoAngls i used to incriment text  to get values
  
  String line = null;
  try {
    while ((line = reader.readLine()) != null) {
  // while there are lines to be read in the file, var line = the next line in the file
  
  if(numServo == 2){
      String[] pieces = split(line,',');

      int s1 = int(pieces[0]);
      int s2 = int(pieces[1]);
       
       if (record<360){ // amount of rows = 1 column = 1 gesture 
      // while record (a counting variable) < positionsToFile,
      //positionsToFile[record] = value of angle
      
         positionsToFile[record][i][1] = s1;
         positionsToFile[record][i][2] = s2;
       record++;
      // increment record in order to set value of the next line to the next spot in the array

       } 
  }
  
  else{
    angle = int(line);
    
    if (record<360){  
         positionsToFile[record][i][1] = angle;
         positionsToFile[record][i][2] = 0;
       record++;
       } 
  }
       
       else{
        println("end");
       }
  }
    reader.close();
  }catch (IOException e) {
    e.printStackTrace();
  }
  record = 0;
}

}

void draw(){
  background(255);
  playback();
}

void playback(){
  
  if (keyPressed){ 
    if(key == '0') { col = 0;}
    if(key == '1') { col = 1;}
    if(key == '2') { col = 2;}
    if(key == '3') { col = 3;}
    if(key == '4') { col = 4;}
    if(key == '5') { col = 5;}
    if(key == '6') { col = 6;}
    if(key == '7') { col = 7;}
    if(key == '8') { col = 8;}
    if(key == '9') { col = 9;}
    if(key == 'a' || key == 'A') { col = 10;}
    if(key == 'b' || key == 'B') { col = 11;}

  
   for (int i=0; i< 360; i++) // (rows // values for 1 gesture/txt file)
  {  
    if (numServo == 2){
    demon.servoWrite(servoPin7, positionsToFile[i][col][1]);
    //println(positionsToFile[i][col][1]);
    demon.servoWrite(servoPin4, positionsToFile[i][col][2]);
    //println(positionsToFile[i][col][2]);
    }
    
    else{
      demon.servoWrite(servoPin7, positionsToFile[i][col][1]);
    }
    delay(17);
    //delay to make sure that the motor doesnt try to display all the angles at once
  
  }
  }
}