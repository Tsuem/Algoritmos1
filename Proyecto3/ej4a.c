#include <stdio.h>

int main(void) {
    int x,y;
    printf("Ingrese un valor para x:\n");
    scanf("%d",&x);
    printf("Ingrese un valor para y:\n");
    scanf("%d",&y);

    if (x >= y) {
        x = 0;
    } else {
        x = 2;
    }
    printf("Los valores actuales de x y y son: %d y %d\n", x, y);

    return 0;
}

    /* 
    EJECUCIÓN PROGRAMA 
    1. ejercicio 1.e 
    (x→3, y→1)
    Ingrese un valor para x:
    3
    Ingrese un valor para y:
    1
    Los valores actuales de x y y son: 0 y 1


    2. ejercicio 1.e 
    (x→50, y→20)
    Ingrese un valor para x:
    50
    Ingrese un valor para y:
    20
    Los valores actuales de x y y son: 0 y 20



    EJECUCIÓN PROGRAMA 
    1. ejercicio 1.f 
    (x→-100, y→1)
    Ingrese un valor para x:
    -100
    Ingrese un valor para y:
    1
    Los valores actuales de x y y son: 2 y 1

    2. ejercicio 1.f 
    (x→-100, y→1)
    Ingrese un valor para x:
    2
    Ingrese un valor para y:
    8
    Los valores actuales de x y y son: 2 y 8
    */
