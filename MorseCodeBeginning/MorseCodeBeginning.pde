import processing.serial.*;
import cc.arduino.*;

Arduino arduino;

int led = 7;
void setup()
{
   println(Arduino.list());
   arduino = new Arduino(this, "/dev/cu.usbmodem1411", 57600);
   arduino.pinMode(led, arduino.OUTPUT);
}

void loop()
{
  arduino.digitalWrite(led,arduino.LOW);
  delay(7000);
  arduino.digitalWrite(led,arduino.HIGH);
  delay(1000);
  arduino.digitalWrite(led,arduino.LOW);
  delay(1000);
  arduino.digitalWrite(led,arduino.HIGH);
  delay(1000);
  arduino.digitalWrite(led,arduino.LOW);
  delay(1000);
  arduino.digitalWrite(led,arduino.HIGH);
  delay(1000);
  arduino.digitalWrite(led,arduino.LOW);
  delay(1000);
}