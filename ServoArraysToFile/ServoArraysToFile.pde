PrintWriter output;
//import this -- need this to create the text file

import processing.serial.*;
import cc.arduino.*;
import org.firmata.*;

Arduino demon;
int servoPin=7;
int servoPin2 = 4;
int[][] position = new int[360][2];
int record=0;
int numServo=1;

void setup() {
  println(Arduino.list());
  size(360,50);
  frameRate(60);
  //demon=new Arduino(this, "/dev/tty.usbmodem1421", 57600);
  ////rocket=new Arduino(this, "/dev/tty.usbmodem1421", 57600);
  //demon.pinMode(servoPin,Arduino.SERVO);
  //demon.pinMode(servoPin2,Arduino.SERVO);
  
  output = createWriter("ServoAngles9.txt"); 
  // change to whatever your number is
  
  }
  
void draw() {
  if (mousePressed) {
    record=0;
  }
  
  background (255,0,0); //red for recording
  
  if (numServo == 1){
  if(record<position.length){
    position[record][0]= constrain(mouseX/2,0,180);
    //position[record][1] = 0;
    //demon.servoWrite(servoPin, position[record][0]);
  
    println(position[record]);
  }
  
  //else{
  //  position[record][0]= constrain(mouseX/2,0,180);
  //  //position[record][1]= constrain(mouseY/2,0,180);

  //  demon.servoWrite(servoPin, position[record][0]);
  //  demon.servoWrite(servoPin2, position[record][1]);

  //}

  output.println(position[record][0]);
  
  record=record+1;
    if (record == position.length) {
      background (255); 
      // white for playback (in this case it represents the stop of data recording)
      output.flush(); // Writes the remaining data to the txt file
      output.close(); // Finishes the txt file
      

  // a txt file called ServoAngles1.txt should now appear in the ServoArraysCreateReader folder
    }
  }
}