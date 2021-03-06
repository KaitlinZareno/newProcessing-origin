import math
angle = 0
angle2 = angle-45
angle3 = angle-90

a=50
c=50*math.sqrt(2)

colCount = 2
rowCount = 360
positions = [[0 for j in range (colCount)] for i in range(rowCount)]
xC=0
count =0

def setup():
    size(360,360)
    frameRate(100)
    
    for i in range(360):
        positions[i][0] = 0
        positions[i][1] = 0

def measureAngle():
    numRows = 360
    global xC, angle, angle2, angle3, positions
    
    if xC < numRows:
        angle = mouseX/2
        positions[xC][1] = constrain(angle, 0, 180)
        print ("Angle Measure: " + str(positions[xC][1]))
        print ("Row Count: " + str(xC))
    else:
        background(255,0,0)
        
    xC = xC + 1
    angle2 = angle-45
    angle3 = angle-90


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
    
    global x1, y1,x2,y2,x3,y3, angle, positions,count

    measureAngle()
    posLine1()
    posLine3()
    posLine2()

    ellipse(180,180,5,5)
    lineSetup()
    dotSetup()
    
    
    
    with open('PyAngles.txt', 'w') as f:
        for i in range(360):
            number = str(positions[i][1])
            f.write(number +'\n')
            
    # not writing to file???