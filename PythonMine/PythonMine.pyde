#import processing.serial.*;
#import org.firmata.*;
#import cc.arduino.*;
#import gab.opencv.*;
#import processing.video.*;

#playback is working -- numbers from file are being relayed into array 

#import serial

#ser = serial.Serial('/dev/tty.usbserial', 9600)

rowCount = 360
colCount = 2
positions = [[0 for j in range(colCount)] for i in range(rowCount)]

# index is from 0 to 4
#     for both rows & cols
#     since 5 rows, 5 cols

def setup():
    for c in range (2):
    # for loop --> will incriment by 1 up to, but not including 2
    # for x in range (3,31,3) --> start at 3, up to but not including 31, count by 3s
        for r in range (180): 
        #matrix[rows][cols]
            positions[r][c] = r
            #print positions[r][c]
                
    parseFile()
#frameRate(60)
#size (640,480)

#initialize servo
#initialize open CV

def parseFile():
    with open('ServoAnglesPy.txt', 'r') as f:
        for i in range (360):
          angles = f.readline()
          positions[i][0] = angles;
          print(positions[i][0]);
        # , end = '' to make sure there is no space between
    # need file.close() if use open('textName.txt')
            # for line in f:
            #     count=0
            #     positions[count][0] = line
            #     print(positions[count][0])
            #     count+=1
    

#def draw():