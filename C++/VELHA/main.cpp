#include <cstdlib>
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

using namespace std;
char matrix[3][3]; // a matriz do jogo


char check(void)
{
     int i;
    
     for(i=0; i<3; i++) //verifica as linhas
              if(matrix[i][0]==matrix[i][1] &&
                 matrix[i][0]==matrix[i][2]) 
			return matrix[i][0];
    
     for(i=0; i<3; i++) //verifica as colunas
              if(matrix[0][i]==matrix[1][i] &&
                 matrix[0][i]==matrix[2][i]) 
			return matrix[0][i];
    
     for(i=0; i<3; i++) // verifica a diagonal
              if(matrix[0][0]==matrix[1][1] &&
                 matrix[1][1]==matrix[2][2]) 
			return matrix[0][0];
    
     for(i=0; 1<3; i++)// verifica a diagonal
              if(matrix[0][2]==matrix[1][1] &&
                 matrix[1][1]==matrix[2][0]) 
			return matrix[0][2];
                
     for(i=0; i<3; i++) // verifica se ha empate
              if(matrix[0][0]!=' ' && matrix[0][1] !=' ' &&
                 matrix[0][2]!=' ' && matrix[1][0] !=' ' &&
                 matrix[1][1]!=' ' && matrix[1][2] !=' ' &&
                 matrix[2][0]!=' ' && matrix[2][1] !=' ' &&
                 matrix[2][2]!=' ') 
			return 'v';
     return ' ';
}
              
void init_matrix(void) //inicializa a matriz
{
     int i, j;
     for(i=0; i<3; i++)
              for(j=0; j<3; j++) matrix[i][j]=' ';
              }
              
void jogador1(void)
{
     int x,y;
     printf("Jogador 1 digite a linha e coluna para o 'x': ");
     scanf("%d%d", &x, &y);
     x--; y--;
    
     if(matrix[x][y] !=' ')
     {
                     printf("Posicao invalida, tente novamente. \n");
                     jogador1();
                     }
     else matrix[x][y]='x';
     }


void disp_matrix(void)
{
     int t;
    
     for(t=0; t<3; t++)
     {
              printf(" %c | %c | %c ", matrix[t][0], matrix[t][1], matrix[t][2]);
              if(t!=2) printf("\n---|---|---\n");
              }
     printf("\n");
     }
    
void jogador2(void)
{    
    
     disp_matrix();
     int x,y;
     printf("Jogador 2 digite a linha e coluna para a 'o': ");
     scanf("%d%d", &x, &y);
     x--; y--;
    
     if(matrix[x][y] !=' ')
     {
                     printf("Posicao invalida, tente novamente. \n");
                     jogador2();
                     }
     else matrix[x][y]='o';
     }


int main (void)
{
    char done;
    
    done=' ';
    init_matrix();
    do
    {
                  printf("Este e o jogo-da-velha.\n");
                  printf("Divirta-se com seu amigo\n");                  
                  disp_matrix();
                  jogador1();
                  done=check(); //verifica se ha vencedor                  
                  system("cls");
                  printf("Este e o jogo-da-velha.\n");
                  printf("Divirta-se com seu amigo\n");
                  if(done!=' ')break; //vencedor                  
                  jogador2();
                  done = check(); // verifica se ha vencedor
                  
                  system("cls");
                  }while(done==' ');
                  
    if(done=='x')
    {printf("Jogador 1 venceu!\n");
                  getch();}
    else if(done=='o')
    {printf("Jogador 2 venceu\n");
     getch();}
    else
    {printf("Velha!");
     getch();}
    
    getch();
    main();
}


