/**
boolean voiceMail = false;
boolean email = false;
boolean phoneCall = false;
boolean textMessage = false;
boolean twitter = false;
enum Context {WORKING, WALKING, SOCIALIZING, PRESENTING};
Context context;
**/

//Tweets take lowest priority of the four, but after that content summary decides order, where the more negative the higher its priority
//Sonifying type, sender, message
//If tweet, play twitter sound
//If phone call, phone call sound
//If voice mail, play "you have one new voice message"
// email, then email jingle
//TTS for sender and message

public void engine(Notification notif) {
  
  if (context == Context.WORKING) {
    //We will go through all priority levels of 1 through 4
    
  } else if (context == Context.WALKING) {
    //We will go through priorities 2 thorugh 4
    
  } else if (context == Context.SOCIALIZING) {
    //We will take priorities 3 and 4
    
  } else if (context == Context.PRESENTING) {
    //We will only take priorities 4
    
  }
}