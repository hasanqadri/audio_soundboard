
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
        twitter = val;
      }
      if (i == 2) {
        email = val;
      }
      if (i == 3) {
       phoneCall = val;
      }
      if (i == 4) {
        textMessage = val;
      }
    }
  }
//println("voicemail: " + voiceMail + " email: " + email + " phonecall: " + phoneCall + " textmessage: " + textMessage + " twitter: " + twitter);
}