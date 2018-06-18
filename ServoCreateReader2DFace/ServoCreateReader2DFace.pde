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
  demon.pinMode(servoPin4, Arduino.SERVO);
  // just initializing the servo and arduino to play back angles
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

void parseFile() { // essentially "read" function
  // fill an array ; array = global variable ; use array in draw
  // Open the file from the ServoArraystoFile() example (open ServoAngles1.txt)


  //for (int i=0; i<4; i++) { 
    // WHERE YOU CHANGE THE # OF TXT FILES -- WILL CHANGE TO 11

    BufferedReader reader = createReader("ServoAngles" + 1 + ".txt"); //change to gestures
    //reads servoAngls i used to incriment text  to get values

    String line = null;
    try {
      while ((line = reader.readLine()) != null) {
        // while there are lines to be read in the file, var line = the next line in the file

        if (numServo == 2) {
          String[] pieces = split(line, ',');

          int s1 = int(pieces[0]);
          int s2 = int(pieces[1]);

          if (record<360) { // amount of rows = 1 column = 1 gesture 
            // while record (a counting variable) < positionsToFile,
            //positionsToFile[record] = value of angle

            positionsToFile[record][1] = s1;
            positionsToFile[record][2] = s2;
            record++;
            // increment record in order to set value of the next line to the next spot in the array
          }
        } else if (numServo ==1){
          angle = int(line);

          if (record<360) {  
            positionsToFile[record][0] = angle;
            positionsToFile[record][1] = 0;
            record++;
          }
        } else {
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
//}

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
          if (numServo == 2) {
            demon.servoWrite(servoPin7, positionsToFile[i][0]);
            //println(positionsToFile[i][col][1]);
            demon.servoWrite(servoPin4, positionsToFile[i][1]);
            //println(positionsToFile[i][col][2]);
          } 
          else {
            demon.servoWrite(servoPin7, positionsToFile[i][1]);
          }
          delay(5); //17
          //delay to make sure that the motor doesnt try to display all the angles at once
        }
      }
      
      //else{
      //     demon.servoWrite(servoPin7, 180);
      //}
      }
    }


void captureEvent(Capture c) {
  c.read();
}