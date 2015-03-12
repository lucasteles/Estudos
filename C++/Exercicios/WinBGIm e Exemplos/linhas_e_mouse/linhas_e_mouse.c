#include<graphics.h>

#include<stdlib.h>

int main( )
{
    initwindow(640,480);    
    
    int x, y, velho_x, velho_y = 0;
     
    // Muda a cor do traço
    setcolor(LIGHTBLUE); 
    // Muda a cor do fundo
    setbkcolor(WHITE); 
    
    // CORES VALIDAS:
    // BLACK, BLUE, GREEN,  CYAN, RED, MAGENTA, BROWN, LIGHTGRAY	,DARKGRAY	,LIGHTBLUE	,LIGHTGREEN	,LIGHTCYAN	,LIGHTRED	,LIGHTMAGENTA,YELLOW,WHITE         
    
    // Limpa a tela
    cleardevice();
        
        
    outtextxy(20,20, "Exemplo da funcao line e mouse");    
    
    
    while (!kbhit( ))
    {    

        
        // Detecta o clique do mouse e joga a posicao em que ocorreu nas variaveis
        // x e y  
        if (ismouseclick(WM_LBUTTONDOWN)){  
           velho_x = x;
           velho_y = y;   
           getmouseclick(WM_LBUTTONDOWN, x, y);                
           line(x, y, velho_x, velho_y);  
        }
        
        //printf("%d %d %d %d", x,y, velho_x, velho_y);
                                                      
    }
    return 0;
}
