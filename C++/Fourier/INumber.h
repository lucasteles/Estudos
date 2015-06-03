#include<math.h>
#include<stdlib.h>
#include<stdio.h>
#define PI M_PI

#define min(a,b) \
   ({ __typeof__ (a) _a = (a); \
       __typeof__ (b) _b = (b); \
     _a < _b ? _a : _b; })

#define max(a,b) \
   ({ __typeof__ (a) _a = (a); \
       __typeof__ (b) _b = (b); \
     _a > _b ? _a : _b; })

typedef struct _INumber {
    double r;
    double i;
} INumber;

double Mod(double,double);
double Ang(double,double);
INumber IMult(INumber,INumber);


