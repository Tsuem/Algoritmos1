/* Ejercicio 1 */
#include <stdio.h>

int main (void) {
    int x, y, z, aux1, aux2;
    printf("Ingresar un numero para x:");
    scanf("%d",&x);
    printf("Ingresar un numero para y:");
    scanf("%d",&y);
    printf("Ingresar un numero para z:");
    scanf("%d",&z);
    assert(y > 0);
    printf("Pre: x=%d, y=%d, z=%d\n",x,y,z);

    aux1 = x;
    aux2 = y;
    x = y;
    y = aux1 + y - z;
    z = aux1 * (1 + (aux2^2));

    printf("Pos: x=%d, y=%d, z=%d\n", x,y,z);

    return 0;
}

/* 
EJM1:
Ingresar un numero para x:3
Ingresar un numero para y:4
Ingresar un numero para z:5
Pre: x=3, y=4, z=5
Pos: x=4, y=2, z=21

EJM2:
Ingresar un numero para x:0
Ingresar un numero para y:0
Ingresar un numero para z:0
ej1: ejercicio1.c:13: main: Assertion `y > 0' failed.
Abortado (`core' generado)

EJM3:
Ingresar un numero para x:3
Ingresar un numero para y:2
Ingresar un numero para z:1
Pre: x=3, y=2, z=1
Pos: x=2, y=4, z=3
*/