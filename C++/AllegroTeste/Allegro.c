#include "Allegro.h"
#include <allegro5/allegro.h>
#include <stdio.h>

ALLEGRO_DISPLAY *oJanela = NULL;
ALLEGRO_EVENT_QUEUE *oFilaEventos = NULL;
ALLEGRO_EVENT oEvento;
ALLEGRO_TIMEOUT oTimeout;
ALLEGRO_BITMAP *oBotaoSair = NULL, *oCentro = 0;
bool lSair = false;
ALLEGRO_COLOR tempClearColor;

int InitAllegro(Screen oScreen){
    if (!al_init())
    {
        fprintf(stderr, "Falha ao inicializar a Allegro 5\n");
        return -1;
    }

    oJanela = al_create_display(oScreen.nWidth, oScreen.nHeigth);
    if (!oJanela)
    {
        fprintf(stderr, "Falha ao criar a janela\n");
        return -1;
    }

    al_set_window_title(oJanela, oScreen.cTitle);

        // Torna apto o uso de mouse na aplicação
    if (!al_install_mouse())
    {
        fprintf(stderr, "Falha ao inicializar o mouse.\n");
        al_destroy_display(oJanela);
        return -1;
    }

    // Atribui o cursor padrão do sistema para ser usado
    if (!al_set_system_mouse_cursor(oJanela, ALLEGRO_SYSTEM_MOUSE_CURSOR_DEFAULT))
    {
        fprintf(stderr, "Falha ao atribuir ponteiro do mouse.\n");
        al_destroy_display(oJanela);
        return -1;
    }

    // Alocamos o retângulo central da tela
    oCentro = al_create_bitmap(oScreen.nWidth / 2, oScreen.nHeigth / 2);
    if (!oCentro)
    {
        fprintf(stderr, "Falha ao criar bitmap.\n");
        al_destroy_display(oJanela);
        return -1;
    }

    // Alocamos o botão para fechar a aplicação
    oBotaoSair = al_create_bitmap(100, 50);
    if (!oBotaoSair)
    {
        fprintf(stderr, "Falha ao criar botão de saída.\n");
        al_destroy_bitmap(oCentro);
        al_destroy_display(oJanela);
        return -1;
    }

    oFilaEventos = al_create_event_queue();
    if (!oFilaEventos)
    {
        fprintf(stderr, "Falha ao criar fila de eventos.\n");
        al_destroy_display(oJanela);
        return -1;
    }

    al_register_event_source(oFilaEventos, al_get_display_event_source(oJanela));
    al_register_event_source(oFilaEventos, al_get_mouse_event_source());

    Animation(oScreen);

    al_destroy_display(oJanela);
    al_destroy_event_queue(oFilaEventos);

    return 0;
}

void Animation(Screen oScreen){
    int na_area_central = 0;
    al_init_timeout(&oTimeout, 5);
    tempClearColor = al_map_rgb(255, 255, 255);
    al_clear_to_color(tempClearColor);

    while (!lSair)
    {
         // Verificamos se há eventos na fila
        while (!al_is_event_queue_empty(oFilaEventos))
        {

            al_wait_for_event(oFilaEventos, &oEvento);

            if (oEvento.type == ALLEGRO_EVENT_DISPLAY_CLOSE)
            {
                lSair = true;
                break;
            }

            // Se o evento foi de movimentação do mouse
            if (oEvento.type == ALLEGRO_EVENT_MOUSE_AXES)
            {
                // Verificamos se ele está sobre a região do retângulo central
                if (oEvento.mouse.x >= oScreen.nWidth / 2 - al_get_bitmap_width(oCentro) / 2 &&
                    oEvento.mouse.x <= oScreen.nWidth / 2 + al_get_bitmap_width(oCentro) / 2 &&
                    oEvento.mouse.y >= oScreen.nHeigth / 2 - al_get_bitmap_height(oCentro) / 2 &&
                    oEvento.mouse.y <= oScreen.nHeigth / 2 + al_get_bitmap_height(oCentro) / 2)
                {
                    na_area_central = 1;
                }
                else
                {
                    na_area_central = 0;
                }
            }
            // Ou se o evento foi um clique do mouse
            else if (oEvento.type == ALLEGRO_EVENT_MOUSE_BUTTON_UP)
            {
                if (oEvento.mouse.x >= oScreen.nWidth - al_get_bitmap_width(oBotaoSair) - 10 &&
                    oEvento.mouse.x <= oScreen.nWidth - 10 && oEvento.mouse.y <= oScreen.nHeigth - 10 &&
                    oEvento.mouse.y >= oScreen.nHeigth - al_get_bitmap_height(oBotaoSair) - 10)
                {
                    lSair = true;
                }
            }
        }
        /*
        // Limpamos a tela
        tempClearColor = al_map_rgb(255, 255, 255);
        al_clear_to_color(tempClearColor);

        // Colorimos o bitmap correspondente ao retângulo central,
        // com a cor condicionada ao conteúdo da flag na_area_central
        al_set_target_bitmap(oCentro);
        if (!na_area_central)
        {
            tempClearColor = al_map_rgb(255, 255, 255);
            al_clear_to_color(tempClearColor);
        }
        else
        {
            tempClearColor = al_map_rgb(0, 255, 0);
            al_clear_to_color(tempClearColor);
        }

        // Colorimos o bitmap do botão de sair
        al_set_target_bitmap(oBotaoSair);

        tempClearColor = al_map_rgb(255, 0, 0);
        al_clear_to_color(tempClearColor);

        // Desenhamos os retângulos na tela
        al_set_target_bitmap(al_get_backbuffer(oJanela));
        al_draw_bitmap(oCentro, oScreen.nWidth / 2 - al_get_bitmap_width(oCentro) / 2,
                       oScreen.nHeigth / 2 - al_get_bitmap_height(oCentro) / 2, 0);
        al_draw_bitmap(oBotaoSair, oScreen.nWidth - al_get_bitmap_width(oBotaoSair) - 10,
                       oScreen.nHeigth - al_get_bitmap_height(oBotaoSair) - 10, 0);
        */
        // Atualiza a tela
        al_flip_display();
    }
}
