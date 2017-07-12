  //Changes event stream on press


public void PlayJSON1() {
      server.stopEventStream(); //always call this before loading a new stream
      server.loadEventStream(eventDataJSON1);
      socializingStart = 0;
      workingStart = 0;
      walkingStart = 0;
      presentingStart = 0;
      println("**** New event stream loaded: " + eventDataJSON1 + " ****");
}

public void PlayJSON2() {
      server.stopEventStream(); //always call this before loading a new stream
      server.loadEventStream(eventDataJSON2);
      socializingStart = 0;
      workingStart = 0;
      walkingStart = 0;
      presentingStart = 0;
      println("**** New event stream loaded: " + eventDataJSON2 + " ****");
}

public void PlayJSON3() {
      server.stopEventStream(); //always call this before loading a new stream
      server.loadEventStream(eventDataJSON3);
      socializingStart = 0;
      workingStart = 0;
      walkingStart = 0;
      presentingStart = 0;
      println("**** New event stream loaded: " + eventDataJSON3 + " ****");
}