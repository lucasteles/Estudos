

#include <AFMotor.h>

AF_DCMotor motor1(1);
AF_DCMotor motor2(2);
AF_DCMotor motor3(3);
AF_DCMotor motor4(4);

int nMotor1[2],nMotor2[2],nMotor3[2];
char lido;

void setup() {
  Serial.begin(9600);           // set up Serial library at 9600 bps
  Serial.println("Bionic-Arm...");
  
  // turn on motor 
  motor1.run(RELEASE);
  motor2.run(RELEASE);
  motor3.run(RELEASE);
  motor4.run(RELEASE);
  
  // 0 min -  1 max
  nMotor3[0] = 30;
  nMotor3[1] = 1020;

  nMotor1[0] = 665;
  nMotor1[1] = 895;

  nMotor2[0] = 195;
  nMotor2[1] = 244;
  

  
}

void loop() {
  
  if (Serial.available() != 0) {
    lido = Serial.read();
    int Anal = 0;
       
    if (lido=='Q')
    {
      Anal = analogRead(A0);
      
      if (Anal <= nMotor1[0])
        return;
      
      motor1.setSpeed(100);
      motor1.run(BACKWARD);
      delay(60);
      motor1.run(RELEASE);
      xx();
    }
    
    if (lido=='W')
    {
      Anal = analogRead(A0);
      
      if (Anal >= nMotor1[1])
        return;
      
      motor1.setSpeed(100);
      motor1.run(FORWARD);
      delay(60);
      motor1.run(RELEASE);
      xx();
    }
  
    if (lido=='E')
    {
      Anal = analogRead(A1);
      
      
      if (Anal >= nMotor2[1])
        return;
      
      motor2.setSpeed(50);
      
      motor2.run(FORWARD);
      delay(60);
      motor2.run(RELEASE);
      xx();
    }
    
    if (lido=='R')
    {
      Anal = analogRead(A1);
      
      if (Anal <= nMotor2[0])
        return;
      
      motor2.setSpeed(150);
      motor2.run(BACKWARD);
      delay(100);
      motor2.run(RELEASE);
      xx();
    }
  
    if (lido=='T')
    {
      Anal = analogRead(A2);
      
      if (Anal <= nMotor3[0])
        return;
      
      motor3.setSpeed(180);      
      motor3.run(BACKWARD);
      delay(60);
      motor3.run(RELEASE);
      xx();
    }
    
    if (lido=='Y')
    {
      Anal = analogRead(A2); 
 
 
      
      if (Anal >= nMotor3[1])
        return;
      
     
      motor3.setSpeed(80); 
      motor3.run(FORWARD);
      delay(60);
      motor3.run(RELEASE);
      xx();
    }
    
  
    if (lido=='A')
    {
            
      motor4.setSpeed(250);
      motor4.run(BACKWARD);
      //delay(1800);
      //motor4.run(RELEASE);
      xx();
    }
    
    if (lido=='S')
    {
      motor4.run(RELEASE);
      motor4.setSpeed(250);
      motor4.run(FORWARD);
      delay(1000);
      motor4.run(RELEASE);
      xx();
    }
    
  
  }
   
 }
 
void xx()
{
  Serial.println("------------------------------------");
  Serial.println("Motor 1 pos:"+String(analogRead(A0)));  
  Serial.println("Motor 2 pos:"+String(analogRead(A1)));  
  Serial.println("Motor 3 pos:"+String(analogRead(A2)));  
     
  
}

