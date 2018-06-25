import math
angle = 0
angle2 = angle-45
angle3 = angle-90

count=0

a=50
c=50*math.sqrt(2)

rowCount = 360
colCount = 2
positions = [[0 for j in range(colCount)] for i in range(rowCount)]

def setup():
    size(360,360)
    frameRate(100)
    
    for c in range (2):
        for r in range (180): 
            positions[r][c] = r
   
    global positions         
    parseFile()


def parseFile():
    global angle, angle2, angle3
    with open('ServoAnglesPy.txt', 'r') as f:
        for i in range (360):
          angles = f.readline()
          positions[i][0] = angles;
          print(positions[i][0]);
          
def measureAngle():
    global count, angle, angle2, angle3
    global positions
    angle = int(positions[count][0]) 
    #Make sure to cast array obejcts in order to prevent bug!!
    angle2 = angle-45
    angle3 = angle-90
    print ("angle1: " + str(angle))
    # print ("angle2: " + str(angle2))
    # print ("angle3: " + str(angle3))
    
def posLine1():
    global x1,y1, angle
    x1 = a*math.sin(math.radians(angle))
    y1= a*math.sin(math.radians(90-angle))
    
def posLine2():
    global x2,y2, angle2
    x2 = c*math.sin(math.radians(angle2))
    y2= c*math.sin(math.radians(90-angle2))

def posLine3():
    global x3,y3, angle3
    x3 = a*math.sin(math.radians(angle3))
    y3= a*math.sin(math.radians(90-angle3))
    
def lineSetup():
    strokeWeight(5)
    line1 = line(180,180,x1+180,y1+180)
    strokeWeight(1)
    line2 = line(180,180,x3+180,y3+180)
    line3 = line(x3+180,y3+180, x2+180,y2+180)
    line4 = line(x2+180,y2+180,x1+180,y1+180)
    
def dotSetup():
    dot1 = ellipse (x1+180,y1+180,5,5)
    dot2 = ellipse (x2+180,y2+180,5,5)
    dot3 = ellipse (x3+180,y3+180,5,5)
       
def draw():
    background(255)
    delay(17)

    global x1, y1,x2,y2,x3,y3, count
    ellipse(180,180,5,5)
    measureAngle()
    posLine1()
    posLine3()
    posLine2()
    lineSetup()
    dotSetup()
    print("count: "+ str(count))
    
    if count < 359:
        count +=1
    
    if count ==359:
        background(255,0,0)
        