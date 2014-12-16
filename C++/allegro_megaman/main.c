#include <stdio.h>
#include <stdlib.h>

#include <allegro5/allegro.h>
#include <allegro5/allegro_image.h>
#include <allegro5/allegro_primitives.h>



#define WIDTH 320
#define HEIGHT 240

#define TILE_SIZE 16
#define SPRITE_SIZE 24
#define NUM_SPRITES 5
#define NUM_FRAMES 5

#define FPS 30



ALLEGRO_DISPLAY *display = NULL;
ALLEGRO_EVENT_QUEUE *event_queue = NULL;
ALLEGRO_TIMER *timer = NULL;



void error(char *message) {
  fprintf(stderr, message);

  if(timer)
    al_destroy_timer(timer);

  if(event_queue)
    al_destroy_event_queue(event_queue);

  if(display)
    al_destroy_display(display);

  exit(EXIT_FAILURE);
}


int main() {
  if(!al_init())
    error("Failed to initialize!\n");

  if(!al_install_keyboard())
    error("Failed to install keyboard!\n");

  if(!al_init_image_addon())
    error("Failed to initialize image addon!\n");

  if(!al_init_primitives_addon())
    error("Failed to initialize primitives addon!\n");

  display = al_create_display(WIDTH, HEIGHT);

  if(!display)
    error("Failed to create display!\n");

  event_queue = al_create_event_queue();

  if(!event_queue)
    error("Failed to create event queue!\n");

  timer = al_create_timer(1.0 / FPS);

  if(!timer)
    error("Failed to create timer!\n");

  ALLEGRO_COLOR color = al_map_rgb(0, 0, 127);

  al_draw_filled_rectangle(0, 0, WIDTH, HEIGHT - TILE_SIZE, color);

  ALLEGRO_BITMAP *tile = al_load_bitmap("tile.png");

  if(!tile)
    error("Failed to load tile!\n");

  for(int i = 0; i < WIDTH / TILE_SIZE + 1; i++)
    al_draw_bitmap(tile, i * TILE_SIZE, HEIGHT - TILE_SIZE, 0);

  al_destroy_bitmap(tile);

  ALLEGRO_BITMAP *sprites = al_load_bitmap("sprites.png");

  if(!sprites)
    error("Failed to load sprites!\n");

  int direction = 0;

  int count = 0;

  int shift = 0;

  int arm = 0;

  ALLEGRO_BITMAP *sprite = al_create_sub_bitmap(sprites, shift * SPRITE_SIZE, 0, SPRITE_SIZE, SPRITE_SIZE);

  int x = (WIDTH - SPRITE_SIZE) / 2;

  int y = HEIGHT - TILE_SIZE - SPRITE_SIZE;

  int flags = 0;

  al_draw_bitmap(sprite, x, y, flags);

  al_flip_display();

  int running = 1;

  int refresh = 0;

  al_register_event_source(event_queue, al_get_keyboard_event_source());

  al_register_event_source(event_queue, al_get_display_event_source(display));

  al_register_event_source(event_queue, al_get_timer_event_source(timer));

  al_start_timer(timer);

  while(running) {
    ALLEGRO_EVENT event;

    al_wait_for_event(event_queue, &event);

    switch(event.type) {
    case ALLEGRO_EVENT_KEY_DOWN:
      switch(event.keyboard.keycode) {
      case ALLEGRO_KEY_LEFT:
	direction = -1;

	flags = ALLEGRO_FLIP_HORIZONTAL;

	break;
      case ALLEGRO_KEY_RIGHT:
	direction = 1;

	flags = 0;

	break;
      default:
	printf("UNKNOWN KEY DOWN\n");
      }

      break;
    case ALLEGRO_EVENT_KEY_UP:
      switch(event.keyboard.keycode) {
      case ALLEGRO_KEY_LEFT:
	if(direction == -1) {
	  direction = 0;

	  al_draw_filled_rectangle(x, y, x + SPRITE_SIZE, y + SPRITE_SIZE, color);

	  al_destroy_bitmap(sprite);

	  shift = 0;

	  sprite = al_create_sub_bitmap(sprites, shift * SPRITE_SIZE, 0, SPRITE_SIZE, SPRITE_SIZE);

	  al_draw_bitmap(sprite, x, y, flags);

	  refresh = 1;
	}

	break;
      case ALLEGRO_KEY_RIGHT:
	if(direction == 1) {
	  direction = 0;

	  al_draw_filled_rectangle(x, y, x + SPRITE_SIZE, y + SPRITE_SIZE, color);

	  al_destroy_bitmap(sprite);

	  shift = 0;

	  sprite = al_create_sub_bitmap(sprites, shift * SPRITE_SIZE, 0, SPRITE_SIZE, SPRITE_SIZE);

	  al_draw_bitmap(sprite, x, y, flags);

	  refresh = 1;
	}

	break;
      default:
	printf("UNKNOWN KEY UP\n");
      }

      break;
    case ALLEGRO_EVENT_DISPLAY_CLOSE:
      running = 0;

      break;
    case ALLEGRO_EVENT_TIMER:
      if(direction != 0) {
	al_draw_filled_rectangle(x, y, x + SPRITE_SIZE, y + SPRITE_SIZE, color);

	al_destroy_bitmap(sprite);

	switch(shift) {
	case 0:
	  shift = 1;

	  break;
	case 1:
	  x += direction;

	  count = 0;

	  shift = 3;

	  arm = -1;

	  break;
	default:
	  x += direction;

	  count++;

	  if(count == NUM_FRAMES) {
	    count = 0;

	    if(shift == 3)
	      shift += arm;
	    else {
	      shift = 3;

	      arm = -arm;
	    }
	  }
	}

	sprite = al_create_sub_bitmap(sprites, shift * SPRITE_SIZE, 0, SPRITE_SIZE, SPRITE_SIZE);

	al_draw_bitmap(sprite, x, y, flags);

	refresh = 1;
      }

      if(refresh) {
	al_flip_display();

	refresh = 0;
      }

      break;
    /*
    default:
      printf("UNKNOWN EVENT\n");
    */
    }
  }

  al_stop_timer(timer);

  al_unregister_event_source(event_queue, al_get_timer_event_source(timer));

  al_unregister_event_source(event_queue, al_get_display_event_source(display));

  al_unregister_event_source(event_queue, al_get_keyboard_event_source());

  al_destroy_bitmap(sprite);

  al_destroy_bitmap(sprites);

  al_destroy_timer(timer);

  al_destroy_event_queue(event_queue);

  al_destroy_display(display);

  al_shutdown_primitives_addon();

  al_shutdown_image_addon();

  al_uninstall_keyboard();

  return EXIT_SUCCESS;
}
