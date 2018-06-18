import processing.serial.*;
import org.firmata.*;
import cc.arduino.*;

int[][] positionsToFile = new int[360][11];// 11 columns (test with 3 for now)
// a set number based on the number of datapoints that are collected in ServoArraysToFile
// dependent on the frameRate(60) of ServoArraysToFile 
// also only save 360 values in the ToFile to the txt file + need 360 values to play back
int servoPin = 7;

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
  
  parseFile();
 // NEED TO CALL PARSEFILE -- will use this method to recall angles from txt file
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
  
      //String pieces = line;
      // set line to another variable, pieces (this step is unnecessary)
      // can go directly to: "angle = int(line)" if you want
      
      angle = int(line);
      // converts the string pieces to an int value; saves the int value to var angle
       
       if (record<360){ // amount of rows = 1 column = 1 gesture 
      // while record (a counting variable) < positionsToFile,
      //positionsToFile[record] = value of angle
      
         positionsToFile[record][i] = angle;
       record++;
      // increment record in order to set value of the next line to the next spot in the array

       }      
       
       else{
        println("end");
        //record=0;
         // random check that is unnecessary
       }
  }
    reader.close();
  }catch (IOException e) {
    e.printStackTrace();
    // catch exceptions -- basically makes sure program doesnt crash too badly if something doesnt match up
    // if something doesn't match up, will end reader
  }
  record = 0;
}
  //incriment i in order to set numbers from next txt file into 2D array

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
    demon.servoWrite(servoPin, positionsToFile[i][col]);
    println(positionsToFile[i][col]);
    delay(17);
    //delay to make sure that the motor doesnt try to display all the angles at once
    count++;
    //increment count to be able to stop the program
  }
 
  //if (count == 360){
  //    exit();
  //    // makes it so that the program only runs once (no repetition once the entire txt file is run through
  //    // once count = 360 the program will stop playing back the recorded angles. 
  //  }
  }
}