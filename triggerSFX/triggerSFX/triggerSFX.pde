import processing.serial.*;
import ddf.minim.*;

Minim minim;
AudioPlayer[] players;
AudioPlayer background;

boolean soundPlaying = false;

Serial port; // Create a Serial object

void setup() {
  size(400, 400);
  minim = new Minim(this);
  players = new AudioPlayer[7];
  players[0] = minim.loadFile("gentle_downpour.wav");  // Replace with your audio files
  players[1] = minim.loadFile("macaw_sings.wav");
  players[2] = minim.loadFile("thunder_crackle.wav");
  players[3] = minim.loadFile("tiger_roar.mp3");
  players[4] = minim.loadFile("leaves_dance.wav");
  players[5] = minim.loadFile("monkey_shout.wav");
  
  background = minim.loadFile("forest.wav", 2048);
  //players[6] = minim.loadFile("sound7.mp3");

  port = new Serial(this, "COM8", 9600); // Replace "COM8" with your Arduino's port if needed
}

void draw() {
  // If the sound is not already playing, start playing it
    if (!soundPlaying) {
       background.loop(); // Make the sound loop
       soundPlaying = true;
    }
  
  while (port.available() > 0) {
    String input = port.readStringUntil('\n');
    if (input != null) {
      input = input.trim();
      handleTouch(input);
    }
  }
}

void handleTouch(String sensor) {
  int soundIndex = getSoundIndexForSensor(sensor);
  if (soundIndex != -1) {
    players[soundIndex].rewind();
    players[soundIndex].play();
  }
}

int getSoundIndexForSensor(String sensor) {
  switch(sensor) {
    case "A4 touched!":
      return 0; // Index for gentle_downpour.wav
      
    case "A5 touched!":
      return 1; // Index for macaw_sings.wav
      
    case "A6 touched!":
      return 2; // Index for thunder_crackle.wav
      
    case "A7 touched!":
      return 3; // Index for tiger_roar.mp3
      
    case "A1 touched!":
      return 4; // Index for leaves_dance.mp3
      
    case "A2 touched!":
      return 5; // Index for monkey_shout.wav
      
    //case "A3 touched!":
      //return 6; // Index for sound7.mp3
      
    default:
      return -1; // No sound for other cases
  }
}

void stop() {
  for (AudioPlayer player : players) {
    player.close();
  }
  minim.stop();
  super.stop();
}
