#ifndef ALLEGRO_H_   /* Include guard */
#define ALLEGRO_H_

typedef struct Screen
{
    int nHeigth;
    int nWidth;
    int nRed;
    int nGreen;
    int nBlue;
    char *cTitle;

}Screen;

int InitAllegro(Screen);

void Animation(Screen);

#endif
