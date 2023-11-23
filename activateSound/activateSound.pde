import processing.serial.*;
import ddf.minim.*;

Serial myPort;  // Serial port
int brightness;
float lightLevel;

Minim minim;
AudioPlayer player;

boolean soundPlaying = false;

void setup() {
  size(1920, 1080);
  String portName = "/dev/cu.usbmodem14201"; // Replace with the correct port name
  myPort = new Serial(this, portName, 9600);

  // Initialize Minim and create an AudioPlayer
  minim = new Minim(this);
  player = minim.loadFile("forest.wav", 2048);
}

void draw() {
  // Get data from Arduino
  while (myPort.available() > 0) {
    String inData = myPort.readStringUntil('\n');
    if (inData != null) {
      // Trim to remove leading/trailing whitespaces
      inData = inData.trim();

      // Check if the data starts with "Brightness:"
      if (inData.startsWith("Brightness: ")) {
        // Extract the brightness value
        brightness = int(inData.substring(12));

        // Set the background color based on the brightness value
        background(0, brightness, 0); // Green background

        // Optionally, you can display the brightness value
        fill(255);
        text("Brightness: " + brightness, 10, 20);

        // Check if the light level is over 100
        if (lightLevel > 100) {
          // If the sound is not already playing, start playing it
          if (!soundPlaying) {
            player.loop(); // Make the sound loop
            soundPlaying = true;
          }

          // Adjust the volume based on the brightness (you may need to adjust the mapping)
          float volume = map(brightness, 0, 1023, 0, 1);
          player.setGain(volume);
        } else {
          // If the sound is playing, stop it
          if (soundPlaying) {
            player.pause();
            soundPlaying = false;
          }
        }
      } else if (inData.startsWith("Light level: ")) {
        // Extract the light level value
        lightLevel = float(inData.substring(13));

       
        fill(255);
        text("Light Sensor: " + lightLevel, 10, 40);
      }
    }
  }
}

void stop() {
  // Close Minim and stop the player when the sketch is stopped
  player.close();
  minim.stop();
  super.stop();
}
