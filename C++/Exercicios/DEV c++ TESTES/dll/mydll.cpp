#include "mydll.h"

extern "C" __declspec(dllexport) char SchuxMann(char teste){
       MessageBox(NULL,"Primeira dll do SchuxMann. Ahhh muleke, agora, como eu recebo parametro","teste",MB_OK | MB_ICONINFORMATION);
       return(teste);
}
