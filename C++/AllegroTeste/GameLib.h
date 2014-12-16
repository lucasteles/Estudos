#include <allegro5/allegro.h>

// Variável representando a janela principal
ALLEGRO_DISPLAY *oScreen;
int nWigth;
int nHeigth;
char *cTitle;

void GameLib_Init();
void ClearScreen();
void Wait(double);
ALLEGRO_COLOR SetColor(int,int,int,int);
