CheckBox checkbox;  
  
public void ui() {
    
  p5.addButton("Working")
    .setPosition(130,10)
    .setSize(40,40)
    .activateBy(ControlP5.RELEASE);
  
  p5.addButton("Walking")
    .setPosition(130,55)
    .setSize(40,40)
    .activateBy(ControlP5.RELEASE);
   
  p5.addButton("Socializing")
    .setPosition(130, 100)
    .setSize(40,40)
    .activateBy(ControlP5.RELEASE);
  
  p5.addButton("Presenting")
    .setPosition(130,145)
    .setSize(40,40)
    .activateBy(ControlP5.RELEASE);
  
    
  p5.addButton("Heartbeat")
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
}