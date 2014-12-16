
package polinomios;


public class Node {
    
    private double Coeficiente,Expoente;
    private Node prox;

    public double getDado(boolean Tipo) {
        
        double nRet;
        
        if (Tipo)
            nRet = Coeficiente;
        else
            nRet = Expoente;
               
        
        return nRet;
    }
    
    public void setDado(double nCoeficiente,double nExpoente) {
            
        Coeficiente = nCoeficiente;
        Expoente    = nExpoente;
        
    }
    public Node getProx() {
            return prox;
    }
    public void setProx(Node prox) {
            this.prox = prox;
	}
}
