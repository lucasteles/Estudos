#define Limite 1024

typedef struct MyMem
{
  char *nMem;
  int nTam;
  char lAloc;
  char lFim;
  struct MyMem *oProx;
  struct MyMem *oAnt;

} Memoria;

Memoria *PMemoria;
char cHeap[Limite];

void GerMemInit();
Memoria* BuscarMem(char *);
void Libera(char *);
char* Aloc(int);
