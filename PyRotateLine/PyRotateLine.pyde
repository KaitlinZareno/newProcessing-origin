import math
angle =0
r=50
r2=100

colCount =7
rowCount = 360
positions = [[0 for j in range (colCount)] for i in range(rowCount)]
xC=0

def setup():
    size(360,360)
    frameRate (100)
    
    for i in range(360):
        if (i < 180):
            positions[i][0] = 0
            positions[i][1] = 0
        if (i >= 180):
            positions[i][0] = 180
            positions[i][1] = 180
    
def measureAngle():
    numRows = 360
    global xC, angle
    
    if xC < numRows:
        angle = mouseX/2
        positions[xC][1] = constrain(angle, 0, 180)
        print ("Angle Measure: " + str(positions[xC][1]))
        print ("Row Count: " + str(xC))
    else:
        background(255,0,0)
        
    xC = xC + 1

def posLine1():
    global x1,y1, angle
    x1 = r*math.sin(math.radians(angle))
    y1= r*math.sin(math.radians(90-angle))

    
def draw():
    background(255)
    delay(17)
    measureAngle()
    posLine1()

    global x1, y1
    ellipse(180,180,5,5)
    line(180,180,x1+180,y1+180)

    with open('ServoAnglesPy.txt', 'w') as f:
        for i in range(360):
            number = str(positions[i][1])
            f.write(number +'\n')
    
