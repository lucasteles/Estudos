/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cinemafilmes;

import java.sql.Time;
import sun.util.calendar.BaseCalendar;

/**
 *
 * @author rmendonca
 */
public class Ingresso {
    public Filme oFilme             = null;
    public Horario oHorario         = null;
    private float nMatine,nNoturno  = 0;
    public Horario dLimite = new Horario("18:00:00");
    
    public Ingresso(Filme toFilme,Horario toHorario)
    {
        oFilme   = toFilme;
        oHorario = toHorario;
    }
    
    public void SetValor(float tnValor,Horario toHorario)
    {    
        if (toHorario.dHora.getTime() >= dLimite.dHora.getTime()) {
            nMatine = 5;
        }
        else{
            nNoturno = 10;
        }
        
    }
    public float GetValor(Horario toHorario)
    {
        if (toHorario.dHora.getTime() > dLimite.dHora.getTime()) {
            return(nMatine);
        }
        else{
            return(nNoturno);
        }
        
    }
    public float GetValorMeia(Horario toHorario)
    {
        
        return(GetValor(toHorario)/2);
    }
}
