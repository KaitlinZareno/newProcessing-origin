import math
angle = 0
angle2 = angle-45
angle3 = angle-90
a=50
c=50*math.sqrt(2)

def setup():
    size(360,360)

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
    posLine1()
    posLine3()
    posLine2()

    global x1, y1,x2,y2,x3,y3
    ellipse(180,180,5,5)
    lineSetup()
    dotSetup()
    

    
