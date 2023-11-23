#include <Servo.h>
#include <Adafruit_CircuitPlayground.h>

int count = 0;
float motionZLevel;

Servo myServo;
bool servoInMotion = false;

void setup() {
  CircuitPlayground.begin();
  Serial.begin(9600);
  myServo.attach(A3);
  pinMode(13, OUTPUT);
}

void loop() {
  // get the motion levels for Z axis
  motionZLevel = CircuitPlayground.motionZ();

  count++;

  Serial.print("Motion level Z: ");
  Serial.println(motionZLevel);

  if (motionZLevel < 0) {
    if (!servoInMotion) {
      myServo.attach(A3); // Reattach the servo
      servoInMotion = true;
    }
    servoRunning(); // Run the servo continuously
  } else {
    if (servoInMotion) {
      // Stop the servo when motionZLevel is > 0
      myServo.detach(); // Detach the servo
      servoInMotion = false; // Update the flag
    }
  }
}

void servoRunning() {
  for (int i = 0; i <= 180; i++) {
    myServo.write(i);
    delay(15);
  }
  for (int i = 180; i >= 0; i--) {
    myServo.write(i);
    delay(15);
  }
  digitalWrite(13, digitalRead(4));
}
