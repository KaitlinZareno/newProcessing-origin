import processing.serial.*;
import org.firmata.*;
import cc.arduino.*;
import gab.opencv.*;
import processing.video.*;
import java.awt.*;

int [][] positionsToFile = new int[360][2];// 11 columns (test with 3 for now)
int servoPin7 = 7;
int servoPin4 = 4;
int numServo=1;
// change this line depending on the number of servos u have


int angle;
int count;
int colCount;
int record;
int col = 0;
Arduino demon;

Capture video;
OpenCV opencv;

void setup() {
  // size(640,480);
  //hard code so wherever mouse goes = angle of rotation
  // ex mouse in middle of screen (90), = servo rotation of 90 degrees
  frameRate(60);

  println(Arduino.list());
  demon = new Arduino(this, "/dev/tty.usbmodem1421", 57600);
  demon.pinMode(servoPin7, Arduino.SERVO);
  
  record = 0;
  count=0;
  colCount =0;

  for (int r=0; r<360; r++) {
    for (int a=0; a<2; a++) {
      positionsToFile[r][a] = 0;
    }
  }
  
  size(640, 480);  
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  video.start();
  parseFile();
}

void parseFile() { 

    BufferedReader reader = createReader("ServoAngles" + 9 + ".txt"); 

    String line = null;
    try {
      while ((line = reader.readLine()) != null) {

          angle = int(line);

          if (record<360) {  
            positionsToFile[record][0] = angle;
            positionsToFile[record][1] = 0;
            println(positionsToFile[record][0]);
            record++;
          }
          
          else {
          println("end");
        }
      }
      reader.close();
    }
    catch (IOException e) {
      e.printStackTrace();
    }
    record = 0;
  }

void draw() {
  background(255);
  playback();

  scale(2);
  opencv.loadImage(video);
  image(video, 0, 0 );
  Rectangle[] faces = opencv.detect();
  for (int i = 0; i < faces.length; i++) {
    //println(faces[i].x + "," + faces[i].y);
    ellipse(faces[i].x + faces[i].width/2, faces[i].y + faces[i].height/2, 10, 10);
  }
}

  void playback() {

    Rectangle[] faceDetect = opencv.detect();
    if (faceDetect.length>0) {
      if (faceDetect[0].x >=0 && faceDetect[0].x <=640 && faceDetect[0].y >=0 && faceDetect[0].y <=480) {
        for (int i=0; i< 360; i++) // (rows // values for 1 gesture/txt file)
        {  
            if( i>=180){
            positionsToFile[i][0] = 360;
            }
            
            demon.servoWrite(servoPin7, positionsToFile[i][0]);
            delay(17); //17
        }
        
        }
      }
      
     // else{ demon.servoWrite(servoPin7, positionsToFile
    }


void captureEvent(Capture c) {
  c.read();
}