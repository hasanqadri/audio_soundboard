public void setupGliders() {
  pbSlide = new Glide(ac, 1, 30);
  gainSlide = new Glide(ac, 1, 50);
  g = new Gain(ac, 1, gainSlide);
  
  workingOut.setRate(pbSlide);
  walking.setRate(pbSlide);
  socializing.setRate(pbSlide);
  presenting.setRate(pbSlide);
  //music.setRate(pbSlide);
  //music2.setRate(pbSlide);
  //music3.setRate(pbSlide);

  rateValue = new Gain(ac, 1, gainSlide);
  rateValue.addInput(heartbeat);
  gainSlide.setValue(.01);
  //rateValue.addInput(music);
  //rateValue.addInput(music2);
  //rateValue.addInput(music3);
  ac.out.addInput(rateValue);
}

public void GainSlider(int newgain) {
  gainSlide.setValue(newgain/50.0);
  println("Gain slider pressed " + gainSlide.getValue());
}

public void PbSlider(int newpb) {
 pbSlide.setValue(newpb); 
}