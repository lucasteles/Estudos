
package aeroportosimulator;

public class Airplane {
    public String IdCompany = ""; // codigo do aeroporto de origem
    public int id = 0;                  // codigo numerico do aviao
    int Fuel = 0;                // Nivel de combustivel do aviao 
    String AirportDest = "";     // aeroporto do destino do aviao
    boolean warning = false;     // flag de emergencia
    int FlyTime = 0;
    int TotalFlyTime = 0;
    int WaitTime=0;
    
    public Airplane(String cCompany, int nId, int nFuel,int nTime, String cDest, boolean lWarning)
    {
        this.IdCompany = cCompany;
        this.id = nId;
        this.Fuel = nFuel;
        this.warning = lWarning;
        this.FlyTime = nTime;
        this.TotalFlyTime = nTime;
        
      
    }
    
    public String getName()
    {
        return this.IdCompany +  String.format("%04d", this.id);
    }
    
    public int getFuel()
    {
        return this.Fuel;
    }
    
  public int getFlyTime()
  {
      return this.FlyTime;
  }
    
}
