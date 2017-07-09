//Contexts
boolean heartbeatState = false;
public void setupContexts() {
  
  workingOut = getSamplePlayer("ambient5.wav");
  workingOut.setToLoopStart();
  workingOut.pause(true);
  workingOut.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);  
  
  walking = getSamplePlayer("ambient6.wav");
  walking.setToLoopStart();
  walking.pause(true);
  walking.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);  
  
  socializing = getSamplePlayer("ambient7.wav");
  socializing.setToLoopStart();
  socializing.pause(true);
  socializing.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);  
  
  presenting = getSamplePlayer("alert3.wav");
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
    heartbeat.start();
    heartbeatState = true;
  } else {
    heartbeat.setToEnd();
    heartbeat.pause(true);
    heartbeatState = false;
  } 
}