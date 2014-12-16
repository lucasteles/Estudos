package Classes;


import java.awt.Color;

/**
 *
 * @author rmendonca
 */
public class Pixel {
    //Propriedades da Classe
    public int nX       = 0;
    public int nY       = 0;
    public Color oColor = new Color(0);

    public Pixel(){
    
    }
    public Pixel(int tnX,int tnY){
        nX = tnX;
        nY = tnY;
    }
    public Pixel(Color toColor){
        oColor = toColor;
    }
    public Pixel(int tnX,int tnY,Color toColor){
        nX = tnX;
        nY = tnY;
        oColor = toColor;
    }

    public static Pixel[] Fusion(Pixel[]... toPixel){
        Pixel[] oFusion = null;
        int nTam = 0,nJ = 0;
        //faz a contragem dos tamanhos dos vetores
        for (Pixel[] oPi : toPixel) {
            nTam+= oPi.length;
        }
        oFusion = new Pixel[nTam];
        for (Pixel[] oPi : toPixel) {
            for (int nI = 0; nI < oPi.length; nI++) {
                oFusion[nJ] = oPi[nI];
                nJ++;
            }
        }
        return(oFusion);
    }
}
