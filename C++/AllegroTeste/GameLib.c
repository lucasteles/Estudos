#include <allegro5/allegro.h>
#include <allegro5/allegro_image.h>
#include "GameLib.h"
#include <stdlib.h>

void GameLib_Init(){
    // Inicializa a Allegro
    al_init();

    // Inicializa o add-on para utilização de imagens
    al_init_image_addon();

    // Configura a janela
    oScreen = al_create_display(nWigth, nHeigth);

    al_set_window_title(oScreen, cTitle);
}

void ClearScreen(){
    // Preenchemos a janela de branco
    al_clear_to_color(SetColor(255, 255, 255,1));
}

void Wait(double tnFPS){
    double nFPS;
    nFPS = (double) 1/tnFPS;
    al_rest(nFPS);
}

ALLEGRO_COLOR SetColor(int tnRed,int tnGreen,int tnBlue,int tnAlfa){
    ALLEGRO_COLOR oRetorno = al_map_rgba(tnRed,tnGreen,tnBlue,tnAlfa);

    return oRetorno;
}
