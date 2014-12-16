#ifdef WIN32
#include <windows.h>
#endif // WIN32

#include "Funcs.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <GL/glut.h>
#include "imageloader.h"

#define KEY_ESCAPE 27
#define KEY_UP 101
#define KEY_DOWN 103
#define KEY_LEFT 100
#define KEY_RIGTH 102

int nXMouse,nYMouse,nCamH,nCamV;
void initialize();
float boxsize = 10;
Obj *Objetos;

glutWindow win;
Mov Bola;
Camera Visao;
GLuint _textureId;
double angulox = 0,anguloz = 0;
float rotluz = 0,xluz = 0,yluz = 30,zluz = 0;

GLfloat amb_light[] = { 0.1, 0.1, 0.1, 1.0 };
GLfloat diffuse[] = { 0.6, 0.6, 0.6, 1 };
GLfloat specular[] = { 0.7, 0.7, 0.3, 1 };
GLfloat light_position[4];

void keyboard ( unsigned char, int, int  );
void Arrows(int, int, int);

GLuint loadTexture(Image* image) {
	GLuint textureId;
	glGenTextures(1, &textureId);
	glBindTexture(GL_TEXTURE_2D, textureId);

	glTexImage2D(GL_TEXTURE_2D,
				 0,
				 GL_RGB,
				 image->width, image->height,
				 0,
				 GL_RGB,
				 GL_UNSIGNED_BYTE,
				 image->pixels);
	return textureId;
}

void init(){
    Bola.stepx = 0.01;
    Bola.stepy = 0.01;
    Bola.stepz = 0.01;
    Bola.fatx = 0;
    Bola.fatz = 0;
    Bola.tam = 1;
    Bola.x = 0;
    Bola.y = 0;
    Bola.z = 0;
}

void colisao(Mov *tBole){
    Bola.x   += Bola.stepx * Bola.fatx;
    Bola.z   += Bola.stepz * Bola.fatz;
    Bola.rot += Bola.fatrot;
    Bola.rotx = 0;
    Bola.roty = 1;
    Bola.rotz = 0;

    if(Bola.fatz != 0)
        Bola.rotx = 1;
    if(Bola.fatx != 0)
        Bola.rotz = 1;

    if((Bola.z-Bola.tam) <= -boxsize ||  (Bola.z+Bola.tam) >= boxsize){
        Bola.z   -= Bola.stepz * Bola.fatz;
        Bola.rot = 0;
    }
    if((Bola.x-Bola.tam) <= -boxsize || (Bola.x+Bola.tam) >= boxsize){
        Bola.x   -= Bola.stepx * Bola.fatx;
        Bola.rot = 0;
    }
}

void reload(){
    glLoadIdentity();
	gluLookAt(Visao.x,Visao.y,Visao.z,0,0,0,0,1,0);
    glRotated(angulox,1,0,0);
    glRotated(anguloz,0,0,1);
}

void display()
{
    light_position[0] = xluz;
    light_position[1] = yluz;
    light_position[2] = zluz;
    light_position[3] = 0;

    glLoadIdentity();
    glRotatef(rotluz, 1.0, 0.0, 0.0);
    glLightModelfv( GL_LIGHT_MODEL_AMBIENT, amb_light );
    //glLightfv( GL_LIGHT0, GL_DIFFUSE, diffuse );
    //glLightfv( GL_LIGHT0, GL_SPECULAR, specular );
    glLightfv(GL_LIGHT0, GL_POSITION, light_position);

	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

    int k,i,j;
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    glColor4f(1,1,1,1.5);
	reload();
    glScaled(boxsize*2,0.5,boxsize*2);
    drawBox(1, GL_QUADS);
    // paredes
    reload();
    glTranslatef(boxsize,1,0);
    glScaled(0.5,2.5,boxsize*2);
    drawBox(1, GL_QUADS);

    reload();
    glTranslatef(0,1,boxsize);
    glScaled(boxsize*2,2.5,0.5);
    drawBox(1, GL_QUADS);

    reload();
    glTranslatef(-boxsize,1,0);
    glScaled(0.5,2.5,boxsize*2);
    drawBox(1, GL_QUADS);

    reload();
    glTranslatef(0,1,-boxsize);
    glScaled(boxsize*2,2.5,0.5);
    drawBox(1, GL_QUADS);

    reload();
    // DESENHA BOLA
	glPushMatrix();
        colisao(&Bola);

        glColor4f(1,0,0,1);
		glTranslatef(Bola.x,Bola.y+Bola.tam,Bola.z);

        glRotatef(Bola.rot,Bola.rotx,Bola.roty,Bola.rotz);
		glutSolidSphere(Bola.tam , 10 , 10 );
	glPopMatrix();

    Sleep(1000/60);
	glutSwapBuffers();
}

void _MouseCall(int btn, int state, int tnX, int tnY){
    nXMouse = tnX;
    nYMouse = tnY;
}

void _MouseMove(int tnX, int tnY){
    double nRad = Visao.ang * (PI / 180);
    Visao.ang += tnX - (nXMouse);

    nCamV += tnY - (nYMouse);

    nXMouse = tnX;
    nYMouse = tnY;
    Visao.x = (double) (cos(nRad) * Visao.dis);
    Visao.z = (double) (sin(nRad) * Visao.dis);
    Visao.y = nCamV;
}

void keyboard ( unsigned char key, int mousePositionX, int mousePositionY )
{
    double nRad = Visao.ang * (PI / 180);

    switch (key)
    {
    case '+':
        Visao.dis--;
        break;
    case '-':
        Visao.dis++;
        break;
    case ',':
        Visao.ang--;
        break;
    case '.':
        Visao.ang++;
        break;
    case 'q':
        rotluz++;
        break;
    case 'w':
        rotluz--;
        break;
    default:
        break;
    }
    Visao.x = (double) (cos(nRad) * Visao.dis);
    Visao.z = (double) (sin(nRad) * Visao.dis);
}

void Arrows(int tnKey, int tnX, int tnY){
    int k = 1;
    int maxang = 30,maxfat = 10;
    switch(tnKey){
        case KEY_UP:
            if(Bola.fatz>-maxfat){
                Bola.fatz -= k;
                Bola.fatrot -=k;
            }
            if(angulox> -maxang)
                angulox--;
            break;
        case KEY_DOWN:
            if(Bola.fatz<maxfat){
                Bola.fatz   += k;
                Bola.fatrot += k;
            }
            if(angulox< maxang)
                angulox++;
            break;
        case KEY_LEFT:
            if(Bola.fatx>-maxfat){
                Bola.fatx   -= k;
                Bola.fatrot += k;
            }
            if(anguloz< maxang)
                anguloz++;
            break;
        case KEY_RIGTH:
            if(Bola.fatx<maxfat){
                Bola.fatx   += k;
                Bola.fatrot -= k;
            }
            if(anguloz > -maxang)
            anguloz--;
            break;
    }
}

int main(int argc, char **argv)
{
    Visao.y   = 10;
    Visao.ang = 90;
    Visao.dis = 30;
    double nRad = Visao.ang * (PI / 180);
    Visao.x = (double) (cos(nRad) * Visao.dis);
    Visao.z = (double) (sin(nRad) * Visao.dis);

	win.width               = 800;
	win.height              = 600;
	win.title               = "ProjetoGL";
	win.field_of_view_angle = 45;
	win.z_near              = 1.0f;
	win.z_far               = 500.0f;

	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_RGB | GLUT_DOUBLE | GLUT_DEPTH );
	glutInitWindowSize(win.width,win.height);
	glutCreateWindow(win.title);
	glutDisplayFunc(display);
	glutIdleFunc(display);
    glutKeyboardFunc(keyboard);
    glutSpecialFunc(Arrows);
    glutMouseFunc (_MouseCall);
    glutMotionFunc(_MouseMove);

    init();
	initialize();
	glutMainLoop();
	return 0;
}

void initialize()
{
    glViewport(0, 0, win.width, win.height);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    GLfloat aspect = (GLfloat) win.width / win.height;
	gluPerspective(win.field_of_view_angle, aspect, win.z_near, win.z_far);
    glMatrixMode(GL_MODELVIEW);
    glClearDepth( 1.0f );
    glDepthFunc( GL_LEQUAL );
    glHint( GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST );

    glEnable( GL_COLOR_MATERIAL );
    glShadeModel( GL_SMOOTH );
    glLightModeli( GL_LIGHT_MODEL_TWO_SIDE, GL_FALSE );
    glDepthFunc( GL_LEQUAL );
    glEnable( GL_DEPTH_TEST );
    glEnable(GL_LIGHTING);
    glEnable( GL_LIGHT0 );
    glEnable(GL_TEXTURE_2D);

	glClearColor(0.0, 0.5, 1.0, 1.0);

	Image* image = loadBMP("Textura.bmp");
	_textureId = loadTexture(image);
	delete image;
}
