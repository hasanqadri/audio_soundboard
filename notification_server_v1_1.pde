
//name of a file to load from the data directory
String eventDataJSON1 = "ExampleData_1.json";
String eventDataJSON2 = "ExampleData_2.json";
String eventDataJSON3 = "ExampleData_3.json";
int currentlySelected;
NotificationServer server;
ArrayList<Notification> notifications;
int start = 0;
NotifEvents notifEvent;

void setupServer() {
  
  //START NotificationServer setup
  server = new NotificationServer();
  
  //instantiating a custom class (seen below) and registering it as a listener to the server
  notifEvent = new NotifEvents();
  server.addListener(notifEvent);
  
  //loading the event stream, which also starts the timer serving events
  //server.loadEventStream(eventDataJSON2);
  currentlySelected = 1;
  //END NotificationServer setup
  
}

void keyPressed() {
  //example of stopping the current event stream and loading the second one
  if (key == RETURN || key == ENTER) {
    if (currentlySelected == 1) {
      server.stopEventStream(); //always call this before loading a new stream
      server.loadEventStream(eventDataJSON2);
      println("**** New event stream loaded: " + eventDataJSON2 + " ****");
    } else if (currentlySelected == 2) {
      server.stopEventStream(); //always call this before loading a new stream
      server.loadEventStream(eventDataJSON3);
      println("**** New event stream loaded: " + eventDataJSON3 + " ****");
    } else if (currentlySelected == 3) {
      server.stopEventStream(); //always call this before loading a new stream
      server.loadEventStream(eventDataJSON1);
      println("**** New event stream loaded: " + eventDataJSON1 + " ****");
    }
  }
    
}


//in your own custom class, you will implement the NotificationListener interface 
//(with the notificationReceived() method) to receive Notification events as they come in
class NotifEvents implements NotificationListener {
  
  public NotifEvents () {
  }
  
  //this method must be implemented to receive notifications
  public void notificationReceived(Notification notification) { 
    //println("<NotifEvents> " + notification.getType().toString() + " notification received at " 
    //+ Integer.toString(notification.getTimestamp()) + "millis.");
    
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
      if (start == 0) {
        pq.add(notification);
        engineHeart();
        start++;
      }//else {
//pq.add(notification);
      //  engine();
     // }
    
   //You can experiment with the timing by altering the timestamp values (in ms) in the exampleData.json file
    //(located in the data directory)
  }
}