void setup()
{
  size(500,500);
}

void draw()
{
  sketch();
  sketch();
  sketch();
}

void sketch()
{
  pushMatrix();
  // saves place of origin
  translate(100,100); 
  // additive!! 2 translates of 100 = a translate of 200
  // keep replicating = translate offsets different copies
  ellipse(0,0,100,10);
  translate(50,0);
  ellipse(0,0,10,10);
  popMatrix();
  // redoes place of origin --> puts it as part of parameter
}