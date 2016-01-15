Buoy[] buoys;
PImage pimg;
int margin = 0, nbW = 30, nbH = 30, w, h, mode = 0;
float maxD = 100;
PVector m;

void computeBuoys()
{
  for (Hand hand : leap.getHandList()) {
    PVector handPos = leap.getPosition(hand);
    ellipse(handPos.x, handPos.y, 10, 10);

    m = new PVector(handPos.x, handPos.y, handPos.z);
    Buoy b;
    for (int i = 0; i < nbW*nbH; i++)
    {   
      buoys[i].move();
    }
  }
}

void display()
{
  Buoy b, bx, bxy, by;
  beginShape(QUAD);
  texture(pimg);       
  for (int i = 0; i < nbW-1; i++)
  {
    for (int j = 0; j < nbH-1; j++)
    {
      b = buoys[i + j*nbW];//top left corner
      bx = buoys[i + 1 + j*nbW];//top rigth corner
      by = buoys[i + (j+1)*nbW];//bottom right corner
      bxy = buoys[i + 1 + (j+1)*nbW];//bottom left corner

      if (mode == 1)
      {    
        rect(b.pos.x, b.pos.y, 3, 3);
      } else
      {
        vertex(b.pos.x, b.pos.y, w*i, h*j);
        vertex(bx.pos.x, bx.pos.y, w*(i+1), h*j);
        vertex(bxy.pos.x, bxy.pos.y, w*(i+1), h*(j+1));
        vertex(by.pos.x, by.pos.y, w*i, h*(j+1));
      }
    }
  }
  endShape();
}

void keyPressed()
{
  if (key == CODED && (keyCode == LEFT || keyCode == RIGHT))
  {
    maxD = constrain(maxD + (keyCode == RIGHT ? 1 : -1) * 20, 20, 300);
  } else
  {
    mode = (mode+1)%2;
  }
}
