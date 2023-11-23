import processing.serial.*;

Serial myPort;  // Serial port
int brightness;

void setup() {
  size(1920, 1080);
  String portName = "/dev/cu.usbmodem14201"; // Replace with the correct port name
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  // Get data from potentiometer
  while (myPort.available() > 0) {
    String inData = myPort.readStringUntil('\n');
    if (inData != null) {
      // Trim to remove leading/trailing whitespaces and convert to an integer
      int sensorValue = int(inData.trim());

      // Map the sensor values (potentiometer range) to the brightness range (0-255)
      brightness = int(map(sensorValue, 0, 1023, 0, 255));

      // Set the background color based on the mapped brightness value
      background(0, brightness, 0); // Green background

      // Optionally, you can display the brightness value
      fill(255);
      text("Brightness: " + brightness, 10, 20);
    }
  }
}
