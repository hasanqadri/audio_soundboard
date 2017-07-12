//Hasan Qadri, hqadri6 //<>// //<>// //<>// //<>//
import java.util.PriorityQueue;
import controlP5.*;
import beads.*;
import org.jaudiolibs.beads.*;
//declare global variables at the top of your sketch
//AudioContext ac; is declared in helper_functions

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
Bead buttonListenerBead4;
Bead buttonListenerBead5;
Bead buttonListenerBead6;

ControlP5 p5;
UGen mod;

// declare our unit generators
SamplePlayer sp;
TextToSpeechMaker ttsMaker; 

WavePlayer modulator;
Glide modulatorFrequency;
WavePlayer carrier;
Glide carrierFrequency;

void setup() {
  size(320, 240); //size(width, height) must be the first line in setup()
  ac = new AudioContext(); //AudioContext ac; is declared in helper_functions 
  p5 = new ControlP5(this);
  server = new NotificationServer();
  notifEvent = new NotifEvents();
  server.addListener(notifEvent);
  currentlySelected = 1;
  ttsMaker = new TextToSpeechMaker();
  play();                  
}

void play() {
  setupContexts();
  //setupEvents();
 // setupGliders();
  mod = createHeartbeat();
  ac.out.addInput(workingOut);
  ac.out.addInput(walking);
  ac.out.addInput(socializing);
  ac.out.addInput(presenting);
  ac.out.addInput(mod);
  ui();
  ac.start();
}
  
void draw() {
  background(20, 100,100);  //fills the canvas with black (0) each frame
}