//Contexts
boolean heartbeatState = false;

public void setupContexts() {
  
  workingOut = getSamplePlayer("workingout.wav");
  workingOut.setToLoopStart();
  workingOut.pause(true);
  workingOut.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);  
  
  walking = getSamplePlayer("walking.wav");
  walking.setToLoopStart();
  walking.pause(true);
  walking.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);  
  
  socializing = getSamplePlayer("socializing.wav");
  socializing.setToLoopStart();
  socializing.pause(true);
  socializing.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);  
  
  presenting = getSamplePlayer("presenting.wav");
  presenting.setToLoopStart();
  presenting.pause(true);
  presenting.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);  

}

public void Working(int value) {
  println("Play music1 pressed");
  walking.setToEnd();
  socializing.setToEnd();
  presenting.setToEnd();

  walking.pause(true);
  socializing.pause(true);
  presenting.pause(true);
  context = Context.WORKING;
  heartbeatState = true;
  Heartbeat();
  workingStart = 0;
  workingOut.start();
}

public void Walking(int value) {
  println("Play music2 pressed");
  workingOut.setToEnd();
  socializing.setToEnd();
  presenting.setToEnd();

  workingOut.pause(true);
  socializing.pause(true);
  presenting.pause(true);
  context = Context.WALKING;
  heartbeatState = true;
  Heartbeat();
  walkingStart = 0;
  walking.start();
}
public void Presenting(int value) {
  println("Play music3 pressed");
  walking.setToEnd();
  socializing.setToEnd();
  workingOut.setToEnd();

  walking.pause(true);
  socializing.pause(true);
  workingOut.pause(true);
  context = Context.PRESENTING;
  heartbeatState = true;
  Heartbeat();
  presentingStart = 0;
  presenting.start();
}
public void Socializing(int value) {
  println("Play music3 pressed");
  walking.setToEnd();
  workingOut.setToEnd();
  presenting.setToEnd();

  walking.pause(true);
  workingOut.pause(true);
  presenting.pause(true);
  context = Context.SOCIALIZING;
  heartbeatState = true;
  Heartbeat();
  socializingStart = 0;
  socializing.start();
}

public void Heartbeat() {
  if (!heartbeatState) {
    //mod.start();
    mod.pause(false);
    heartbeatState = true;
  } else {
    
    mod.pause(true);
    heartbeatState = false;
  } 
}  //<>//
   
public UGen createHeartbeat() {

// create the modulator
  modulatorFrequency = new Glide(ac, 1, 20);
  modulator = new WavePlayer(ac, modulatorFrequency, Buffer.SINE);

// create the carrier
  carrierFrequency = new Glide(ac, 1, 20);
  carrier = new WavePlayer(ac, carrierFrequency,Buffer.SINE);
// a custom function for Ring Modulation
// Remember, Ring Modulation = Modulator[t] * Carrier[t]
  Function ringModulation = new Function(carrier, modulator)
  {
    public float calculate() {
// multiply the value of modulator by
// the value of the carrier
      return x[0] * x[1];
    }
  };
  carrierFrequency.setValue(.05);
  modulatorFrequency.setValue(.0005);
  return ringModulation;
}
   