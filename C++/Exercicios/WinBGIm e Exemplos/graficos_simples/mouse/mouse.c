#include<graphics.h>
#include<stdlib.h>

int main() {

initwindow(640,480);

int x,y;

while(kbhit()!=1)
{
    x=mousex( );
    delay(1);
    y=mousey( );
    delay(1);
    lineto(x,y);
};

system("pause");

closegraph();  

}
