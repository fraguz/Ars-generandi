import com.onformative.leap.LeapMotionP5;
import com.leapmotion.leap.*;

LeapMotionP5 leap;

PImage a;  // Declare variable "a" of type PImage
float theta = 80;
int varInt = 0;
float varFloat = 1;
long timer ;
long interval = 50;


void setup() {

  size(400, 400, P2D);
  leap = new LeapMotionP5(this);
  a = loadImage("Figura I.png");  // Load the image into the program
  timer = millis() + interval;//put timer in the future
  
}

void draw() {
  background(255);
   for (Finger finger : leap.getFingerList ()) {
    PVector fingerPos = leap.getTip(finger);
    PVector velocity = leap.getVelocity(finger);
    ellipse(fingerPos.x, fingerPos.y, 10, 10);
    println( "fingerPos.x" +fingerPos.x, "fingerPos.y" +fingerPos.y, "velocity" +velocity);
  }

  for (Hand hand : leap.getHandList ()) {
    PVector handPos = leap.getPosition(hand);
    PVector handDirection = leap.getDirection(hand);
    PVector velocity = leap.getVelocity(hand);
    line(handPos.x, handPos.y, handPos.z, handDirection.z);
    ellipse(handPos.x, handPos.y, 10, 10);
    println("handPos.x"+handPos.x, "handPos.y"+handPos.y);
    //println( "fingerPos.x" +fingerPos.x, "fingerPos.y" +fingerPos.y);
  
  
    
  if (timer < millis() ) {
    varInt = varInt + 1;
    timer = millis() + interval;//put timer in the future
    theta += 1;
 
  pushMatrix();

  rotate( radians (15) );// 360 = 2 * PI

  //image(a, 0, 0);

  popMatrix();

  pushMatrix();

  translate(width/2, height/2);
  rotate(radians(theta));
  translate(-a.width/2, -a.height/2);
  image(a, 0, 0);
  for (float i=0; i< 300; i++){
       theta = handPos.y;}
  popMatrix();//sort of boundaries for a rotation translation
}}}

