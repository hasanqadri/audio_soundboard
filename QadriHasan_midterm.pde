//Hasan Qadri, hqadri6 //<>//

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

Bead ttsListener;
Bead buttonListenerBead2;
Bead buttonListenerBead3;
Bead musicListenerBead;
Bead musicListenerBead2;
Bead musicListenerBead3;

ControlP5 p5;
UGen mod;
OnePoleFilter filter1;
//end global variables
float baseFrequency = 1.0f; // fundamental frequency
int sineCount = 50000; // how many sine waves will be present
// declare our unit generators
WavePlayer sineTone[];
Glide sineFrequency[];
Gain sineGain[];
Gain masterGain;
WavePlayer modulator;
Glide modulatorFrequency;
WavePlayer carrier;
Glide carrierFrequency;
// our master gain
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
  //setupEvents();
  setupGliders();
  filter1 = new OnePoleFilter(ac, 200.0);
  filter1.addInput(workingOut);
  filter1.addInput(walking);
  filter1.addInput(socializing);
  filter1.addInput(presenting);
  filter1.addInput(heartbeat);
  /**filter1.addInput(tweetSound);
  filter1.addInput(phoneSound);
  filter1.addInput(voiceSound);
  filter1.addInput(emailSound);
  filter1.addInput(textSound);
  **/
  setupTTS();
  
mod = createHeartbeat();
  filter1.addInput(mod);
  g.addInput(filter1);
  ac.out.addInput(g);
  ui();
  ac.start();
}
  
void draw() {
  background(20, 100,100);  //fills the canvas with black (0) each frame
}



/**
modulator = new WavePlayer(ac, 40, Buffer.SINE);

 // This is a custom function
 // Custom functions are simple custom Unit Generators.
 // Generally, they only override the calculate function.
 Function frequencyModulation = new Function(modulator)
 {
 public float calculate() {
 // return x[0], which is the original value of
 // the modulator signal (a sine wave)
 // multiplied by 50 to make the sine vary
 // between -50 and 50
 // then add 200, so that it varies from 150 to 250
 return (x[0] * 50.0) + 200.0;
 }
 };
 // create a second WavePlayer, but this time,
 // control the frequency with the function created above
 carrier = new WavePlayer(ac,
 frequencyModulation,
Buffer.SINE);
 // create a Gain object to make sure we don't peak
 g = new Gain(ac, 1, 0.5);
 // connect the carrier to the Gain input
 g.addInput(carrier);

**/