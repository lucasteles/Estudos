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
int posBraco,posPinca,posBaseHoriz,posBaseVert;
int nEntrada=0;


void setup()
{
  Serial.begin(9600);           // set up Serial library at 9600 bps
  Serial.println("BionicArm... Astalavista Baby!");
  
  
  // turn on motors
  BaseHoriz.setSpeed(200);
  BaseVert.setSpeed(200);
  Braco.setSpeed(200);
  Pinca.setSpeed(200);
 
  BaseHoriz.run(RELEASE);
  BaseVert.run(RELEASE);
  Braco.run(RELEASE);
  Pinca.run(RELEASE);
  
  posBraco=180;
  posPinca=180;
  posBaseHoriz=180;
  posBaseVert=180;
   
}

void loop(){
     
    if (!LerEntradas())
    {
       return; 
    }

    int pos1,pos2,pos3,pos4;
    int anal1,anal2,anal3,anal4;
    
    anal1=analogRead(0);
    anal2=analogRead(1);
    anal3=analogRead(2);
    anal4=analogRead(3);
    
    pos1 = (map(posBaseHoriz,0,360,0,1023));
    pos2 = (map(posBaseVert,0,360,0,1023));
    pos3 = (map(posBraco,0,360,0,1023));
    pos4 = (map(posPinca,0,360,0,1023));
    
   if(comparar(pos1,anal1))
   {
     posBaseHoriz=0;
   }
   else
   {MoverMotor(BaseHoriz,anal1,pos1);}
   
   if(comparar(pos2,anal2))
   {
     posBaseVert=0;
   }
   else
   {MoverMotor(BaseVert,anal2,pos2);}
   
   if(comparar(pos3,anal3))
   {
      posBraco=0;
   }
   else
   {MoverMotor(Braco,anal3,pos3);}
   
   if(comparar(pos4,anal4))
   {
     posPinca=0;
   }
   else
   {MoverMotor(Pinca,anal4,pos4);}
    
    
  
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
  
  if( nEntrada == 12)
  {
    posBaseHoriz = ctoi(cEntrada.substring(1,3));
    posBaseVert  = ctoi(cEntrada.substring(4,6));
    posBraco     = ctoi(cEntrada.substring(7,9));
    posPinca     = ctoi(cEntrada.substring(10,12));
    cEntrada     = "";
    nEntrada     = 0;
    return true;
  }
  else
  {
    return false;
  }
  
}

int ctoi(String cNumber)
{
  char cAux[cNumber.length()]; 
  cNumber.toCharArray(cAux, cNumber.length());
 return int(cAux);  
}

void MoverMotor(AF_DCMotor Motor,int nAnal,int nDestino)
{
    
    int Anal = nAnal;
    if(nDestino >= 512)
    {
      if(Anal < nDestino)
      {
        Motor.run(BACKWARD);
        delay(200);
        Motor.run(RELEASE);
      }
      else
      {
        Motor.run(FORWARD);
        delay(200);
        Motor.run(RELEASE);
      }
    }
    else
    {
      if(Anal < nDestino)
      {
        Motor.run(BACKWARD);
        delay(200);
        Motor.run(RELEASE);
      }
      else
      {
        Motor.run(FORWARD);
        delay(200);
        Motor.run(RELEASE);
      }
    }
  
}
 
boolean comparar(int n1,int n2)
{
   double n3 = 0.05 * n2;
   if(n1 >= (n2-n3) && n1 <= (n2+n3) )
   {
     return true;
   }
   else
   {
     return false;
   }
  
}
