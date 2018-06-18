int posx;
Boolean robotGrumpy;
int count;

void setup(){
  size(500,500);
  posx=200;
  robotGrumpy= true;
  count = 0;
}

void draw(){
  //background(255);
  if (mousePressed != true){
    ellipse(width/2,height/2,posx,100);
  }
  
  while (count <50){
    line(count*10,0,count*10,height/2);
    line(0,count*10,width,count*10);

    count+=1; 
  }
  
  for (int i= 0; i<50; i++){
    ellipse(i*10+5, 15,10,10);
  }
}