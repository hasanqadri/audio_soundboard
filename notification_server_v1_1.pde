
//name of a file to load from the data directory
String eventDataJSON1 = "ExampleData_1.json";
String eventDataJSON2 = "ExampleData_2.json";
String eventDataJSON3 = "ExampleData_3.json";
int currentlySelected;
NotificationServer server;
ArrayList<Notification> notifications;
int start = 0;
NotifEvents notifEvent;
Notification curr = null;
Notification prev = null; //<>//

//in your own custom class, you will implement the NotificationListener interface 
//(with the notificationReceived() method) to receive Notification events as they come in
class NotifEvents implements NotificationListener {
  
  public NotifEvents () {
  }
 
  //this method must be implemented to receive notifications
  public void notificationReceived(Notification notification) {  //<>//
    String debugOutput = "";
    switch (notification.getType()) {
      case Tweet:
        debugOutput += "New tweet from ";
        break;
      case Email:
        debugOutput += "New email from ";
        break;
      case VoiceMail:
        debugOutput += "New voicemail from ";
        break;
      case MissedCall:
        debugOutput += "Missed call from ";
        break;
      case TextMessage:
        debugOutput += "New message from ";
        break;
    }
    debugOutput += notification.getSender() + ", " + notification.getMessage();
    //println(debugOutput);
    start++;
    noteSamplePlayer(notification);
    pq.add(notification); //<>//
    engineHeart();

  }
  
    public void noteSamplePlayer(Notification note) {
      //Type
      note.setSamplePlayer(getSamplePlayer(note.getType().toString() + ".wav"));
      note.getSamplePlayerType().setToLoopStart();
      note.getSamplePlayerType().pause(true);
      //Message
      if (!note.getMessage().equals("")) {
        String ttsFilePath = ttsMaker.createTTSWavFile(note.getMessage());
        note.setSamplePlayerMsg(getSamplePlayer(ttsFilePath, true)); 
        note.getSamplePlayerMessage().setToLoopStart();
        note.getSamplePlayerMessage().pause(true);
      }

  }
}