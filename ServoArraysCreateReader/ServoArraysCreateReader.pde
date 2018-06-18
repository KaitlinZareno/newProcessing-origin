import processing.serial.*;
import org.firmata.*;
import cc.arduino.*;

int[] positionsToFile = new int[360];
// a set number based on the number of datapoints that are collected in ServoArraysToFile
// dependent on the frameRate(60) of ServoArraysToFile 
// also only save 360 values in the ToFile to the txt file + need 360 values to play back
int servoPin = 7;

int angle;
int count;
int record;
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
  
  parseFile();
 // NEED TO CALL PARSEFILE -- will use this method to recall angles from txt file
}

void parseFile() { // fill an array ; array = global variable ; use array in draw
  // Open the file from the ServoArraystoFile() example (open ServoAngles1.txt)
  
  BufferedReader reader = createReader("GesturesX.txt"); 
  //change to whatever your # is
  
  //reads ServoAngles1 to get values
  
  String line = null;
  try {
    while ((line = reader.readLine()) != null) {
  // while there are lines to be read in the file, var line = the next line in the file
  
      String pieces = line;
      // set line to another variable, pieces (this step is unnecessary)
      // can go directly to: "angle = int(line)" if you want
      
      angle = int(pieces);
      // converts the string pieces to an int value; saves the int value to var angle
       
       if (record<positionsToFile.length){
      // while record (a counting variable) < positionsToFile,
      //positionsToFile[record] = value of angle
      
         positionsToFile[record] = angle;
       record++;
       // increment record in order to set value of the next line to the next spot in the array
       }
       
       else{
         println("end");
         // random check that is unnecessary
       }
    }
    reader.close();
  }catch (IOException e) {
    e.printStackTrace();
    // catch exceptions -- basically makes sure program doesnt crash too badly if something doesnt match up
    // if something doesn't match up, will end reader
  }
}

void draw(){
  background(255);
  for (int i=0; i< positionsToFile.length; i++)
  {    
    demon.servoWrite(servoPin, positionsToFile[i]);
    // applying the angles from the txt file that were saved to the array positionsToFile
    //prints element i of the positionsToFile array and makes the servo move to that degree (number)
    println(positionsToFile[i]);
    // another check to make sure that the positionsToFile saved the angles from the txt  file correctly
    delay(17);
    //delay to make sure that the motor doesnt try to display all the angles at once
    count++;
    //increment count to be able to stop the program
  }
  if (count == positionsToFile.length){
      exit();
      // makes it so that the program only runs once (no repetition once the entire txt file is run through
      // once count = 360 the program will stop playing back the recorded angles. 
    }
}