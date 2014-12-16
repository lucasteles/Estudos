#ifdef WIN32
#include <windows.h>
#endif // WIN32
#include <stdio.h>
#include <stdlib.h>
#define PI 3.14159265359
#include <GL/glut.h>

typedef struct _Point{
    float x;
    float y;
    float z;
}Point;

typedef struct _Face{
    int *pontos,*normais;
    int num;
}Face;

typedef struct _Obj{
    Face *faces;
    int numfaces,numnormais,numponts;
    Point *pontos,*normais;
    int rgb[3];
    char *arq;
}Obj;

typedef struct {
    float x,y,z,ang,dis;
} Camera;

typedef struct {
    float h,w;
} Plano;

typedef struct {
    float x,y,z;
    int d;
    int rotx,roty,rotz;
    float fatx,faty,fatz,fatrot;
    float rot,tam;
    float stepx,stepy,stepz;
} Mov;

typedef struct {
    int width;
	int height;
	char* title;

	float field_of_view_angle;
	float z_near;
	float z_far;
} glutWindow;

int find(char *, char *,int);
char *substr(char *,int,int);
char *extrstr(char *,int,int);
void CargaObj(Obj *);
void drawBox(GLfloat, GLenum);
