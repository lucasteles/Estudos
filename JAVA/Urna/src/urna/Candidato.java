/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package urna;


public class Candidato {
    public String cNome     = "";
    public int nPartido     = 0;
    public int nVotos       = 0;
    public boolean lInativo = false;

    public Candidato(int tnPartido)
    {
        nPartido = tnPartido;
    }

    public Candidato(String tcNome,int tnPartido)
    {
        cNome       = tcNome;
        nPartido    = tnPartido;
    }

    public Candidato(String tcNome,int tnPartido,int tnVotos)
    {
        cNome       = tcNome;
        nPartido    = tnPartido;
        nVotos      = tnVotos;
    }

    public void Vota()
    {
        nVotos++;
    }
    
    public boolean VerifNulo(){
        return cNome.trim().toUpperCase().equals("NULO"); 
    }
}
