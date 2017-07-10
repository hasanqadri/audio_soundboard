//Contexts
boolean heartbeatState = false;


public void synthesizeHeartbeat() {
  float baseFrequency = 200.0f;
  int sineCount = 10;
  WavePlayer sineTone[];
  Glide sineFrequency[];
  Gain sineGain[];
  sineFrequency = new Glide[sineCount];
  sineTone = new WavePlayer[sineCount];
  for (int i = 0; i < sineCount; i++) {
    sineTone[i] = new WavePlayer(ac, sineFrequency[i], Buffer.SINE);
    
  }
}

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
  
  heartbeat = getSamplePlayer("alert2.wav");
  heartbeat.setToLoopStart();
  heartbeat.pause(true);
  heartbeat.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS); 
}

public void PlayWorking(int value) {
  println("Play music1 pressed");
  walking.setToEnd();
  socializing.setToEnd();
  presenting.setToEnd();

  walking.pause(true);
  socializing.pause(true);
  presenting.pause(true);
  context = Context.WORKING;
  workingOut.start();
}

public void PlayWalking(int value) {
  println("Play music2 pressed");
  workingOut.setToEnd();
  socializing.setToEnd();
  presenting.setToEnd();

  workingOut.pause(true);
  socializing.pause(true);
  presenting.pause(true);
  context = Context.WALKING;
  walking.start();
}
public void PlayPresenting(int value) {
  println("Play music3 pressed");
  walking.setToEnd();
  socializing.setToEnd();
  workingOut.setToEnd();

  walking.pause(true);
  socializing.pause(true);
  workingOut.pause(true);
  context = Context.PRESENTING;
  presenting.start();
}
public void PlaySocializing(int value) {
  println("Play music3 pressed");
  walking.setToEnd();
  workingOut.setToEnd();
  presenting.setToEnd();

  walking.pause(true);
  workingOut.pause(true);
  presenting.pause(true);
  context = Context.SOCIALIZING;
  socializing.start();
}

public void PlayHeartbeat(int value) {
  if (!heartbeatState) {
    //mod.start();
    mod.pause(false);
    heartbeatState = true;
  } else {
    
    mod.pause(true);
    heartbeatState = false;
  } 
}

/**
/**
  // create a sine generator
  WavePlayer carrier = new WavePlayer(ac, .010f, Buffer.SINE);

  // create a WavePlayer to control the gain
  WavePlayer modulator = new WavePlayer(ac, 30.0f, Buffer.SINE);

  // create a Gain to control the sine volume
  Gain sineGain = new Gain(ac, 1, modulator);

  // add the sine generator as an input to the Gain
  sineGain.addInput(carrier);
  filter1.addInput(carrier);   }/ set up our master gain object
   masterGain = new Gain(ac, 1, 0.01);
   // initialize our arrays of objects
   sineFrequency = new Glide[sineCount];
   sineTone = new WavePlayer[sineCount];
   sineGain = new Gain[sineCount];
   float currentGain = .01f;
   for( int i = 0; i < sineCount; i++) {
     // create the glide that will control this WavePlayer's
     // frequency
     sineFrequency[i] = new Glide(ac, baseFrequency * i, 30);
     // create the WavePlayer
     sineTone[i] = new WavePlayer(ac,
     sineFrequency[i], Buffer.SINE);
     // create the gain object
     sineGain[i] = new Gain(ac, 1, currentGain);
     // then connect the waveplayer to the gain
     sineGain[i].addInput(sineTone[i]);
     // finally, connect the gain to the master gain
     masterGain.addInput(sineGain[i]);
     // lower the gain for the next tone in the additive
     currentGain -= (1.0 / (float)sineCount);
   }
  filter1.addInput(masterGain);
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
   return (x[0] * 100.0) + 200.0;
   }
   };
   // create a second WavePlayer, but this time,
   // control the frequency with the function created above
   carrier = new WavePlayer(ac, frequencyModulation, Buffer.SINE);
   // create a Gain object to make sure we don't peak
   g = new Gain(ac, 1, 0.5);
   // connect the carrier to the Gain input
   g.addInput(carrier);
   **/
   
public UGen createHeartbeat() {

// create the modulator
  modulatorFrequency = new Glide(ac, 5, 7);
  modulator = new WavePlayer(ac, modulatorFrequency, Buffer.SINE);

// create the carrier
  carrierFrequency = new Glide(ac, 5, 7);
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
// create a Gain object to make sure we don't peak
  g = new Gain(ac, 1, 5);
  carrierFrequency.setValue(.05);
  modulatorFrequency.setValue(.0005);
  return ringModulation;
}
   