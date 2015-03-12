#include<graphics.h>

#include<stdlib.h>

#include <math.h>

int main( )
{
    initwindow(800,600);    
    

    // CORES VALIDAS:
    // BLACK, BLUE, GREEN,  CYAN, RED, MAGENTA, BROWN, LIGHTGRAY	,DARKGRAY	,LIGHTBLUE	,LIGHTGREEN	,LIGHTCYAN	,LIGHTRED	,LIGHTMAGENTA,YELLOW,WHITE         
   
    // Muda a cor do fundo
    setbkcolor(WHITE); 
    
    // Limpa a tela
    cleardevice();
    
    setcolor(BLACK);  
    outtextxy(20,20, "Exemplo da funcao line e setcolor");    
    
    // Muda a cor do traço
    setcolor(LIGHTBLUE);     
    line(50,50,350,50);
    
    setcolor(LIGHTGREEN);    
    line(350,50,350,350); 
    
    setcolor(LIGHTRED);    
    line(50,350,350,350);

    setcolor(YELLOW);     
    line(50,50,50,350);      
    
    
    
    while (!kbhit( ))
    {    
       // Nao faz nada, so fica esperando                                             
    }
    return 0;
}
