//**************************//
//       Bionic Arm        //
//**************************//

#include <AFMotor.h>

// declaraão de variaveis dos motores
AF_DCMotor BaseHoriz(1);
AF_DCMotor BaseVert(2);
AF_DCMotor Braco(3);
AF_DCMotor Pinca(4);

//Variaveis de auxilio
String cEntrada="";
int posBraco,posBaseHoriz,posBaseVert,posPinca;
int nPinca;
int parBraco[2],parBaseHoriz[2],parBaseVert[2];
int nEntrada=0;


void setup()
{
  Serial.begin(9600);           // set up Serial library at 9600 bps
  Serial.println("BionicArm...");
  
  // turn on motors
  BaseHoriz.setSpeed(100);
  BaseVert.setSpeed(100);
  Braco.setSpeed(100);
  Pinca.setSpeed(100);
 
  BaseHoriz.run(RELEASE);
  BaseVert.run(RELEASE);
  Braco.run(RELEASE);
  Pinca.run(RELEASE);
  
  // 0 min -  1 max
  parBraco[0] = 117;
  parBraco[1] = 1020;

  parBaseHoriz[0] = 665;
  parBaseHoriz[1] = 895;

  parBaseVert[0] = 195;
  parBaseVert[1] = 204;
  
  posBraco=0;
  posBaseHoriz=0;
  posBaseVert=0;
  
   
}

void loop(){
    
    
    if (!LerEntradas())
    {
       return; 
    }

    int pos1,pos2,pos3;
    int anal1,anal2,anal3;
    
    anal1=analogRead(0);
    anal2=analogRead(1);
    anal3=analogRead(2);
    
    if (posBaseHoriz != 0)
      pos1 = (map(posBaseHoriz, 0, 100, parBaseHoriz[0], parBaseHoriz[1]));
      
    if (posBaseVert != 0)
      pos2 = (map(posBaseVert,0, 100, parBaseVert[0], parBaseVert[1]));
    
    if (posBraco != 0)  
      pos3 = (map(posBraco,0, 100, parBraco[0], parBraco[1]));
    
    
    
    if (MoverMotor(BaseHoriz, anal1, pos1, 100, 100))
     { posBaseHoriz = 0;}
    
    if (MoverMotor(BaseVert, anal2, pos2, 110,50))
     { posBaseVert = 0;}
    
    
    //if (MoverMotor(Braco, anal3, pos3, parBraco))
     // {posBraco = 0; }
        
    ///delay(2000);
    xx();
    Serial.println(String(anal2)+" - "+String(pos2));
    
}

// funcao de leitura de oarametros de posição dois motores
boolean LerEntradas()
{
  if (posBaseHoriz!=0 || posBaseVert!=0 || posBraco!=0 || posPinca!=0)
  {
      return true;
  }
  
  if (Serial.available() == 0) {
     return false; 
  }
  
  
  char aux;
  aux =Serial.read();
  cEntrada = cEntrada + aux;
  nEntrada++;  
  if( nEntrada == 10)
  {
     

    posBaseHoriz = ctoi(cEntrada.substring(1,3));
    posBaseVert  = ctoi(cEntrada.substring(4,6));
    posBraco     = ctoi(cEntrada.substring(7,9));
    posBraco     = ctoi(cEntrada.substring(10,10));
    cEntrada     = "";
    nEntrada     = 0;
Serial.println(String(posBaseVert));
    return true;
  }
  else
  {
    return false;
  }
  
  
  
  
}

int ctoi(String cNumber)
{
 // char cAux[cNumber.length()]; 
  //cNumber.toCharArray(cAux, cNumber.length());
 //int(cAux);  
  
 return cNumber.toInt();
}

boolean MoverMotor(AF_DCMotor Motor,int nAnal,int nDestino,int Speed1,int Speed2)
{
    
      
    int Anal = nAnal;
    
    if (nDestino == 0)
      return true;
    
    if(Anal > nDestino )
    {
      Motor.setSpeed(Speed1);       
      Motor.run(BACKWARD);
      delay(50);
      Motor.run(RELEASE);
      return false;
    }
    
    if(Anal < nDestino )
    {
      Motor.setSpeed(Speed2);
      Motor.run(FORWARD);
      delay(50);
      Motor.run(RELEASE);
      return false;
    }
    
    return true;
    
}
 
void xx()
{
  Serial.println("------------------------------------");
  Serial.println("Motor 1 pos:"+String(analogRead(A0))+" - "+String(posBaseHoriz));  
  Serial.println("Motor 2 pos:"+String(analogRead(A1))+" - "+String(posBaseVert));  
  Serial.println("Motor 3 pos:"+String(analogRead(A2))+" - "+String(posBraco));  
     
  
}
