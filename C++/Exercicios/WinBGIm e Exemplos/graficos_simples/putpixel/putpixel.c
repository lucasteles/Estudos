#include<graphics.h>
//#include<stdlib.h>
#include<math.h>

int main( )
{
    int largura = 640;
    int altura = 480;
    
    int x,y,r,g,b = 0;
    
    initwindow(largura, altura);    
        
    
    
    int counter = 0;
    
    
    outtextxy(50,50, "Demonstracao da funcao putpixel");
    
    while (!kbhit( ))
    {
      
        x = rand()%largura;
        y = rand()%altura;
        r = rand()%255;
        g = rand()%255;
        b = rand()%255;       
                 
        putpixel(x,y, COLOR(r,g,b));
        
    }
    return 0;
}
