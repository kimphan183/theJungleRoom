#include <Adafruit_CircuitPlayground.h>

int touchThreshold = 800; // Adjust the touch sensitivity threshold as needed

void setup() {
  CircuitPlayground.begin();
  Serial.begin(9600);
}

void loop() {
    if (CircuitPlayground.readCap(3) > touchThreshold) { //CORRECT NO TOUCH
    Serial.println("A4 touched!");
    delay(100); // Delay for debouncing
    CircuitPlayground.setPixelColor(1, 255, 255, 255);
    delay(300);
    CircuitPlayground.setPixelColor(1, 0, 0, 0);
  }
  if (CircuitPlayground.readCap(2) > touchThreshold) { //CORRECT NO TOUCH
    Serial.println("A5 touched!");
    delay(100); // Delay for debouncing
    CircuitPlayground.setPixelColor(2, 255, 255, 255);
    delay(300);
    CircuitPlayground.setPixelColor(2, 0, 0, 0);
  }
  // break 

  if (CircuitPlayground.readCap(0) > touchThreshold) { //CORRECT NO TOUCH
    Serial.println("A6 touched!"); 
    delay(100); // Delay for debouncing
    CircuitPlayground.setPixelColor(3, 255, 255, 255);
    delay(300);
    CircuitPlayground.setPixelColor(3, 0, 0, 0);
  }
  if (CircuitPlayground.readCap(1) > touchThreshold) { //CORRECT NO TOUCH
    Serial.println("A7 touched!"); 
    delay(100); // Delay for debouncing
    CircuitPlayground.setPixelColor(4, 255, 255, 255);
    delay(300);
    CircuitPlayground.setPixelColor(4, 0, 0, 0);
  }
  // break 

  if (CircuitPlayground.readCap(6) > touchThreshold) { //CORRECT NO TOUCH
    Serial.println("A1 touched!"); 
    delay(100); // Delay for debouncing
    CircuitPlayground.setPixelColor(6, 255, 255, 255);
    delay(300);
    CircuitPlayground.setPixelColor(6, 0, 0, 0);
  }
  // break 

  if (CircuitPlayground.readCap(9) > touchThreshold) { //CORRECT NO TOUCH
    Serial.println("A2 touched!");
    delay(100); // Delay for debouncing
    CircuitPlayground.setPixelColor(8, 255, 255, 255);
    delay(300);
    CircuitPlayground.setPixelColor(8, 0, 0, 0);
  }
  if (CircuitPlayground.readCap(10) > touchThreshold) { //CORRECT NO TOUCH
    Serial.println("A3 touched!");
    delay(100); // Delay for debouncing
    CircuitPlayground.setPixelColor(9, 255, 255, 255);
    delay(300);
    CircuitPlayground.setPixelColor(9, 0, 0, 0);
  }

  delay(10);
}
