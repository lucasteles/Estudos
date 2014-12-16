int LED = 11;

void setup() {
  pinMode(LED, OUTPUT);
}

void loop() {
  for (int i = 0; i <= 100; i++) {
    analogWrite(LED, i);
    delay(5);
  }
  
  for (int i = 100; i > 0; i--) {
    analogWrite(LED, i);
    delay(5);
  }
  
  
  
}
