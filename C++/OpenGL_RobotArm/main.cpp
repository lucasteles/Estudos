#include <windows.h>
#include <stdio.h>

#ifdef __APPLE_CC__
#include <GLUT/glut.h>
#else
#include <GL/glut.h>
#endif



static int shoulderAngle = 0, elbowAngle = 0, baseangle=0, camerax=0,cameray=0, nXMouse=0, nYMouse=0;
static float scale=1;


void special(int key, int, int) {
  switch (key) {
    case GLUT_KEY_LEFT: (elbowAngle += 5) %= 360; break;
    case GLUT_KEY_RIGHT: (elbowAngle -= 5) %= 360; break;
    case GLUT_KEY_UP: (shoulderAngle += 5) %= 360; break;
    case GLUT_KEY_DOWN: (shoulderAngle -= 5) %= 360; break;
    default: return;
  }
  glutPostRedisplay();
}


void wireBox(GLdouble width, GLdouble height, GLdouble depth) {
  glPushMatrix();
  glScalef(width, height, depth);
  //glutWireCube(1.0);
  glutSolidCube(1.0);
  glPopMatrix();
}


void display() {

  glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
  glMatrixMode(GL_MODELVIEW);


  glPushMatrix();

    glScalef((GLfloat)scale,(GLfloat)scale,(GLfloat)scale);

    glRotatef((GLfloat)camerax, 0.0, 1.0, 0.0);
    glRotatef((GLfloat)cameray, 1.0, 0.0, 0.0);

    glColor3d(.3, .3, .3);
    wireBox(25, .5, 25);
    glTranslatef(0.0, .3, 0.0);

    glRotatef((GLfloat)baseangle, 0.0, 1.0, 0.0);

    float base=270;
    glRotatef((GLfloat)base, 1.0, 0.0, 0.0);
    glColor3d(0,1,0);
    glutSolidCone(1,1,16,16);

    glTranslatef(0.0, 0.0, .8);
    glRotatef((GLfloat)360-base, 1.0, 0.0, 0.0);
    glColor3d(0,0,1);
    glutSolidSphere(.4,16,16);

    glColor3d(1,0,0);
    glRotatef((GLfloat)shoulderAngle, 0.0, 0.0, 1.0);
    glTranslatef(2.0, 0.0, 0.0);
    wireBox(4.0, 0.4, 0.5);


    glTranslatef(2.0, 0.0, 0.0);
    glColor3d(0,0,1);
    glutSolidSphere(.4,16,16);

    glColor3d(1,0,0);
    glRotatef((GLfloat)elbowAngle, 0.0, 0.0, 1.0);
    glTranslatef(2.0, 0.0, 0.0);
    wireBox(4.0, 0.4, 0.5);

    glTranslatef(2.0, 0.0, 0.0);
    glColor3d(1,1,1);
    glutSolidSphere(.3,32,32);

  glPopMatrix();
  glutSwapBuffers();
}

static void key(unsigned char key, int x, int y)
{
    switch (key)
    {
        case 27 :
        case 'a':(baseangle += 5) %= 360; break;
        case 's':(baseangle -= 5) %= 360; break;
        case '+':(scale += 0.1); break;
        case '-':(scale -= 0.1); break;
    }


    glutPostRedisplay();
}


void _MouseCall(int btn, int state, int tnX, int tnY){
    nXMouse = tnX;
    nYMouse = tnY;
}

void _MouseMove(int tnX, int tnY){
    camerax += tnX - (nXMouse);
    cameray += tnY - (nYMouse);
    glutPostRedisplay();
    nXMouse = tnX;
    nYMouse = tnY;
}

void reshape(GLint w, GLint h) {
  glViewport(0, 0, w, h);
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();
  gluPerspective(65.0, GLfloat(w)/GLfloat(h), 1.0, 50.0);
}


const GLfloat light_ambient[]  = { 0.0f, 0.0f, 0.0f, 1.0f };
const GLfloat light_diffuse[]  = { 1.0f, 1.0f, 1.0f, 1.0f };
const GLfloat light_specular[] = { 1.0f, 1.0f, 1.0f, 1.0f };
const GLfloat light_position[] = { 10.0f, 10.0f, 10.0f, 0.0f };

const GLfloat mat_ambient[]    = { 0.7f, 0.7f, 0.7f, 1.0f };
const GLfloat mat_diffuse[]    = { 0.8f, 0.8f, 0.8f, 2.0f };
const GLfloat mat_specular[]   = { 1.0f, 1.0f, 1.0f, 1.0f };
const GLfloat high_shininess[] = { 100.0f };

const GLfloat pos[] = { 5.0f, 5.0f, 5.f, 0.0f };

int main(int argc, char** argv) {
  glutInit(&argc, argv);
   glutInitDisplayMode(GLUT_RGB | GLUT_DOUBLE | GLUT_DEPTH);
  glutInitWindowPosition(80, 80);
  glutInitWindowSize(800, 600);
  glutCreateWindow("Robot Arm");
  glutDisplayFunc(display);
  glutReshapeFunc(reshape);
  glutSpecialFunc(special);
   glutMouseFunc (_MouseCall);
    glutMotionFunc(_MouseMove);
  glutKeyboardFunc(key);

  gluLookAt(11,4,16, 0,5,0, 0,2,0);

  glShadeModel(GL_FLAT);
  glEnable(GL_CULL_FACE);
  glCullFace(GL_BACK);

  glEnable(GL_DEPTH_TEST);
  glDepthFunc(GL_LESS);

  glEnable(GL_LIGHT0);
  glEnable(GL_LIGHT1);
  glEnable(GL_NORMALIZE);
  glEnable(GL_COLOR_MATERIAL);
  glEnable(GL_LIGHTING);


  glLightfv(GL_LIGHT0, GL_AMBIENT,  light_ambient);
  glLightfv(GL_LIGHT0, GL_DIFFUSE,  light_diffuse);
  glLightfv(GL_LIGHT0, GL_SPECULAR, light_specular);
  glLightfv(GL_LIGHT0, GL_POSITION, light_position);

 //glLightfv(GL_LIGHT0, GL_AMBIENT, light_ambient);
  glLightfv( GL_LIGHT1, GL_POSITION, pos );



  glMaterialfv(GL_FRONT, GL_AMBIENT,   mat_ambient);
  glMaterialfv(GL_FRONT, GL_DIFFUSE,   mat_diffuse);
  glMaterialfv(GL_FRONT, GL_SPECULAR,  mat_specular);
  glMaterialfv(GL_FRONT, GL_SHININESS, high_shininess);

  glutMainLoop();


}
