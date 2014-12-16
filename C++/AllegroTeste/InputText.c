/*
#include <allegro5/allegro.h>
#include <allegro5/allegro_image.h>
#include <allegro5/allegro_font.h>
#include <allegro5/allegro_ttf.h>

#include <stdio.h>
#include <string.h>
#include <stdbool.h>

const int LARGURA_TELA = 640;
const int ALTURA_TELA = 480;

ALLEGRO_BITMAP *fundo = NULL;
ALLEGRO_DISPLAY *janela = NULL;
ALLEGRO_FONT *fonte = NULL;
ALLEGRO_EVENT_QUEUE *fila_eventos = NULL;

char str[17];

void manipular_entrada(ALLEGRO_EVENT evento);
void exibir_texto_centralizado();

bool inicializar();
bool carregar_arquivos();
void finalizar();
ALLEGRO_COLOR oCOR;

int main(void)
{
    bool sair = false;
    bool concluido = false;

    if (!inicializar())
    {
        return -1;
    }

    strcpy(str, "");

    if (!carregar_arquivos())
    {
        return -1;
    }

    while (!sair)
    {
        while (!al_is_event_queue_empty(fila_eventos))
        {
            ALLEGRO_EVENT evento;
            al_wait_for_event(fila_eventos, &evento);

            if (!concluido)
            {
                manipular_entrada(evento);

                if (evento.type == ALLEGRO_EVENT_KEY_DOWN && evento.keyboard.keycode == ALLEGRO_KEY_ENTER)
                {
                    concluido = true;
                }
            }

            if (evento.type == ALLEGRO_EVENT_DISPLAY_CLOSE)
            {
                sair = true;
            }
        }

        al_draw_bitmap(fundo, 0, 0, 0);

        if (!concluido)
        {
            oCOR.r = 1;
            oCOR.g = 1;
            oCOR.b = 1;
            oCOR.a = 1;
            al_draw_text(fonte, oCOR, LARGURA_TELA / 2,
                        (ALTURA_TELA / 2 - al_get_font_ascent(fonte)) / 2,
                        ALLEGRO_ALIGN_CENTRE, "Melhor Pontuação! Nome:");
        }
        else
        {
            oCOR.r = 1;
            oCOR.g = 1;
            oCOR.b = 1;
            oCOR.a = 1;
            al_draw_text(fonte, oCOR, LARGURA_TELA / 2,
                        (ALTURA_TELA / 2 - al_get_font_ascent(fonte)) / 2,
                        ALLEGRO_ALIGN_CENTRE, "1º Lugar");
        }

        exibir_texto_centralizado();

        al_flip_display();
    }

    finalizar();

    return 0;
}

bool inicializar()
{
    if (!al_init())
    {
        fprintf(stderr, "Falha ao inicializar a biblioteca Allegro.\n");
        return false;
    }

    if (!al_install_keyboard())
    {
        fprintf(stderr, "Falha ao inicializar teclado.\n");
        return false;
    }

    if (!al_init_image_addon())
    {
        fprintf(stderr, "Falha ao inicializar allegro_image.\n");
        return false;
    }

    al_init_font_addon();

    if (!al_init_ttf_addon())
    {
        fprintf(stderr, "Falha ao inicializar allegro_ttf.\n");
        return false;
    }

    janela = al_create_display(LARGURA_TELA, ALTURA_TELA);
    if (!janela)
    {
        fprintf(stderr, "Falha ao criar a janela.\n");
        return false;
    }

    fila_eventos = al_create_event_queue();
    if (!fila_eventos)
    {
        fprintf(stderr, "Falha ao criar fila de eventos.\n");
        return false;
    }

    al_set_window_title(janela, "Entrada de Texto");

    al_register_event_source(fila_eventos, al_get_display_event_source(janela));
    al_register_event_source(fila_eventos, al_get_keyboard_event_source());

    return true;
}

bool carregar_arquivos()
{
    fundo = al_load_bitmap("imagem.jpg");
    if (!fundo)
    {
        fprintf(stderr, "Falha ao carregar \"bg.jpg\".\n");
        return false;
    }

    fonte = al_load_font("comic.ttf", 42, 0);
    if (!fonte)
    {
        fprintf(stderr, "Falha ao carregar \"comic.ttf\".\n");
        return false;
    }

    return true;
}

void finalizar()
{
    al_destroy_bitmap(fundo);
    al_destroy_font(fonte);
    al_destroy_event_queue(fila_eventos);
    al_destroy_display(janela);
}

void manipular_entrada(ALLEGRO_EVENT evento)
{
    if (evento.type == ALLEGRO_EVENT_KEY_CHAR)
    {
        if (strlen(str) <= 16)
        {
            char temp[] = {evento.keyboard.unichar, '\0'};
            if (evento.keyboard.unichar == ' ')
            {
                strcat(str, temp);
            }
            else if (evento.keyboard.unichar >= '0' &&
                     evento.keyboard.unichar <= '9')
            {
                strcat(str, temp);
            }
            else if (evento.keyboard.unichar >= 'A' &&
                     evento.keyboard.unichar <= 'Z')
            {
                strcat(str, temp);
            }
            else if (evento.keyboard.unichar >= 'a' &&
                     evento.keyboard.unichar <= 'z')
            {
                strcat(str, temp);
            }
        }

        if (evento.keyboard.keycode == ALLEGRO_KEY_BACKSPACE && strlen(str) != 0)
        {
            str[strlen(str) - 1] = '\0';
        }
    }
}

void exibir_texto_centralizado()
{
    if (strlen(str) > 0)
    {
        oCOR.r = 1;
        oCOR.g = 1;
        oCOR.b = 1;
        oCOR.a = 1;
        al_draw_text(fonte, oCOR, LARGURA_TELA / 2,
                     (ALTURA_TELA - al_get_font_ascent(fonte)) / 2,
                     ALLEGRO_ALIGN_CENTRE, str);
    }
}

*/
