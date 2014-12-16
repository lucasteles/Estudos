#include <iostream>
#include <time.h>
#include <Windows.h>
#include "..\Classes\WinSockClass.h"

int nPort = 90; // PORTA PARA A COMUNICACAO
bool lRun = true; // CONTROLA O LOOP DE RESPOSTA DO CLIENT
WinSockClass oWinSock = WinSockClass(nPort);

// INICIO
int main()
{
    if(oWinSock.IniciaServer()==0)
        return 0;
    // Espera uma conexao
    oWinSock.AguardandoClient();
    Proxy *oProxy = (Proxy *)malloc(sizeof(Proxy));


    clock_t tNow = clock();
    char cBuffer[1000];
    int inDataLength = 0;
    //Quando client desconectar sai do loop
    while(lRun)
    {
        // se for -1, o client desconectou
        if(inDataLength>=0)
        {
            // recebe a msg do client
            memset(cBuffer,0,999);
            inDataLength = oWinSock.Receber((char*)oProxy,sizeof(Proxy));


            // Exibe menssagem
            std::cout<<oRequest->c1;
            std::cout<<"\n";

            // pega o tempo atual
            tNow = clock();

            // Envia msg para o client
            memset(cBuffer,0,999);
            strcpy(cBuffer,"Enviada!");
            oWinSock.Enviar(cBuffer,sizeof(cBuffer));

            // pega confirmacao de recebimento
            memset(cBuffer,0,999);
            inDataLength = oWinSock.Receber(cBuffer,sizeof(cBuffer));

            std::cout<<cBuffer;
            // exibe o tempo que estava armazenado e subitrai do tempo atual
            std::cout<<" Tempo: ";
            std::cout << float( clock () - tNow ) /  CLOCKS_PER_SEC;
            std::cout<<" Segs\n\n";
        }
        else
            lRun = false;

    }
    // fecha servidor
    oWinSock.CloseServer();
    std::cout<<"Cliente Desconectado!\r\n\r\n";
    system("PAUSE");
    return 0;
}


