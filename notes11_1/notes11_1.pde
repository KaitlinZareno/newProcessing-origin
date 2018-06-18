import org.firmata.*;
import cc.arduino.*;
import processing.serial.*;

Arduino felix;

void setup()
{
  println(Arduino.list());
  felix = new Arduino(this,"/dev/tty.usbmodem1421", 57600);
  felix.pinMode(2, Arduino.INPUT);
}

void draw()
{
  if (felix.digitalRead(2) == Arduino.HIGH) // number in digital read matches pinMode
  {
    background(255);
  }
  else{
    background(0);
  }
  
}