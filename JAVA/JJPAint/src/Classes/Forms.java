/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import java.awt.*;
import java.awt.geom.*;
import java.util.ArrayList;

/**
 *
 * @author rmendonca
 */
public class Forms{
    public Color oColor  = null;
    public Shape oShape = null;
    public ArrayList<Pixel> oPixels = new ArrayList<Pixel>();
    
    public Forms()
    {
    }
    
    public Forms Line(Color toColor,int nX1, int nY1,int nX2, int nY2)
    {
        Forms oForm = new Forms();
        oForm.oShape = new Line2D.Double(nX1, nY1, nX2, nY2);
        oForm.oColor = toColor;

        double nAng,nLin;
        int nX,nY,nMax,nMin;
        // calculo de angular
        if ((nX2 - nX1)==0) 
            nAng = 0;
        else
            nAng = ((double) (nY2 - nY1) / (nX2 - nX1));
        
        // calculo linear
        nLin = (double)(nY1-(nAng*nX1));
        
        nMin = Math.min(nX1, nX2);
        nMax = Math.max(nX1, nX2);
        // seta os pontos Y
        for (int nI = nMin; nI < nMax; nI++) {
            nY = (int)Math.round(nAng*nI + nLin);
            oForm.oPixels.add(new Pixel(nI, nY, toColor));
        }

        nMin = Math.min(nY1, nY2);
        nMax = Math.max(nY1, nY2);
        // seta os pontos X
        for (int nI = nMin; nI < nMax; nI++) {
            if (nAng==0) {nX = nX1;}
            else{nX = (int)Math.round((nI - nLin)/nAng);}
            
            oForm.oPixels.add(new Pixel(nX, nI, toColor));
        }
        return(oForm);
    }
    public Forms[] Square(Color toColor,int nX1, int nY1,int nX2, int nY2)
    {
        Forms oForm[] = new Forms[4];
        
        oForm[0] = Line(toColor,nX1, nY1, nX2, nY1);
        oForm[1] = Line(toColor,nX2, nY1, nX2, nY2);
        oForm[2] = Line(toColor,nX2, nY2, nX1, nY2);
        oForm[3] = Line(toColor,nX1, nY2, nX1, nY1);
        
        return(oForm);
    }
    public Forms[] Circle(Color toColor,int nX1, int nY1,int nX2, int nY2)
    {
        Forms oForm[] = new Forms[361];
        int nX=0,nY=0,nLx=0,nLy=0,tMx,tMy;

        tMx = nX2 - nX1;
        tMy = nY2 - nY1;
        
        for (int i = 0; i < oForm.length; i++) {
            double DegInRad = 0;
            
            DegInRad = i * (Math.PI / 180);
            nX = (int)Math.round(nX1 + ((Math.cos(DegInRad)*tMx)));
            nY = (int)Math.round(nY1 + ((Math.sin(DegInRad)*tMy)));
            
            if (nLx==0) {nLx=nX;}
            if (nLy==0) {nLy=nY;}
            oForm[i] = Line(toColor,nLx, nLy, nX, nY);
            
            nLx=nX;
            nLy=nY;
        }
        return(oForm);
    }
    public Forms[] SizePoint(Color toColor,int nX1, int nY1,int nX2, int nY2,int nTam)
    {
        Color oC = toColor;
        int nLastX,nLastY,nX,nY,nVetor;
        nLastX = nX1 - nTam;
        nLastY = nY1 - nTam;
        nX     = nX2 - nTam;
        nY     = nY2 - nTam;
        // calcula o tamanho do quadrado
        nVetor = (int)(Math.pow(1+(nTam*2),2));

        Forms oRubber[] = new Forms[nVetor];
        int nIndex = 0;
        for (int i = 0; i < (1+(nTam*2)); i++) {
            for (int j = 0; j < (1+(nTam*2)); j++) {
                oRubber[nIndex] = new Forms().Line(oC,nLastX+i,nLastY+j,nX+i,nY+j);
                nIndex++;
            }
        }
        return(oRubber);
    }
}
