#include <stdio.h>
#include <conio.h>

#define KB_UP 72
#define KB_DOWN 80
#define KB_LEFT 75
#define KB_RIGHT 77
#define KB_ESCAPE 27


int main()
{
   int KB_code=0,KB_ant;

   while(KB_code != KB_ESCAPE )
   {
     if (kbhit())
      {
            KB_ant = KB_code;
            KB_code = getch();
            printf("KB_code = %i \n",KB_code);

            if (KB_ant==224){
                switch (KB_code)
                {
                    case KB_LEFT:
                           printf("left\n");
                    break;

                    case KB_RIGHT:
                           printf("right\n");
                    break;

                    case KB_UP:
                               printf("up\n");
                    break;

                    case KB_DOWN:
                               printf("down\n");
                    break;

                }

            }

      }
  }

  return 0;
}
