#define FPS 60

#include <allegro5/allegro.h>
#include <allegro5/allegro_image.h>
#include <allegro5/allegro_font.h>
#include <allegro5/allegro_ttf.h>

#include <stdio.h>
#include <stdlib.h>
#include "GameLib.h"
#include "Principal.h"
#include "Sounds.h"

void Ninja(int,int,int,int,int);
void Ryu(int,int,int,int,int);
void Link(int,int,int,int,int);

ALLEGRO_BITMAP *img = NULL;
ALLEGRO_TIMER *timer = NULL;
ALLEGRO_EVENT_QUEUE *event_queue = NULL;
ALLEGRO_EVENT ev;
ALLEGRO_FONT *ttf_font;
int nNinja = 0,nRyu = 0,nLink = 0;

int nWigth = 640;
int nHeigth = 480;
char *cTitle = "Jogos!!";

int main()
{
    GameLib_Init();

    double nTime = (double)1.0 / FPS;
    timer = al_create_timer(nTime);

    event_queue = al_create_event_queue();
    al_register_event_source(event_queue, al_get_timer_event_source(timer));

    al_init_ttf_addon();
    ttf_font = al_load_ttf_font("comic.TTF", 16, 0);

    al_flip_display();
    al_start_timer(timer);

    int nFrame = 0;


    while(true){

        al_wait_for_event(event_queue, &ev);

        if(ev.type == ALLEGRO_EVENT_TIMER)
        {
            ClearScreen();

            Ninja(nFrame,50,50,138,152);
            Ryu(nFrame,400,50,138,152);
            Link(nFrame,50,100,138,152);

            // Atualiza a tela
            al_flip_display();


            nFrame++;
            if(nFrame==FPS)
                nFrame = 1;
        }
    }

    return 0;
}

void Ninja(int tnFrame,int tnX,int tnY,int tnW,int tnH){
    int nXFrame = 38, nYFrame = 52;
    int nFrameFPS = 10,nFrameTotal = 13;

    img = al_load_bitmap("Frames\\ninjaue.png");

    ALLEGRO_BITMAP *oNinja = NULL;
    oNinja = al_create_sub_bitmap(img,nXFrame*nNinja,0,nXFrame,nYFrame);

    al_draw_scaled_bitmap(oNinja,
        0, 0,                   // source origin
        nXFrame,                     // source width
        nYFrame,                     // source height
        tnX,tnY,                   // target origin
        tnW, tnH,               // target dimensions
        0                       // flags
    );

    if(tnFrame%nFrameFPS == 0){
        nNinja++;
        if(nNinja>nFrameTotal)
            nNinja=0;
    }
    al_destroy_bitmap(oNinja);
    al_destroy_bitmap(img);
}

void Ryu(int tnFrame,int tnX,int tnY,int tnW,int tnH){
    int nXFrame = 65, nYFrame = 84;
    int nFrameFPS = 5,nFrameTotal = 17;

    img = al_load_bitmap("Frames\\Ryuzito2.jpg");
    ALLEGRO_BITMAP *oRyu = NULL;
    oRyu = al_create_sub_bitmap(img,nXFrame*nRyu,0,nXFrame,nYFrame);

    al_draw_scaled_bitmap(oRyu,
        0, 0,                   // source origin
        nXFrame,                     // source width
        nYFrame,                     // source height
        tnX,tnY,                   // target origin
        tnW, tnH,               // target dimensions
        0                       // flags
    );

    if(tnFrame%nFrameFPS == 0){
        nRyu++;
        if(nRyu>nFrameTotal)
            nRyu=0;
    }

    al_destroy_bitmap(oRyu);
    al_destroy_bitmap(img);
}

void Link(int tnFrame,int tnX,int tnY,int tnW,int tnH){
    int nXFrame = 100, nYFrame = 106;
    int nFrameFPS = 7,nFrameTotal = 12;

    img = al_load_bitmap("Frames\\Zeldinha.png");
    ALLEGRO_BITMAP *oLink = NULL;
    oLink = al_create_sub_bitmap(img,nXFrame*nLink,0,nXFrame,nYFrame);

    al_draw_scaled_bitmap(oLink,
        0, 0,                   // source origin
        nXFrame,                // source width
        nYFrame,                // source height
        tnX,tnY,                // target origin
        tnW, tnH,               // target dimensions
        0                       // flags
    );

    if(tnFrame%nFrameFPS == 0){
        nLink++;
        if(nLink>nFrameTotal)
            nLink=0;
    }
    al_destroy_bitmap(oLink);
    al_destroy_bitmap(img);
}
