


import com.onformative.leap.LeapMotionP5;
import com.leapmotion.leap.*;

LeapMotionP5 leap;



void setup() {
  size(400, 400, OPENGL);
  noFill();
  noStroke();

  leap = new LeapMotionP5(this);

  rectMode(CENTER);
  pimg = loadImage("ramonllull.jpg");

  w = (int)((pimg.width-2*margin) / nbW);
  h = (int)((pimg.height-2*margin) / nbH);
  buoys = new Buoy[nbW*nbH];
  
  for (int i = 0; i < nbW; i++)
  {
    for (int j = 0; j < nbH; j++)
    {
      buoys[i + j*nbW] = new Buoy(map(i, 0, nbW-1, margin, width-margin), map(j, 0, nbH-1, margin, height-margin));
    }
  }
  }

  void draw() {

    background(70);
    computeBuoys();
    display();

    loadPixels();

    for (Hand hand : leap.getHandList()) {
      PVector handPos = leap.getPosition(hand);
      ellipse(handPos.x, handPos.y, 10, 10);
      println("handPos.x"+handPos.x, "handPos.y"+handPos.y);
    }

    for (Finger finger : leap.getFingerList()) {
      PVector fingerPos = leap.getTip(finger);
      PVector velocity = leap.getVelocity(finger);
      ellipse(fingerPos.x, fingerPos.y, 10, 10);
      println( "fingerPos.x" +fingerPos.x, "fingerPos.y" +fingerPos.y, "velocity" +velocity);
    }

    for (Hand hand : leap.getHandList()) {
      PVector handPos = leap.getPosition(hand);
      PVector handDirection = leap.getDirection(hand);
      line(handPos.x, handPos.y, handPos.z, handDirection.z);
      //println( "fingerPos.x" +fingerPos.x, "fingerPos.y" +fingerPos.y);
    }
  }
