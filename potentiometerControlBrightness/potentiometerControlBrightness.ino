#include <Adafruit_CircuitPlayground.h>

#define ANALOGPIN      A1  // Potentiometer connected to A1 

int delayval = 500;        // delay for half a second

void setup() {
   CircuitPlayground.begin();
   Serial.begin(9600);   
}

void loop() {
   int value;

   value = analogRead(ANALOGPIN); // analog read of potentiometer

   Serial.println(value);   // print value

   delay(delayval);         // Delay for a period of time (in milliseconds).
}
