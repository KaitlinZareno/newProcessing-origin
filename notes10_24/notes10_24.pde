import processing.serial.*;

import cc.arduino.*;
import org.firmata.*;

Arduino myArduino;

void setup()
{
  //println(Arduino.list());
  myArduino = new Arduino(this,"/dev/tty.usbmodem1421",57600); 
  myArduino.pinMode(7,Arduino.SERVO); // planning to connect to pwm 7
}

void draw()
{
  if (mousePressed)
  {
    background(255);
    myArduino.servoWrite(7,5); // pin and angle in degrees u want it to go to
    //servo = motor
  }
  
  else
  {
    background(0);
    myArduino.servoWrite(7,175);
  }
}