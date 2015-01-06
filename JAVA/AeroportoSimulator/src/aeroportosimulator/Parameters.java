package aeroportosimulator;

public enum Parameters {
  SECOND_PER_TIME(2), //segundos para cada tempo 
  K(5), 
  C(10),
  V(100),
  T(10),
  SEED(0);
  
  
  
        
  private double Value;
  
  Parameters(double Value){
   this.Value = Value;
  }

   public double get(){
   return this.Value;
  }
    
}
