package Classes;


import java.awt.*;
import Classes.*;

/**
 *
 * @author rmendonca
 */
public class Paint extends Design{
    //Propriedades da Classe
    //Privates
    private int cTool       = 1;
    //public
    public int nHeight     = 0;
    public int nWidth       = 0;
    public String cCaminhoAtual = "";

    public Paint(){
    }
    
    public Paint Init(Graphics tgGraf,int tnW,int tnH,Mouse toMouse){
        gGraf   = (Graphics2D)tgGraf;
        oMouse  = toMouse;
        nWidth   = tnW;
        nHeight = tnH;
        
        Size(nWidth, nHeight);        
        return(this);
    }
    
    public void SetTool(int tcTool)
    {
        /** Instruções das ferramentas
         * 1 - Pen
         * 2 - Line
         * 3 - 
        */
        cTool = tcTool;
    }
    
    public void SetColor(Color toColor)
    {
        oColor = toColor;
    }
    
    public void Draw(){
        gGraf.setColor(oColor);
        switch(cTool){
            case 1:
                DrawPen();
                break;
            case 2:
                DrawLine();
                break;
            case 3:
                DrawSquare();
                break;
            case 4:
                DrawCircle();
                break;
            case 5:
                Bucket();
                break;
            case 6:
                DrawRubber();
                break;
            case 7:
                DrawPencel();
                break;
            default:

        }
    }
    
    public void Bucket()
    {
        if (oPTela[oMouse.nXdown][oMouse.nYdown] == null) {
            oPTela[oMouse.nXdown][oMouse.nYdown] = new Pixel(Color.white);
        }
        
        Pixel oAtuPixel = new Pixel(oMouse.nXdown, oMouse.nYdown,oPTela[oMouse.nXdown][oMouse.nYdown].oColor);
        DrawBucket(oAtuPixel,0);
    }
}
