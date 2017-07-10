//Hasan Qadri, hqadri6

import controlP5.*;
import beads.*;
import org.jaudiolibs.beads.*;
//declare global variables at the top of your sketch
//AudioContext ac; is declared in helper_functions

Gain g;
Gain rateValue;

Glide gainSlide;
Glide pbSlide;

SamplePlayer workingOut;
SamplePlayer walking;
SamplePlayer socializing;
SamplePlayer presenting;
enum Context {WORKING, WALKING, SOCIALIZING, PRESENTING};
Context context;

SamplePlayer heartbeat;

Bead ttsListener;;
Bead buttonListenerBead2;
Bead buttonListenerBead3;
Bead musicListenerBead;
Bead musicListenerBead2;
Bead musicListenerBead3;

ControlP5 p5;

OnePoleFilter filter1;
//end global variables

//runs once when the Play button above is pressed
void setup() {
  size(320, 240); //size(width, height) must be the first line in setup()
  ac = new AudioContext(); //AudioContext ac; is declared in helper_functions 
  p5 = new ControlP5(this);
  setupServer();
  play();                  
}

void play() {
  setupContexts();
  setupGliders();
  filter1 = new OnePoleFilter(ac, 200.0); //<>//
  filter1.addInput(workingOut);
  filter1.addInput(walking);
  filter1.addInput(socializing);
  filter1.addInput(presenting);
  filter1.addInput(heartbeat);
  
  g.addInput(filter1);
  ac.out.addInput(g);
  ui();
  ac.start();
  setupTTS();
}
  
void draw() {
  background(20, 100,100);  //fills the canvas with black (0) each frame
}