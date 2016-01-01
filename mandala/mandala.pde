

color [] colarray = { color(6, 36, 77), color(15, 55, 109), 
  color(44, 84, 138), color(93, 123, 164), color(136, 163, 199) };
int counter = 0;
PVector center;
PGraphics off;
PGraphics tri;
int shapes = 25;
int alpha =200;
float weight=16;

void setup()
{
  size(1000, 1000);
  blendMode(DIFFERENCE);   
  stroke(0);
  randomSeed(0);
  center = new PVector(width/2, height/2);
  noFill();
  smooth();
  ellipseMode(CENTER);
  rectMode(CENTER);
  off = createGraphics(width, height);
  drawRandomShapes(shapes);
  for (int i=0; i<18; i++) {
    drawCenteredShape(2);
  }
}

void draw()
{
  noFill();
  image(off, 0, 0, width, height);
}

void drawRandomShapes(int count)
{
  for (int i = 0; i < count; i++)
  {
    drawCenteredShape(1);
  }
}

void drawCenteredShape(int type)
{
  float x = random(1, center.x*2-30);
  float y = random(1, center.y*2-30);
  switch(type)
  {
  case 1:
    off.beginDraw();
    off.strokeWeight(random(1, weight));
    off.noFill();
    int yy=colarray[counter];
    off.stroke(yy);

    off.ellipse(center.x, center.y, x, y);
    off.ellipse(center.x, center.y, y, x);

    off.pushMatrix();
    off.translate(center.x, center.y);
    off.rotate(radians(45));
    off.ellipse(0, 0, x, y);
    off.popMatrix();

    off.pushMatrix();
    off.translate(center.x, center.y);
    off.rotate(radians(-45));
    off.ellipse(0, 0, x, y);
    off.popMatrix();
    off.endDraw();
    break;
  }
  weight--;
  counter = (counter + 1) % colarray.length;
}



void keyPressed()
{    
  saveFrame("line-######.png");
}