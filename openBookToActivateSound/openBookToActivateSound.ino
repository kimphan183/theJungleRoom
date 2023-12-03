#include <Adafruit_CircuitPlayground.h>

#define ANALOGPIN      A1  // Potentiometer connected to A1 

int delayval = 500;        // delay for half a second

float lightLevel;

void setup() {
   CircuitPlayground.begin();
   Serial.begin(9600);   
}

void loop() {
   int value;

   value = analogRead(ANALOGPIN); // analog read of potentiometer

   Serial.print("Brightness: "); 
   Serial.println(value);   // print value

   lightLevel = CircuitPlayground.lightSensor();
   
   Serial.print("Light level: "); 
   Serial.println(lightLevel);

   delay(delayval);         // Delay for a period of time (in milliseconds).

   
}
