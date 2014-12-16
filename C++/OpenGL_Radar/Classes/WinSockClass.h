#ifndef WINSOCKCLASS_H
#define WINSOCKCLASS_H
#include <winsock2.h>
#include <pthread.h>

typedef struct Request
{
    char c1[30];
    int a;
    char c2[30];
    int b;
}Request;

typedef struct Proxy
{
    int AviaoX;
    int AviaoY;
    int AviaoZ;
    double AnguloXY_Tiro;
    double AnguloZ_Tiro;
}Proxy;

typedef struct Thread
{
    char *Msg;
    int nTam;
}Thread;

class WinSockClass
{
    public:
        // metodo construtor
        WinSockClass(int);
        //metodos
        int IniciaServer();
        void CloseServer();
        void AguardandoClient();
        int IniciaClient(char*);

        int Enviar(char*,int);
        int Receber(char*,int);
        void RecNE(char*,int);

    private:
        // variaveis
        int nPort; // PORTA PARA A COMUNICACAO
        WSADATA oWsaDat;
        SOCKET oSocket,oTempSock;
        SOCKADDR_IN oServerInf;
        struct hostent *oHost;
        int nErro;
        //metodos
        int ConfigServer();
        int InciaSocket();
        int IniciaWSA();
        void *Send(void*);
};

#endif // WINSOCKCLASS_H
