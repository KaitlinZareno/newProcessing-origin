//This program controls a RC hobby servo whose signal line is connected to Pin 7.
//import the serial library so we can make a serial connection to the Arduino
import processing.serial.*;
//import the arduino library so Processing knows how to talk to the Arduiono
import cc.arduino.*;
//make an Arduino object
Arduino myLittleArduino;
// make an int variable that contains the number 7 which is the number of the pin we connect the servo to
int servoPin = 7;
//this is an array of int type variables with four values in it
int[] angles = {10, 50, 100, 67}; //arrays are new
void setup() {
//print out all the serial ports
println(Arduino.list());
// connect the arduino at a bitrate of 57600 bits per second
myLittleArduino = new Arduino(this, "/dev/ttyACM0", 57600);
//set the pin connected to the servo as a servo control pin in Processing's "mind"
myLittleArduino.pinMode(servoPin, Arduino.SERVO);
}
void draw() {
//command servo to angle 1 (the zeroth element of the array)
myLittleArduino.servoWrite(servoPin, angles[0]);
//delay for 1000 milliseconds i.e. 1 second
delay(1000);
//command servo to angle 2 (the first element of the array)
myLittleArduino.servoWrite(servoPin, angles[1]);
delay(500);
//command servo to angle 3 (the second element of the array)
myLittleArduino.servoWrite(servoPin, angles[2]);
delay(1000);
//command servo to angle 4 (the third element of the array)
myLittleArduino.servoWrite(servoPin, angles[3]);
delay(1000);
}