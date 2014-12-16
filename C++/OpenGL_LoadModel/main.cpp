#include <windows.h>
#include <GL/glut.h>
#include <stdio.h>
#include <stdlib.h>
#include "imageloader.h"

typedef struct _Point{
    float x;
    float y;
    float z;
}Point;

typedef struct _Face{
    int *pontos,*normais;
    int num;
}Face;
void DefineIluminacao(void);

GLuint _textureId;
int numponts = 0,numfaces = 0,numnormais = 0;
Point *pontos,*normais;
Face *faces;
char *FileName = "House.mod";

char title[] = "3D Shapes";
double rot = 0;

//Makes the image into a texture, and returns the id of the texture
GLuint loadTexture(Image* image) {
	GLuint textureId;
	glGenTextures(1, &textureId); //Make room for our texture
	glBindTexture(GL_TEXTURE_2D, textureId); //Tell OpenGL which texture to edit
	//Map the image to the texture
	glTexImage2D(GL_TEXTURE_2D,                //Always GL_TEXTURE_2D
				 0,                            //0 for now
				 GL_RGB,                       //Format OpenGL uses for image
				 image->width, image->height,  //Width and height
				 0,                            //The border of the image
				 GL_RGB, //GL_RGB, because pixels are stored in RGB format
				 GL_UNSIGNED_BYTE, //GL_UNSIGNED_BYTE, because pixels are stored
				                   //as unsigned numbers
				 image->pixels);               //The actual pixel data
	return textureId; //Returns the id of the texture
}

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
void initGL() {
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
    glClearDepth(1.0f);

    glEnable(GL_DEPTH_TEST);
	glEnable(GL_LIGHTING);
	glEnable(GL_LIGHT0);
	glEnable(GL_NORMALIZE);
	glEnable(GL_COLOR_MATERIAL);
	glEnable(GL_TEXTURE_2D);

    glDepthFunc(GL_LEQUAL);
    glShadeModel(GL_SMOOTH);
    glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);
    DefineIluminacao();

    Image* image = loadBMP("vtr.bmp");
	_textureId = loadTexture(image);
	delete image;
}

// Função responsável pela especificação dos parâmetros de iluminação
void DefineIluminacao(void){
	GLfloat luzAmbiente[4]={0.2,0.2,0.2,1.0};
	GLfloat luzDifusa[4]={0.7,0.7,0.7,1.0};
	GLfloat luzEspecular[4]={1.0, 1.0, 1.0, 1.0};
	GLfloat posicaoLuz[4]={0.0, 3.0, 3.0, 1.0};

	// Capacidade de brilho do material
	GLfloat especularidade[4]={1.0,1.0,1.0,1.0};
	GLint especMaterial = 60;

	// Define a refletância do material
	glMaterialfv(GL_FRONT,GL_SPECULAR, especularidade);
	// Define a concentração do brilho
	glMateriali(GL_FRONT,GL_SHININESS,especMaterial);

	// Ativa o uso da luz ambiente
	glLightModelfv(GL_LIGHT_MODEL_AMBIENT, luzAmbiente);

	// Define os parâmetros da luz de número 0
	glLightfv(GL_LIGHT0, GL_AMBIENT, luzAmbiente);
	glLightfv(GL_LIGHT0, GL_DIFFUSE, luzDifusa );
	glLightfv(GL_LIGHT0, GL_SPECULAR, luzEspecular );
	glLightfv(GL_LIGHT0, GL_POSITION, posicaoLuz );

	// Habilita o modelo de colorização de Gouraud
	glShadeModel(GL_SMOOTH);
}

void display() {
    int i,j;

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glMatrixMode(GL_MODELVIEW);

    glLoadIdentity();
    glTranslatef(2.0f, 0.0f, -5.0f);
    glRotated(rot,0,1,0);

	glBindTexture(GL_TEXTURE_2D, _textureId);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

    //glColor3f(0.0f, 1.0f, 0.0f);
    int ntex1 = 0,ntex2 = 0;
    for(i=0;i<numfaces;i++){
        ntex1 = 0,ntex2 = 0;
        glBegin(GL_TRIANGLE_FAN);
        for(j=0;j<faces[i].num;j++){
            int nind = faces[i].pontos[j];
            int nindn = faces[i].normais[j];
            glNormal3f( normais[nindn].x, normais[nindn].y, normais[nindn].z);

            if(faces[i].num < 5)
                glTexCoord2f(ntex1, ntex2);
            glVertex3f( pontos[nind].x, pontos[nind].y, pontos[nind].z);

            if(j==1){ntex1=1;ntex2=1;}
            if(j==2){ntex1=0;ntex2=1;}
            if(j==3){ntex1=0;ntex2=1;}
        }
        glEnd();
    }

   if(rot>360)
        rot = 0;

   //rot+=1;
   glutSwapBuffers();
   glutPostRedisplay();
}

void reshape(GLsizei width, GLsizei height) {
   if (height == 0) height = 1;
   GLfloat aspect = (GLfloat)width / (GLfloat)height;

   glViewport(0, 0, width, height);

   glMatrixMode(GL_PROJECTION);
   glLoadIdentity();

   gluPerspective(45.0f, aspect, 1.0f, 100.0f);
}

void CargaInit(){
    size_t nLen = 100;
    char line[nLen];
    int ini = 0,i;

    int numline = 1,fim = 0;

    FILE *file = fopen(FileName,"r");

    if (file == NULL){
        printf("Erro Para Abrir o arquivo!");
        return;
    }

    while( fgets(line,nLen,file)!=NULL )
    {
        if(numline==1){
            numponts   = atoi(extrstr(line,0,find(line," ",1)));
            numnormais = atoi(extrstr(line,find(line," ",1),find(line," ",2)));
            numfaces   = atoi(extrstr(line,find(line," ",2),find(line,"\n",1)));

            pontos  = (Point*)calloc(numponts,sizeof(Point));
            normais = (Point*)calloc(numnormais,sizeof(Point));
            faces = (Face*)calloc(numfaces,sizeof(Face));
        }
        if(numline==2){
            int index = 0;

            for(i=0;i<numponts;i++){
                pontos[i].x = atof(extrstr(line,find(line," ",index    ) ,find(line," ",index+1)));
                pontos[i].y = atof(extrstr(line,find(line," ",index + 1) ,find(line," ",index+2)));
                pontos[i].z = atof(extrstr(line,find(line," ",index + 2) ,find(line," ",index+3)));

                if(i == numponts-1)
                    pontos[i].z = atof(extrstr(line,find(line," ",index + 2) ,find(line,"\n",1)));
                index+=3;
            }
        }
        if(numline==3){
            int index = 0;

            for(i=0;i<numnormais;i++){
                normais[i].x = atof(extrstr(line,find(line," ",index    ) ,find(line," ",index+1)));
                normais[i].y = atof(extrstr(line,find(line," ",index + 1) ,find(line," ",index+2)));
                normais[i].z = atof(extrstr(line,find(line," ",index + 2) ,find(line," ",index+3)));

                if(i == numnormais-1)
                    normais[i].z = atof(extrstr(line,find(line," ",index + 2) ,find(line,"\n",1)));
                index+=3;
            }
        }
        if(numline > 3){
            int indexface = numline - 4;
            int nface = atof(extrstr(line,0,find(line," ",1)));

            int index = 1;
            faces[indexface].num = nface;
            faces[indexface].pontos  = (int*)calloc(nface,sizeof(int));
            faces[indexface].normais = (int*)calloc(nface,sizeof(int));

            for(i=0;i<nface;i++){
                faces[indexface].pontos[i] = atoi(extrstr(line,find(line," ",index    ) ,find(line," ",index+1)));
                index++;
            }
            for(i=0;i<nface;i++){
                faces[indexface].normais[i] = atoi(extrstr(line,find(line," ",index    ) ,find(line," ",index+1)));
                index++;
            }

        }
        numline++;
    }
    fclose(file);
}

void MouseMove(int tnX, int tnY){
    rot ++;
    glutPostRedisplay();
}

void Mouse(int button, int state, int x, int y){




    glutPostRedisplay();
}

int main(int argc, char** argv) {
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE);
    glutInitWindowSize(640, 480);
    glutInitWindowPosition(50, 50);
    glutCreateWindow(title);
    glutDisplayFunc(display);
    glutReshapeFunc(reshape);
    glutMouseFunc(Mouse);
    glutMotionFunc(MouseMove);
    CargaInit();
    initGL();

    glutMainLoop();

    return 0;
}
