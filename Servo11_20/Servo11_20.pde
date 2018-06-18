import processing.serial.*;
import cc.arduino.*;

Arduino squirrel;

void setup(){
  println(Arduino.list());
  squirrel = new Arduino(this,"/dev/tty.usbmodem1411",57600); //57600 how fast bit rate (bod rate) 
  //command dash to comment out more quickly
  squirrel.pinMode(7,Arduino.SERVO);
}
void draw(){
  if (mousePressed){
    background(255);
    squirrel.servoWrite(7,5);
  }
  else{
    background(50);
    squirrel.servoWrite(7,175);
  }
}