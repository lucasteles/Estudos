#include<graphics.h>

#include<stdlib.h>

int main( )
{
    initwindow(640,480);    

    circle(100, 50, 40);
    
    int counter = 0;
    
    while (!kbhit( ))
    {
        delay(10);
        cleardevice();        
        circle(100 + counter , 50  + counter%100, 40);        
        counter ++;
    }
    return 0;
}
