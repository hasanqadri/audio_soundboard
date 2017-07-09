CheckBox checkbox;  
  
  public void ui() {
  p5.addButton("PlayWorking")
  .setPosition(130,10)
  .setSize(40,40)
  .activateBy(ControlP5.RELEASE);
  
  p5.addButton("PlayWalking")
  .setPosition(130,55)
  .setSize(40,40)
  .activateBy(ControlP5.RELEASE);
   
  p5.addButton("PlaySocializing")
  .setPosition(130, 100)
  .setSize(40,40)
  .activateBy(ControlP5.RELEASE);
  
  p5.addButton("PlayPresenting")
  .setPosition(130,145)
  .setSize(40,40)
  .activateBy(ControlP5.RELEASE);
  
    
  p5.addButton("PlayHeartbeat")
  .setPosition(240,10)
  .setSize(40,40)
  .activateBy(ControlP5.RELEASE);
  
    p5.addButton("PlayJSON1")
  .setPosition(240,55)
  .setSize(40,40)
  .activateBy(ControlP5.RELEASE);
  
    p5.addButton("PlayJSON2")
  .setPosition(240,100)
  .setSize(40,40)
  .activateBy(ControlP5.RELEASE);
  
   p5.addButton("PlayJSON3")
  .setPosition(240,145)
  .setSize(40,40)
  .activateBy(ControlP5.RELEASE);

  checkbox = p5.addCheckBox("PlayEvents")
    .setPosition(10, 10)
    .setColorForeground(color(120))
    .setColorActive(color(255))
    .setColorLabel(color(255))
    .setSize(40, 40)
    .setItemsPerRow(1)
    .setSpacingColumn(5)
    .setSpacingRow(5)
    .addItem("Voice Mail", 0)
    .addItem("Twitter", 1)
    .addItem("Email", 2)
    .addItem("Phone Call", 3)
    .addItem("Text Message", 4);

   /**
  p5.addButton("PlayMusic1")
  .setPosition(120,60)
  .setSize(40,40)
  .activateBy(ControlP5.RELEASE);
  
  p5.addButton("PlayMusic2")
  .setPosition(120,110)
  .setSize(40,40)
  .activateBy(ControlP5.RELEASE);
  
  p5.addButton("PlayMusic3")
  .setPosition(120,160)
  .setSize(40,40)
  .activateBy(ControlP5.RELEASE);
  
  p5.addSlider("PbSlider")
  .setPosition(10,5)
  .setSize(20,100)
  .setRange(1, 10)
  .setValue(1)
  .setLabel("Speedup");
**/
/**
  p5.addSlider("GainSlider")
  .setPosition(10,125)
  .setSize(20,100)
  .setRange(0,100)
  .setValue(50)
  .setLabel("Gain");  **/
  }