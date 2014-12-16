#ifndef WINSOCKCLASS_H
#define WINSOCKCLASS_H
#include <winsock2.h>

typedef struct Request
{
    char c1[30];
    int a;
    char c2[30];
    int b;
}Request;

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
    private:
        // variaveis
        int nPort; // PORTA PARA A COMUNICACAO
        WSADATA oWsaDat;
        SOCKET oSocket,oTempSock;
        SOCKADDR_IN oServerInf;
        struct hostent *oHost;

        //metodos
        int ConfigServer();
        int InciaSocket();
        int IniciaWSA();
};

#endif // WINSOCKCLASS_H
