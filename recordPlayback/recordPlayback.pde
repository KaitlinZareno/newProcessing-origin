import org.firmata.*;
import cc.arduino.*;
import processing.serial.*;

int servoPin =7; 
Arduino arduino;

int[] positions = new int [300];
int recordingCount = 0;

void setup()
{
  println(Arduino.list());
  size(360,360);
  frameRate(60);
  arduino = new Arduino(this, "/dev/tty.usbmodem1421", 57600);
  arduino.pinMode(servoPin,Arduino.SERVO);
}

void draw()
{  
  if (mousePressed)
  {
    recordingCount = 0;
  }
  
  if(recordingCount < positions.length)
  {
    background(255,0,0); // background is red
    positions[recordingCount] = constrain(mouseX/2,0,180);
    arduino.servoWrite(servoPin, positions[recordingCount]);
    recordingCount++;
    
    if (recordingCount == positions.length){
      background(255); // white for playback
    }
  }
  
  else{
    for(int i=0;i<positions.length;i++){
    arduino.servoWrite(servoPin, positions[i]);
    delay(10);
  }
  }
  
  if (mousePressed)
  {
    background(0); // black for stopped 
  }
}