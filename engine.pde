 
boolean playing = true;
Notification notif;
SamplePlayer thisSound;
PriorityQueue<Notification> pq = new PriorityQueue<Notification>();
PriorityQueue<Notification> old = new PriorityQueue<Notification>();

Notification prav;
int workingStart = 0;
int socializingStart = 0;
int walkingStart = 0;
int presentingStart = 0; 

public void engineHeart() {
      println("engine heart began");
      println(voiceMail + " " + twitter + " " + email + " " + phoneCall + " " + textMessage);
      Notification notice = pq.poll();
      old.add(notice);
      String noti = notice.getType().toString();
      if ((noti.equals("Tweet") && twitter)
        || (noti.equals("MissedCall") && phoneCall)
          || (noti.equals("VoiceMail") && voiceMail)
            || (noti.equals("Email") && email)
              ||(noti.equals("TextMessage") && textMessage)) {
                contextPlay(notice);
              }
}


public void contextPlay(Notification note) {
  notif = note;
  int pLevel = note.getPriorityLevel(); 
  println("contextplay began: " + note.getType());
  
  if (context == Context.WORKING) {
    //We will go through all priority levels of 1 through 4. 
    playContextWorking(note);
  } else if (context == Context.WALKING) {
    //We will go through priorities 2 thorugh 4, only play messages
    if (pLevel == 4 || pLevel == 3 || pLevel == 2 ) {
     playContextWalking(note);
    }
  } else if (context == Context.SOCIALIZING) {
    //We will take priorities 3 and 4
    if (pLevel == 4 || pLevel == 3 ) {
     playContextSocializing(note);
    }
  } else if (context == Context.PRESENTING) {
    //We will only take priorities 4
    if (pLevel == 4) {
      playContextPresenting(note);
    }
  }
}
  
  public void playContextWorking(Notification note) {
      if (!note.getMessage().equals("")){
        ac.out.addInput(note.getSamplePlayerMessage());
      }
      ac.out.addInput(note.getSamplePlayerType());

      println("we got here");
      if (workingStart == 0) {
        prav = note; 
        workingStart++;
      } 
      println("prav " + prav.toString());
      print("timestamp ");
      print(note.getTimestamp() - prav.getTimestamp());
      print(" contentSummary ");
      println(note.getContentSummary());
      println("note " + note.toString());

      if (note.getType().toString().equals("Tweet")) {
        if (note.getRetweets() > 100 || note.getFavorites() > 100) {
          if (note.getTimestamp() - prav.getTimestamp() > 500 || note.getTimestamp() - prav.getTimestamp() == 0 ) {
            note.getSamplePlayerMessage().start();
          } else {
            note.getSamplePlayerType().start();
        }
        }
      } else if (note.getType().toString().equals("VoiceMail")) {
        if (note.getContentSummary() < 2 ) {
          if (note.getTimestamp() - prav.getTimestamp() > 500 || note.getTimestamp() - prav.getTimestamp() == 0 ) {
            note.getSamplePlayerType().start();
          } 
        }
      } else if (note.getType().toString().equals("Email")) {
        if (note.getContentSummary() < 2) {
          if (note.getTimestamp() - prav.getTimestamp() > 500 || note.getTimestamp() - prav.getTimestamp() == 0) {
            note.getSamplePlayerMessage().start();
          } else {
            note.getSamplePlayerType().start();
        }
        }
      } else if (note.getType().toString().equals("MissedCall")) {
          if (note.getTimestamp() - prav.getTimestamp() > 500 || note.getTimestamp() - prav.getTimestamp() == 0) {
            note.getSamplePlayerType().start();
          }
      } else if (note.getType().toString().equals("TextMessage")) {
        if (note.getContentSummary() < 2) {
          if (note.getTimestamp() - prav.getTimestamp() > 500 || note.getTimestamp() - prav.getTimestamp() == 0) {
            note.getSamplePlayerMessage().start();
          } else {
            note.getSamplePlayerType().start();
          }
        }
      }
      prav = note;
  }
  
  public void playContextWalking(Notification note) {
      if (!note.getMessage().equals("")){
        ac.out.addInput(note.getSamplePlayerMessage());
      }
      ac.out.addInput(note.getSamplePlayerType());
      println("we got here");
      if (walkingStart == 0) {
        prav = note; 
        walkingStart++;
      } 
      if (note.getType().toString().equals("Tweet")) {
        if (note.getPriorityLevel() > 2 ) {
            if (note.getTimestamp() - prav.getTimestamp() > 500 || note.getTimestamp() - prav.getTimestamp() == 0) {
              note.getSamplePlayerMessage().start();
            } else {
              note.getSamplePlayerType().start();
            }
        }
      } else if (note.getType().toString().equals("Email")) {
        if (note.getPriorityLevel() > 2) {
          if (note.getTimestamp() - prav.getTimestamp() > 500 || note.getTimestamp() - prav.getTimestamp() == 0) {
              note.getSamplePlayerMessage().start();
            } else {
              note.getSamplePlayerType().start();
            }
        }
      } else if (note.getType().toString().equals("TextMessage")) {
        if (note.getContentSummary() > 2) {
          if (note.getTimestamp() - prav.getTimestamp() > 500 || note.getTimestamp() - prav.getTimestamp() == 0) {
              note.getSamplePlayerMessage().start();
            } else {
              note.getSamplePlayerType().start();
            }
        }
      }  else if (note.getType().toString().equals("MissedCall")) {
          note.getSamplePlayerType().start();
      } else if (note.getType().toString().equals("VoiceMail")) {
            if (note.getTimestamp() - prav.getTimestamp() > 500 || note.getTimestamp() - prav.getTimestamp() == 0) {
              note.getSamplePlayerMessage().start();
            } else {
              note.getSamplePlayerType().start();
            }
        }
        prav = note;
      }
  
  
  
  
  
  public void playContextSocializing(Notification note) {
    if (!note.getMessage().equals("")){
        ac.out.addInput(note.getSamplePlayerMessage());
    }
    ac.out.addInput(note.getSamplePlayerType());
    if (socializingStart == 0) {
      prav = note; 
      socializingStart++;
    } 
    if (note.getType().toString().equals("Tweet")) {
      if (note.getRetweets() > 100 || note.getFavorites() > 100) {
        note.setSamplePlayer(getSamplePlayer("TweetPresentation.wav"));
        note.getSamplePlayerType().setToLoopStart();
        note.getSamplePlayerType().start();
      } else if (note.getContentSummary() >= 2 && note.getPriorityLevel() > 3) {
        note.getSamplePlayerType().start();
      }
    }  else if (note.getType().toString().equals("Email")) {
      if (note.getContentSummary() >= 2 && note.getPriorityLevel() > 3) {
         if (note.getTimestamp() - prav.getTimestamp() > 500 || note.getTimestamp() - prav.getTimestamp() == 0) {
              note.getSamplePlayerMessage().start();
            } else {
              note.getSamplePlayerType().start();
            }
        }
    } else if (note.getType().toString().equals("TextMessage")) {
      if (note.getContentSummary() >= 2 && note.getPriorityLevel() > 3) {
        note.getSamplePlayerType().start();
      }
    }  else if (note.getType().toString().equals("MissedCall")) {
      if (!(note.getContentSummary() < 2 && note.getPriorityLevel() == 3)) {
        note.getSamplePlayerType().start();
      }
        
    } else if (note.getType().toString().equals("VoiceMail")) {
            if (!(note.getContentSummary() < 2 && note.getPriorityLevel() == 3)) {
             if (note.getTimestamp() - prav.getTimestamp() > 500 || note.getTimestamp() - prav.getTimestamp() == 0) {
                note.getSamplePlayerMessage().start();
              } else {
                note.getSamplePlayerType().start();
              }
            }
    }
    prav = note;
  }

  public void playContextPresenting(Notification note) {
      if (!note.getMessage().equals("")){
          ac.out.addInput(note.getSamplePlayerMessage());
      }
      ac.out.addInput(note.getSamplePlayerType());
      if (note.getType().toString().equals("Tweet")) {
        note.setSamplePlayer(getSamplePlayer("TweetPresentation.wav"));
        note.getSamplePlayerType().setToLoopStart();
        ac.out.addInput(note.getSamplePlayerType());
        note.getSamplePlayerType().start();
        }  else if (note.getType().toString().equals("Email")) {
          note.setSamplePlayer(getSamplePlayer("EmailPresentation.wav"));
          note.getSamplePlayerType().setToLoopStart();
          ac.out.addInput(note.getSamplePlayerType());
          note.getSamplePlayerType().start();
      } else if (note.getType().toString().equals("TextMessage")) {
          note.setSamplePlayer(getSamplePlayer("TextMessagePresentation.wav"));
          note.getSamplePlayerType().setToLoopStart();
          ac.out.addInput(note.getSamplePlayerType());
          note.getSamplePlayerType().start();
      }  else if (note.getType().toString().equals("MissedCall")) {
          note.setSamplePlayer(getSamplePlayer("MissedCallPresentation.wav"));
          note.getSamplePlayerType().setToLoopStart();
          ac.out.addInput(note.getSamplePlayerType());
          note.getSamplePlayerType().start();
      } else if (note.getType().toString().equals("VoiceMail")) {
          note.setSamplePlayer(getSamplePlayer("VoiceMailPresentation.wav"));
          note.getSamplePlayerType().setToLoopStart();
          ac.out.addInput(note.getSamplePlayerType());
          note.getSamplePlayerType().start();
      }
  }
  /**
  public void rewind() {
    while (!old.isEmpty()) {
      Notification note = old.pop();
      
    
    
  }
  **/
  
  
  
  