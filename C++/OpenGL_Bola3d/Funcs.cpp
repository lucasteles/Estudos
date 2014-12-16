#include "Funcs.h"

int find(char *tchar, char *tfind,int occurs){
    int fim = 0;
    int achou = 0;

    while(tchar[fim] !=NULL){
        if(tchar[fim] != *tfind)
            fim++;
        else{
            achou++;
            if(achou == occurs)
                break;
            fim++;
        }
    }
    if(achou != occurs)
        fim = 0;

    return fim;
}

char *substr(char *tchar,int tini,int tlen){
    char *retorno = (char*)calloc(tlen,sizeof(char*));
    int i,k=0;

    for(i=tini;i<(tini+tlen);i++){
        retorno[k] = tchar[i];
        k++;
    }

    return retorno;
}

char *extrstr(char *tchar,int tini,int tfin){
    char *retorno = (char*)calloc((tfin-tini),sizeof(char*));
    int i,k=0;

    for(i=tini;i<tfin;i++){
        retorno[k] = tchar[i];
        k++;
    }

    return retorno;
}

void CargaObj(Obj *tObj){
    size_t nLen = 100;
    char line[nLen];
    int i;
    int numline = 1;

    FILE *file = fopen(tObj->arq,"r");

    if (file == NULL){
        printf("Erro Para Abrir o arquivo(%s)!",tObj->arq);
        return;
    }

    while( fgets(line,nLen,file)!=NULL )
    {
        if(numline==1){
            tObj->numponts   = atoi(extrstr(line,0,find(line," ",1)));
            tObj->numnormais = atoi(extrstr(line,find(line," ",1),find(line," ",2)));
            tObj->numfaces   = atoi(extrstr(line,find(line," ",2),find(line,"\n",1)));

            tObj->pontos    = (Point*)calloc(tObj->numponts,sizeof(Point));
            tObj->normais   = (Point*)calloc(tObj->numnormais,sizeof(Point));
            tObj->faces     = (Face*)calloc(tObj->numfaces,sizeof(Face));
        }
        if(numline==2){
            int index = 0;

            for(i=0;i<tObj->numponts;i++){
                tObj->pontos[i].x = atof(extrstr(line,find(line," ",index    ) ,find(line," ",index+1)));
                tObj->pontos[i].y = atof(extrstr(line,find(line," ",index + 1) ,find(line," ",index+2)));
                tObj->pontos[i].z = atof(extrstr(line,find(line," ",index + 2) ,find(line," ",index+3)));

                if(i == tObj->numponts-1)
                    tObj->pontos[i].z = atof(extrstr(line,find(line," ",index + 2) ,find(line,"\n",1)));
                index+=3;
            }
        }
        if(numline==3){
            int index = 0;

            for(i=0;i<tObj->numnormais;i++){
                tObj->normais[i].x = atof(extrstr(line,find(line," ",index    ) ,find(line," ",index+1)));
                tObj->normais[i].y = atof(extrstr(line,find(line," ",index + 1) ,find(line," ",index+2)));
                tObj->normais[i].z = atof(extrstr(line,find(line," ",index + 2) ,find(line," ",index+3)));

                if(i == tObj->numnormais-1)
                    tObj->normais[i].z = atof(extrstr(line,find(line," ",index + 2) ,find(line,"\n",1)));
                index+=3;
            }
        }
        if(numline > 3){
            int indexface = numline - 4;
            int nface = atof(extrstr(line,0,find(line," ",1)));

            int index = 1;
            tObj->faces[indexface].num = nface;
            tObj->faces[indexface].pontos  = (int*)calloc(nface,sizeof(int));
            tObj->faces[indexface].normais = (int*)calloc(nface,sizeof(int));

            for(i=0;i<nface;i++){
                tObj->faces[indexface].pontos[i] = atoi(extrstr(line,find(line," ",index    ) ,find(line," ",index+1)));
                index++;
            }
            for(i=0;i<nface;i++){
                tObj->faces[indexface].normais[i] = atoi(extrstr(line,find(line," ",index    ) ,find(line," ",index+1)));
                index++;
            }

        }
        numline++;
    }
    fclose(file);
}

void drawBox(GLfloat size, GLenum type)
{
  GLfloat n[6][3] =
  {
    {-1.0, 0.0, 0.0},
    {0.0, 1.0, 0.0},
    {1.0, 0.0, 0.0},
    {0.0, -1.0, 0.0},
    {0.0, 0.0, 1.0},
    {0.0, 0.0, -1.0}
  };
  GLint faces[6][4] =
  {
    {0, 1, 2, 3},
    {3, 2, 6, 7},
    {7, 6, 5, 4},
    {4, 5, 1, 0},
    {5, 6, 2, 1},
    {7, 4, 0, 3}
  };
  GLfloat v[8][3];
  GLint i;

  v[0][0] = v[1][0] = v[2][0] = v[3][0] = -size / 2;
  v[4][0] = v[5][0] = v[6][0] = v[7][0] = size / 2;
  v[0][1] = v[1][1] = v[4][1] = v[5][1] = -size / 2;
  v[2][1] = v[3][1] = v[6][1] = v[7][1] = size / 2;
  v[0][2] = v[3][2] = v[4][2] = v[7][2] = -size / 2;
  v[1][2] = v[2][2] = v[5][2] = v[6][2] = size / 2;

  for (i = 5; i >= 0; i--) {
    glBegin(type);
    glNormal3fv(&n[i][0]);
    glTexCoord2f(0, 0);
    glVertex3fv(&v[faces[i][0]][0]);
    glTexCoord2f(0, 1);
    glVertex3fv(&v[faces[i][1]][0]);
    glTexCoord2f(1,0);
    glVertex3fv(&v[faces[i][2]][0]);
    glTexCoord2f(1, 1);
    glVertex3fv(&v[faces[i][3]][0]);
    glEnd();
  }
}
