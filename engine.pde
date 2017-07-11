/**
boolean voiceMail = false;
boolean email = false;
boolean phoneCall = false;
boolean textMessage = false;
boolean twitter = false;
enum Context {WORKING, WALKING, SOCIALIZING, PRESENTING};
Context context
**/
//Tweets take lowest priority of the four, but after that content summary decides order, where the more negative the higher its priority
//Sonifying type, sender, message
//If tweet, play twitter sound
//If phone call, phone call sound
//If voice mail, play "you have one new voice message"
// email, then email jingle
//TTS for sender and message
//String exampleSpeech = "Text to speech is okay, I guess.";
//ttsExamplePlayback(exampleSpeech); //see ttsExamplePlayback below for usage
boolean playing = true;
Notification notif;
SamplePlayer thisSound;
PriorityQueue<Notification> pq = new PriorityQueue<Notification>();

public void engineHeart() {
      println("engine heart began");
      Notification notice = pq.poll();
      String noti = notice.getType().toString();
      if ((noti.equals("Tweet") && twitter)
        || (noti.equals("MissedCall") && phoneCall)
          || (noti.equals("VoiceMail") && voiceMail)
            || (noti.equals("Email") && email)
              ||(noti.equals("TextMessage") && textMessage)) {
                contextPlay(pq.poll());
              }
}

/**

boolean voiceMail = false;
boolean email = false;
boolean phoneCall = false;
boolean textMessage = false;
boolean twitter = false;
**/

public void engine() {
     println("engine began");
     thisSound.setEndListener(
        buttonListenerBead4 = new Bead() {
          public void messageReceived(Bead mess) {
            println("listened to type");

            sp.setEndListener(
              buttonListenerBead5 = new Bead() {
              public void messageReceived(Bead mess) {
                println("listened to sender and message");
                //contextPlay(pq.poll());
              }  
            }
          ); 
          }
        }
      );
}

public void contextPlay(Notification note) {
  notif = note;
  int pLevel = note.getPriorityLevel(); 
  println("contextplay began: " + note.getType());
  thisSound = getSamplePlayer(note.getType().toString() + ".wav");
  //sp = getSamplePlayer(note.getType().toString() + ".wav"); 

  if (context == Context.WORKING) {
    //We will go through all priority levels of 1 through 4
    playSounds(note);
  } else if (context == Context.WALKING) {
    //We will go through priorities 2 thorugh 4
    if (pLevel == 4 || pLevel == 3 || pLevel == 2 ) {
      //We will go through all priority levels of 1 through 4
      playSounds(note);
    }
  } else if (context == Context.SOCIALIZING) {
    //We will take priorities 3 and 4
    if (pLevel == 4 || pLevel == 3 ) {
     //We will go through all priority levels of 1 through 4
     playSounds(note);
    }
  } else if (context == Context.PRESENTING) {
    //We will only take priorities 4
    if (pLevel == 4) {
       //We will go through all priority levels of 1 through 4
       playSounds(note);
    }
  }
}
  
  
  
  public void playSounds(Notification note) {
     notif = note;
     thisSound = getSamplePlayer(note.getType().toString() + ".wav");
      thisSound.setToLoopStart();
      thisSound.pause(true);
      filter1.addInput(thisSound);
      thisSound.start();
       
      thisSound.setEndListener(
        buttonListenerBead2 = new Bead() {
          public void messageReceived(Bead mess) {
            println("a sound has ended");
            thisSound.pause(true);
            println("a sound has ended2");
  
            this.pause(true);
            println("a sound has ended3");
  
            ttsExamplePlayback(notif.getSender());
            sp.setEndListener(
              buttonListenerBead3 = new Bead() {
              public void messageReceived(Bead mess) {
                sp.pause(true);
                this.pause(true);
                if (!notif.getMessage().equals("")) {
                  ttsExamplePlayback(notif.getMessage());   
                  println("a sound has ended5");
                } 
            }  
            }
          ); 
            println("a sound has ended4");
          }
        }
      ); 
    
  }
    
  /**
  notif = note;
  if (sp == null) {
    ttsExamplePlayback("Type " + notif.getType().toString()); 
  } else {
    sp.setEndListener(
        buttonListenerBead3 = new Bead() {
          public void messageReceived(Bead mess) {
            println("a sound has ended");
            sp.pause(true);
            this.pause(true);
            ttsExamplePlayback("Type " + notif.getType().toString()); 
  
          }
        }
    );
  }
  
  sp.setEndListener(
      buttonListenerBead2 = new Bead() {
        public void messageReceived(Bead mess) {
          println("a sound has ended");
          sp.pause(true);
          this.pause(true);
          ttsExamplePlayback("Sender " + notif.getSender());

        }
      }
  );
  
   if (note.getType().toString().equals("Tweet")) {
      playTweet();
  } else if (note.getType().toString().equals("MissedCall")) {
      playPhone();
  } else if (note.getType().toString().equals("TextMessage")){
      playText();
  }  else if (note.getType().toString().equals("Email")){
      playEmail();
  } else if (note.getType().toString().equals("VoiceMail")) {
      playVoice();
  }
**/

/**
  println(note.getType());
   /**
  notif = note;
  if (thisSound == null) {
    thisSound = getSamplePlayer(note.getType().toString() + ".wav");
    thisSound.setToLoopStart();
    thisSound.pause(true);
    filter1.addInput(thisSound);
    thisSound.start();  
    
    thisSound.setEndListener(
      buttonListenerBead2 = new Bead() {
        public void messageReceived(Bead mess) {
          println("a sound has ended");
          thisSound.pause(true);
          println("a sound has ended2");

          this.pause(true);
          println("a sound has ended3");

          ttsExamplePlayback(notif.getSender());
          sp.setEndListener(
            buttonListenerBead3 = new Bead() {
            public void messageReceived(Bead mess) {
              sp.pause(true);
              this.pause(true);
              if (notif.getMessage() != null) {
                ttsExamplePlayback(notif.getMessage());    
              } 
          }  
          }
        ); 
          println("a sound has ended4");
        }
      }
    );
  }   
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
   else {
      thisSound.setEndListener(
        buttonListenerBead2 = new Bead() {
          public void messageReceived(Bead mess) {
            println("a sound has ended");
            thisSound.pause(true);
            println("a sound has ended2");
  
            this.pause(true);
            println("a sound has ended3");
  
            ttsExamplePlayback(pq.poll().getSender());
            sp.setEndListener(
              buttonListenerBead3 = new Bead() {
              public void messageReceived(Bead mess) {
                sp.pause(true);
                this.pause(true);
                if (notif.getMessage() != null) {
                  ttsExamplePlayback(notif.getMessage());    
                } 
            }  
            }
          ); 
            println("a sound has ended4");
          }
        }
      );
    }
  **/