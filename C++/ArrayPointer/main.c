#include <stdio.h>
#include <stdlib.h>
int main(int argc, char **argv)
{
   int w = 0, h = 0;
   int *a1, **array, row;

   printf("Enter two integers.  Space delimited:  ");
   scanf("%d %d",&w, &h);

   a1 = malloc(w*h*sizeof(int));
   array = malloc(w*sizeof(int*));
   for (row=0; row<w; row++)
        array[row]=a1+row*h;

   array[w/2][h/2] = w + h;

   printf("array[%d][%d] is %d\n",w/2,h/2,array[w/2][h/2]);

   free(array);
   free(a1);
   return 0;
}
