package Classes;

import java.awt.Color;
import java.awt.Point;

/**
 *
 * @author rmendonca
 */
public class Mouse extends Design{
    //Propriedades da Classe
    //Publics
    public int nButton        = 0;
    public int nX             = 0;
    public int nY             = 0;
    public int nLastX         = 0;
    public int nLastY         = 0;
    public int nXup           = 0;
    public int nYup           = 0;
    public int nXdown         = 0;
    public int nYdown         = 0;
    public boolean lClick     = false;  
    
    public Mouse(){
    }
    
    public void MouseMove(java.awt.event.MouseEvent evt){
        nLastX = nX;
        nLastY = nY;
        nX = evt.getX();
        nY = evt.getY();
    }
    
    public void MouseUp(java.awt.event.MouseEvent evt){
        lClick  = false;
        nXup    = evt.getX();
        nYup    = evt.getY();
        nButton = evt.getButton();
    }
    public void MouseDown(java.awt.event.MouseEvent evt){
        lClick  = true;
        nXdown  = evt.getX();
        nYdown  = evt.getY();
        nButton = evt.getButton();
    }
}
