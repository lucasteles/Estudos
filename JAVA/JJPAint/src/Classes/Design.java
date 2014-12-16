package Classes;

import java.awt.*;
import java.awt.geom.*;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;



public class Design {
    //Propriedades da Classe
    //Privates
    private ArrayList<Forms> oLastForm  = new ArrayList<Forms>();
    private Point oMaxP                 = new Point(0, 0);
    //Publics
    public Pixel[][] oPTela  = null;
    public Graphics2D gGraf  = null;
    public Mouse oMouse      = null;
    public Color oColor      = Color.black;
    public int nMLine        = 1;
    public int nTamanho      = 1;
    
    public Design(){
    }
    
    public void StringToTela(String cFile) 
    {
        String text, aux, bloco="";
        File file = new File(cFile);
        BufferedReader reader = null;
        int j,i=0,nIndex=0,nQTCOR=0,nSomaAux=0,nSoma=0;
        Color NewCor;



        try {
            reader = new BufferedReader(new FileReader(file));

            while ((text = reader.readLine()) != null) {
                for (j = 0; j < text.length(); j++) {                                
                    aux = text.substring(j, j+1);  
                    if (aux.equals("|")  )
                    {
                        nIndex++;   
                        if(nIndex==1)
                        continue;
                     }
                    if( nIndex==1 )
                    {
                         if (aux.equals("-"))
                         {
                            if (nQTCOR == 0 )
                            {    
                             nQTCOR = Integer.parseInt(bloco);  
                             bloco="";
                             }
                             else
                             {
                               bloco += aux;
                             }
                             continue;
                         }
                         else
                         {
                            bloco += aux;                             
                         }
                    }
                    if( nIndex==2 ){
                        
                        if (bloco.equals("null"))
                            NewCor = null;
                        else
                            NewCor = new Color(Integer.parseInt(bloco));

                          bloco="";
                          nIndex = 0;
                        
                        if ( i > oPTela.length )
                        {
                           this.Size(i+1,oPTela[0].length);
                        }   
                        for(int k=nSoma; k <= nQTCOR+nSoma; k++)
                        {
                           if ( k >= oPTela[i].length )
                            {
                                this.Size(oPTela.length,k+1);
                            }
                           
                           if (NewCor != null)
                              oPTela[i][k] = new Pixel(i,k,NewCor);
                           else
                              oPTela[i][k] = null;

                           nSomaAux=(k-nSoma);
                        }
                        nSoma+=nSomaAux;
                        nQTCOR = 0;
                    }
                }
                
               i++;
               nSoma=0;
               

            }
        } catch (FileNotFoundException e) {
        } catch (IOException e) {
        } finally {
            try {
                if (reader != null) {
                    reader.close();
                }
            } catch (IOException e) {}
 
        }
        

    }

    public String TelaToString()
    {
        String cFormat = "";
        int nCont = 0;
        Color oAnt= null;
        Color oAtual = xx(oPTela[0][0]);
        int i,j;
       
        for (i = 0; i < oPTela.length; i++) {

           
                //System.out.println(cFormat);
            

            for (j = 0; j < oPTela[i].length; j++) {
                
               if (oAnt == oAtual)
               {
                   nCont++;
               }
               else
               {
                   if (nCont > 0)
                   {
                        cFormat += "|" + nCont + "-" + (oAnt == null ? "null": oAnt.getRGB()) + "|";
                        nCont = 1;
                   }
               }
               
               oAnt = oAtual;
               oAtual = xx(oPTela[i][j]);
              
         }
            if (nCont>0)
            {
                cFormat += "|" + nCont + "-" + (oAnt == null ? "null": oAnt.getRGB()) + "|";
                nCont = 1;
            }  
            
         cFormat+="\n";
         oAnt   = null;
         oAtual = xx(oPTela[i][0]);
           
       }

        cFormat += "|" + nCont + "-" + (oAtual == null ? "null": oAtual.getRGB()) + "|";
        return(cFormat);
    }
    
    private Color xx(Pixel toTela)
    {
        
        if (toTela == null)
        {
            return null;
        }
        
        return toTela.oColor;
        
    }
    
    
    public void Size(int nW,int nH){
        int nMinW,nMinH;
        
        nMinW = Math.min(nW, oMaxP.x);
        nMinH = Math.min(nH, oMaxP.y);
        
        Pixel[][] oAux = new Pixel[nW][nH];
        
        if (oPTela != null){
            for (int i = 0; i < nMinW; i++) {
                System.arraycopy(oPTela[i], 0, oAux[i], 0, nMinH);
            }
        }
        
        oMaxP   = new Point(nW, nH);
        oPTela  = oAux;
    }
            
    public void AddGraf()
    {
        //grava a ultima forma na matriz de pixels
        for(Forms oF : oLastForm){
            for (Pixel oP : oF.oPixels) {
                if (oP.nX>=0 && oP.nX<oMaxP.x && oP.nY>=0 && oP.nY<oMaxP.y) {
                    if (oP.oColor !=Color.WHITE) {
                        oPTela[oP.nX][oP.nY] = new Pixel(oP.nX, oP.nY, oP.oColor);
                    }
                    else{
                        oPTela[oP.nX][oP.nY] = null;
                    }
                }
            }
        }
        oLastForm.clear();
    }
    
    public Pixel GetCor(int tnX,int tnY){
        if (oPTela[tnX][tnY] == null) {
            oPTela[tnX][tnY] =  new Pixel(tnX, tnY, Color.white);
        }
        return(oPTela[tnX][tnY]);
    }

    public ArrayList<Pixel> AddPixelList(ArrayList<Pixel> toPilha,Color toCor,Pixel toP){
        boolean lOk = toP.nX>=0 && toP.nX<=oMaxP.x && toP.nY>=0 && toP.nY<=oMaxP.y;

        if(lOk){
            boolean lCor    = toP.oColor == toCor;
            boolean lContem = toPilha.contains(toP);
            if (lCor && !lContem) {
                toPilha.add(toP);
            }
        }
        return(toPilha);
    }

    public void DrawPen()
    {
        Forms oPen = new Forms().Line(oColor,oMouse.nLastX, oMouse.nLastY, oMouse.nX, oMouse.nY);
        oLastForm.add(oPen);
        AddGraf();
    }
    public void DrawRubber()
    {
        Forms oForm[] =
              new Forms().SizePoint(Color.WHITE, oMouse.nLastX, oMouse.nLastY, oMouse.nX, oMouse.nY, nTamanho);
        
        for(Forms oF : oForm){
            oLastForm.add(oF);
            gGraf.setColor(Color.white);
            gGraf.draw(oF.oShape);
        }
        AddGraf();
    }
    public void DrawPencel()
    {
        Forms oForm[] =
              new Forms().SizePoint(oColor, oMouse.nLastX, oMouse.nLastY, oMouse.nX, oMouse.nY, nTamanho);

        for(Forms oF : oForm){
            oLastForm.add(oF);
            gGraf.draw(oF.oShape);
        }
        AddGraf();
    }
    public void DrawLine()
    {  
        oLastForm.clear();
        Forms oLine = new Forms().Line(oColor,oMouse.nXdown, oMouse.nYdown, oMouse.nX, oMouse.nY);
        oLastForm.add(oLine);

        gGraf.draw(oLine.oShape);
    }
    
    public void DrawSquare()
    {  
        oLastForm.clear();
        Forms[] oLine = new Forms().Square(oColor,oMouse.nXdown, oMouse.nYdown, oMouse.nX, oMouse.nY);
        for(Forms oF : oLine){
            oLastForm.add(oF);
            gGraf.draw(oF.oShape);
        }
    }
    
    public void DrawCircle()
    {  
        oLastForm.clear();
        Forms[] oLine = new Forms().Circle(oColor,oMouse.nXdown, oMouse.nYdown, oMouse.nX, oMouse.nY);
        for(Forms oF : oLine){
            oLastForm.add(oF);
            gGraf.draw(oF.oShape);
        }
    }
    public void DrawString(String tcTexto,Pixel toPixels)
    {
        gGraf.drawString(tcTexto, toPixels.nX, toPixels.nY);
    }

    public void paint()
    {   
        // Le a matriz de pixels e desenha na tela
        for (int i = 0; i < oPTela.length; i++) {
            for (int j = 0; j < oPTela[i].length; j++) {
                if (oPTela[i][j]!=null) {
                    gGraf.setColor(oPTela[i][j].oColor);
                    gGraf.draw(new Line2D.Double(i, j, i, j));
                }
            }
        }
    }
    
    public void DrawBucket(Pixel toPixel,int nDire)
    {
        Color oAtu  = toPixel.oColor;
        int nX      = toPixel.nX;
        int nY      = toPixel.nY;
        int nAux    = 0;
        
        ArrayList<Pixel> oPilha  = new ArrayList<Pixel>();
        oPilha.add(toPixel);

        while(!oPilha.isEmpty()){
            Pixel oP = oPilha.get(0);
            
            nAux = (oP.nY-1);
            if (nAux>=0 && nAux<oMaxP.y) {
                oPilha=AddPixelList(oPilha, oAtu, GetCor(oP.nX,nAux)); //Pixel de cima
            }
            nAux = (oP.nY+1);
            if (nAux>=0 && nAux<oMaxP.y) {
                oPilha=AddPixelList(oPilha, oAtu, GetCor(oP.nX, nAux)); //Pixel da baixo
            }
            nAux = (oP.nX-1);
            if (nAux>=0 && nAux<oMaxP.x) {
                oPilha=AddPixelList(oPilha, oAtu, GetCor(nAux,oP.nY)); //Pixel da esquerda
            }
            nAux = (oP.nX+1);
            if (nAux>=0 && nAux<oMaxP.x) {
                oPilha=AddPixelList(oPilha, oAtu, GetCor(nAux, oP.nY)); //Pixel de direita
            }
            
            oPTela[oP.nX][oP.nY] = new Pixel(oP.nX, oP.nY, oColor);
            oPilha.remove(0);
        }
    }
    
    public void DrawPixels(Pixel[] toPixels){
        int nI = 0;
        Forms[] oForms = new Forms[toPixels.length];
        
        for (Pixel oPi : toPixels) {
            oForms[nI] = oForms[nI].Line(oPi.oColor, oPi.nX, oPi.nY, oPi.nX, oPi.nY);
            oLastForm.add(oForms[nI]);
            gGraf.setColor(oPi.oColor);
            nI++;
        }
        AddGraf();
    }
}
