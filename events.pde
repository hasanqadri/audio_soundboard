
boolean voiceMail = false;
boolean email = false;
boolean phoneCall = false;
boolean textMessage = false;
boolean twitter = false;

SamplePlayer tweetSound;
SamplePlayer emailSound;
SamplePlayer textSound;
SamplePlayer voiceSound;
SamplePlayer phoneSound;

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(checkbox)) {
    print("got an event from "+checkbox.getName()+"\t\n");
    // checkbox uses arrayValue to store the state of 
    // individual checkbox-items. usage:
    println(checkbox.getArrayValue());
    for (int i=0;i<checkbox.getArrayValue().length;i++) {
      int n = (int)checkbox.getArrayValue()[i];
      boolean val = n == 1 ? true : false;
      if (i == 0) {
        voiceMail = val;
      }
      if (i == 1) {
        email = val;
      }
      if (i == 2) {
        phoneCall = val;
      }
      if (i == 3) {
        textMessage = val;
      }
      if (i == 4) {
        twitter = val;
      }
    }
  }
//println("voicemail: " + voiceMail + " email: " + email + " phonecall: " + phoneCall + " textmessage: " + textMessage + " twitter: " + twitter);
}

public void setupEvents() {

  tweetSound = getSamplePlayer("tweetSound.wav");
  tweetSound.setToLoopStart();
  tweetSound.pause(true);

  
  voiceSound = getSamplePlayer("voiceSound.wav");
  voiceSound.setToLoopStart();
  voiceSound.pause(true);
  
  phoneSound = getSamplePlayer("phoneSound.wav");
  phoneSound.setToLoopStart();
  phoneSound.pause(true);
  
  emailSound = getSamplePlayer("emailSound.wav");
  emailSound.setToLoopStart();
  emailSound.pause(true);
  
  textSound = getSamplePlayer("textSound.wav");
  textSound.setToLoopStart();
  textSound.pause(true);
}

public void PlayTweet(int value) {
  tweetSound.start();
}

public void PlayVoice(int value) {
  voiceSound.start();
}

public void PlayPhone(int value) {
  phoneSound.start();
}

public void PlayEmail(int value) {
  emailSound.start();
}

public void PlayText(int value) {
  textSound.start();
}