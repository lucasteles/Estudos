/*
#include <allegro5/allegro.h>
#include <allegro5/allegro_primitives.h>

#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

#define FPS 60
const int LARGURA_TELA = 640;
const int ALTURA_TELA = 480;

ALLEGRO_DISPLAY *janela = NULL;
ALLEGRO_EVENT_QUEUE *fila_eventos = NULL;

bool inicializar();

int main(void)
{
    bool sair = false;

    if (!inicializar())
    {
        return -1;
    }

    float raio = 60.0;
    float x = raio;
    float y = raio;
    int dir_x = 1, dir_y = 1;

    ALLEGRO_COLOR oCOR;
    oCOR.r = 1;
    oCOR.g = 0;
    oCOR.b = 0;
    oCOR.a = 1;

    ALLEGRO_COLOR oAzul;
    oAzul.r = 0;
    oAzul.g = 0;
    oAzul.b = 1;
    oAzul.a = 1;

    while (!sair)
    {
        if (!al_is_event_queue_empty(fila_eventos))
        {
            ALLEGRO_EVENT evento;
            al_wait_for_event(fila_eventos, &evento);

            if (evento.type == ALLEGRO_EVENT_DISPLAY_CLOSE)
            {
                sair = true;
            }
        }

        al_draw_filled_circle(x, y, raio, oAzul);
        al_flip_display();
        al_clear_to_color(oCOR);

        x += 0.1 * dir_x;
        y += 0.1 * dir_y;

        if (x >= LARGURA_TELA - raio)
        {
            dir_x = -1;
            x = LARGURA_TELA - raio;
        } else if (x <= raio) {
            dir_x = 1;
            x = raio;
        }

        if (y >= ALTURA_TELA - raio)
        {
            dir_y = -1;
            y = ALTURA_TELA - raio;
        } else if (y <= raio) {
            dir_y = 1;
            y = raio;
        }

        al_rest(1/FPS);
    }

    al_destroy_event_queue(fila_eventos);
    al_destroy_display(janela);

    return 0;
}

bool inicializar()
{
    if (!al_init())
    {
        fprintf(stderr, "Falha ao inicializar Allegro.\n");
        return false;
    }

    if (!al_init_primitives_addon())
    {
        fprintf(stderr, "Falha ao inicializar add-on allegro_primitives.\n");
        return false;
    }

    janela = al_create_display(LARGURA_TELA, ALTURA_TELA);
    if (!janela)
    {
        fprintf(stderr, "Falha ao criar janela.\n");
        return false;
    }

    al_set_window_title(janela, "Animando!!!");

    fila_eventos = al_create_event_queue();
    if (!fila_eventos)
    {
        fprintf(stderr, "Falha ao criar fila de eventos.\n");
        al_destroy_display(janela);
        return false;
    }

    al_register_event_source(fila_eventos, al_get_display_event_source(janela));

    return true;
}
*/
