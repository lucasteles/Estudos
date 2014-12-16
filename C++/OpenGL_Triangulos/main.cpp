#include <stdio.h>
#include <stdlib.h>
#include <GL/glut.h>

GLdouble width = 600, height = 600,escala = 20;  

GLint pontos[3][2];
int nPontos = 0 ;

int cor = 0;


void display(void)
{
    int i;

    glClearColor(0.0, 0.0, 0.0, 0.0);
    glClear(GL_COLOR_BUFFER_BIT);

   
    glPointSize(1);

    switch (cor)
    {
        case 0:
            glColor3f(1, 1, 1);
            break;

        case 1:
            glColor3f(0, 1, 0);
            break;

        case 2:
            glColor3f(1, 0, 0);
            break;

        case 3:
            glColor3f(0, 0, 1);
            break;
    }
    
    
        
    glBegin(GL_TRIANGLES);


        if (nPontos==3)
        {
        glVertex2i( pontos[0][0], pontos[0][1]);
        glVertex2i( pontos[1][0], pontos[1][1]);
        glVertex2i( pontos[2][0], pontos[2][1]);
        }
    
    
    glEnd();
   
    
    glPointSize(3);
    glBegin(GL_POINTS);     
        for (int n=0;n<nPontos;n++)
            glVertex2f(pontos[n][0],pontos[n][1]);
    glEnd();


  glFlush();
}

void reshape(int w, int h){
  width = (GLdouble) w;
  height = (GLdouble) h;

  glViewport(0, 0, (GLsizei) width, (GLsizei) height);

  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();
  gluOrtho2D(0.0, width, 0.0, height);
}


void mouseClick(int button, int state, int x, int y) {
    if(button == GLUT_LEFT_BUTTON && state == GLUT_DOWN) {
       printf("%i , %i \n",x,y);

       if (nPontos == 3)
           nPontos = 0;


       pontos[nPontos][0]=x;
       pontos[nPontos][1]=height -y;
       nPontos++;
       

       if (nPontos==3)
       {
           if ((pontos[0][0]==pontos[1][0] && pontos[2][0]==pontos[0][0]) || ((pontos[0][1]==pontos[1][1] && pontos[2][1]==pontos[0][1])))
           {
               nPontos=0;
           }


       }
              
       glutPostRedisplay();
           

    }
}



void keydown(unsigned char key, int x, int y) {
    switch (key) {
        case 'b':
            cor = 0; 
            display();
            break;
        case 'v':
            cor = 1; 
            display();
            break;
        case 'c':
            cor = 2; 
            display();
            break;
        case 'x':
            cor = 3; 
            display();
            break;
        
    }
}

int main(int argc, char *argv[]){
  glutInit(&argc, argv);

  glutInitDisplayMode(GLUT_SINGLE | GLUT_RGBA);

  glutInitWindowSize((int) width, (int) height);

  glutCreateWindow("Triangle" );

  glutReshapeFunc(reshape);

  glutDisplayFunc(display);

  glutMouseFunc(mouseClick); 

  glutKeyboardFunc(keydown);

  glutMainLoop();

  return 0;
}