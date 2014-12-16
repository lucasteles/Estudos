int led = 13;
int count = 0;

// the setup routine runs once when you press reset:
void setup() {                
  // initialize the digital pin as an output.
  pinMode(led, OUTPUT);     
  
  Serial.begin(9600); // set up Serial library at 9600 bps
  
 
  
}

// the loop routine runs over and over again forever:
void loop() {
  
  Serial.println("Ola! Sou o Arduino! " + String(count));
  
  digitalWrite(led, HIGH);   // turn the LED on (HIGH is the voltage level)
  Verif();
  delay(2000);               // wait for a second
  digitalWrite(led, LOW);    // turn the LED off by making the voltage LOW
  Verif();
  delay(1000);               // wait for a second
  
  |
  count++;
}


void Verif()
{
  if (digitalRead(led)==1)
  {
    Serial.println("Led Ligado...") ;
  }
  else
  {
    Serial.println("Led Desligado...") ;
  }
  
}
