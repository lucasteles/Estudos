#include <stdio.h>
#include <stdlib.h>
#include <GL/glut.h>
#include <Windows.h>
#include <math.h>


typedef struct _point{
	double x ;
	double y;
} point;

typedef struct _frame{
	point *points;
} frame;


void reshape(int, int );
void display(void);
void init_frame();
void fill_frame_1(int);
void fill_frame_2(int);
void tween_line(int);
void next();

GLint ConvX(GLdouble);
GLint ConvY(GLdouble);


#define qt_frames 4
#define qt_points 16

// medidas e escalas
GLdouble width = 600, height = 600, escala = 20;   

//controle de sweep
int qt_iteractions = 300;
int cur_iteraction = 0;
int cur_frame = 0;
int sleep_time = 10;

//frame control
frame *Frames;

int main(int argc, char *argv[]){
  glutInit(&argc, argv);
  glutInitDisplayMode(GLUT_SINGLE | GLUT_RGBA);
  glutInitWindowSize((int) width, (int) height);
  glutCreateWindow("Tweenando!" );
  glutReshapeFunc(reshape);
  glutDisplayFunc(display);

  //frame initialize
  init_frame();
  fill_frame_1(0);
  fill_frame_2(1);
  fill_frame_1(2);
  fill_frame_2(3);

  glutMainLoop();

  return 0;
}


void display(void)
{
   

	//plan lines
    glClearColor(0.0, 0.0, 0.0, 0.0);
    glClear(GL_COLOR_BUFFER_BIT);
    glColor3f(.5, .1, .1);
    glBegin(GL_LINES);
        glVertex2i(ConvX(0),ConvY(30));
        glVertex2i(ConvX(0),ConvY(-30));
        glVertex2i(ConvX(-30),ConvY(0));
        glVertex2i(ConvX(30),ConvY(0));
    glEnd();
	
    
    //points
    glColor3f(1, 1, 1);

	//printa o frame corrente e esperara 1/2 segundo para iniciar o tween
	if (cur_iteraction==0)
	{
		glBegin(GL_LINES);
			for (int i=0; i < qt_points; i++)
				glVertex2i( ConvX(Frames[cur_frame].points[i].x),ConvY(Frames[cur_frame].points[i].y));

		glEnd();
		glFlush();
		Sleep(500);
	}

    glBegin(GL_LINES);
    	
		for (int i=0; i < qt_points; i++)
			tween_line(i);
	
		next();
	glEnd();

  glFlush();
  Sleep(sleep_time);

 
}

GLint ConvX(GLdouble x){
    return((x*escala)+(width/2));
}

GLint ConvY(GLdouble y){
    return((y*escala)+(height/2));
}


void reshape(int w, int h){
  width = (GLdouble) w;
  height = (GLdouble) h;

  glViewport(0, 0, (GLsizei) width, (GLsizei) height);

  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();
  gluOrtho2D(0.0, width, 0.0, height);
}

void tween_line(int nP)
{
	int next_frame = cur_frame+1;
	double linear_coef, ang_coef, stepX,stepY;
	GLdouble newX,newY;

	

	if (cur_frame==qt_frames-1)
	{
		glVertex2i( ConvX(Frames[cur_frame].points[nP].x),
					ConvY(Frames[cur_frame].points[nP].y));
		return;
	}
	
	//calcula coeficiente angular entre os pontos
	if (Frames[next_frame].points[nP].x - Frames[cur_frame].points[nP].x != 0)
		ang_coef = ( Frames[next_frame].points[nP].y - Frames[cur_frame].points[nP].y) /
					  ( Frames[next_frame].points[nP].x - Frames[cur_frame].points[nP].x);
	else
		ang_coef = 0 ;
	
	
	if (Frames[next_frame].points[nP].x - Frames[cur_frame].points[nP].x != 0)
		linear_coef = ( Frames[next_frame].points[nP].x - Frames[cur_frame].points[nP].x) /
					  ( Frames[next_frame].points[nP].y - Frames[cur_frame].points[nP].y);
	else
		linear_coef = 0 ;

	stepX = (Frames[next_frame].points[nP].x - Frames[cur_frame].points[nP].x )/qt_iteractions;
	stepY = (Frames[next_frame].points[nP].y - Frames[cur_frame].points[nP].y )/qt_iteractions;
	newX = (GLdouble) Frames[cur_frame].points[nP].x + (stepX*cur_iteraction);
	newY = (GLdouble) Frames[cur_frame].points[nP].y + (stepY*cur_iteraction); 
	glVertex2i( ConvX(newX), ConvY(newY) );
	glutPostRedisplay();

}


void init_frame()
{

	Frames = (frame*) malloc(sizeof(frame)*qt_frames);
	for(int i=0;i<qt_frames; i++)
	{
		Frames[i].points = (point*) malloc(sizeof(point)*qt_points);
	}

}

void next()
{

   cur_iteraction++;
   if (cur_iteraction==qt_iteractions+1)
   {
		cur_frame++;
		cur_iteraction=0;
	}
}

void fill_frame_1(int ind)
{
	int index = ind;
	
	Frames[index].points[0].x = -6;
	Frames[index].points[0].y = -6;

	Frames[index].points[1].x = -6;
	Frames[index].points[1].y = 3;
	

	Frames[index].points[2].x = -6;
	Frames[index].points[2].y = 3;

	Frames[index].points[3].x = 0;
	Frames[index].points[3].y = 7.5;
	
	
	Frames[index].points[4].x = 0;
	Frames[index].points[4].y = 7.5;

	Frames[index].points[5].x = 6;
	Frames[index].points[5].y = 3;


	Frames[index].points[6].x = 6;
	Frames[index].points[6].y = 3;

	Frames[index].points[7].x = 6;
	Frames[index].points[7].y = -6;


	Frames[index].points[8].x = 6;
	Frames[index].points[8].y = -6;

	Frames[index].points[9].x = -6;
	Frames[index].points[9].y = -6;


	Frames[index].points[10].x = -4.5;
	Frames[index].points[10].y = -6;
	
	Frames[index].points[11].x = -4.5;
	Frames[index].points[11].y = -1.5;


	Frames[index].points[12].x = -4.5;
	Frames[index].points[12].y = -1.5;

	Frames[index].points[13].x = -2.4;
	Frames[index].points[13].y = -1.5;


	Frames[index].points[14].x = -2.4;
	Frames[index].points[14].y = -1.5;

	Frames[index].points[15].x = -2.4;
	Frames[index].points[15].y = -6;

	
	
}
void fill_frame_2(int ind)
{
	int index = ind;
	
	Frames[index].points[0].x = 7;
	Frames[index].points[0].y = 6;

	Frames[index].points[1].x = 6;
	Frames[index].points[1].y = -5;
	
	Frames[index].points[2].x = -6;
	Frames[index].points[2].y = -5;

	Frames[index].points[3].x = -7;
	Frames[index].points[3].y = 6;
	
	
	Frames[index].points[4].x = -7;
	Frames[index].points[4].y = 6;

	Frames[index].points[5].x = 7;
	Frames[index].points[5].y = 6;


	Frames[index].points[6].x = -6;
	Frames[index].points[6].y = -5;

	Frames[index].points[7].x = 0;
	Frames[index].points[7].y = -8;


	Frames[index].points[8].x = 0;
	Frames[index].points[8].y = -8;

	Frames[index].points[9].x = 6;
	Frames[index].points[9].y = -5;


	Frames[index].points[10].x = -3;
	Frames[index].points[10].y = -3;
	
	Frames[index].points[11].x = 3;
	Frames[index].points[11].y = -3;


	Frames[index].points[12].x = -4;
	Frames[index].points[12].y = 3;

	Frames[index].points[13].x = -1;
	Frames[index].points[13].y = 1;


	Frames[index].points[14].x = 4;
	Frames[index].points[14].y = 3;

	Frames[index].points[15].x = 1;
	Frames[index].points[15].y = 1;
	

}