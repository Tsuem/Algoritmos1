#include <stdio.h>

int main(void) {
    int x, y, z;
    printf("Ingrese un valor para x:\n");
    scanf("%d", &x);
    printf("Ingrese un valor para y:\n");
    scanf("%d", &y);
    printf("Ingrese un valor para z:\n");
    scanf("%d", &z);

    printf("x + y + 1= %d\n", x + y + 1);
    printf("z * z + y*45 - 15*x = %d\n", z*z+y*45-15*x);
    printf("y - 2 == (x*3 + 1)%5 = %d\n", y-2 == (x*3+1)%5);
    printf("y/2*x = %d\n", y/2*x);
    printf("y < x*z = %d\n", y< x*z);

    return 0;
}

    /* 
    PRIMER RESULTADO (x→7, y→3, z→5)
    Ingrese un valor para x:
    7
    Ingrese un valor para y:
    3
    Ingrese un valor para z:
    5
    x + y + 1= 11
    z * z + y*45 - 15*x = 55
    y - 2 == (x*3 + 1)%5 = 0
    y/2*x = 7
    y < x*z = 1
    

    SEGUNDO RESULTADO (x→1, y→10, z→8)
    Ingrese un valor para x:
    1
    Ingrese un valor para y:
    10
    Ingrese un valor para z:
    8
    x + y + 1= 12
    z * z + y*45 - 15*x = 499
    y - 2 == (x*3 + 1)%5 = 0
    y/2*x = 5
    y < x*z = 0


    TERCER RESULTADO (x→5, y→9, z→4)
    Ingrese un valor para x:
    5
    Ingrese un valor para y:
    9
    Ingrese un valor para z:
    4
    x + y + 1= 15
    z * z + y*45 - 15*x = 346
    y - 2 == (x*3 + 1)%5 = 0
    y/2*x = 20
    y < x*z = 1

    ¿En la última expresión, qué tipo tiene el resultado en lenguaje “C”?
    Es booleano, 0 para False y cualquier otro número para True

    */