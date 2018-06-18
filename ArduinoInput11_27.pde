import processing.serial.*;
import org.firmata.*;
import cc.arduino.*;

Arduino kitkat;
int led = 7; // make sure this matches the pwm the wire is attached to

void setup()
{
  println(Arduino.list());
  kitkat = new Arduino(this,"/dev/tty.usbmodem1411",57600);
  kitkat.pinMode(led,Arduino.INPUT);
}

void draw(){
  if (kitkat.digitalRead(led) == Arduino.HIGH){
    fill(0,0,250);
  }
  else{
    fill(0,250,0);
  }
  
  rect(30,30,30,30);
}