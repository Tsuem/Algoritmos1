#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

int main(void) {
    int x, y, z;
    bool b, w;
    int temp1, temp2;

/*  x = 4;
    y = (-4);
    z = 8;
    b = 1;
    w = 1; */

    printf("Ingrese un valor para x: (Ingrese 4)\n");
    scanf("%d", &x);
    printf("Ingrese un valor para y: (Ingrese -4)\n");
    scanf("%d", &y);
    printf("Ingrese un valor para z: (Ingrese 8)\n");
    scanf("%d", &z);
    printf("Ingrese un valor para b: (Ingrese 1)\n");
    scanf("%d", &temp1);
    printf("Ingrese un valor para w: (Ingrese 1)\n");
    scanf("%d", &temp2);

    b = temp1;
    w = temp2;

    printf("x % 4 == 0 = %d\n", x % 4 == 0);
    printf("x + y == 0 && y - x == (-1) * z = %d\n", x + y == 0 && y - x == (-1) * z);
    printf("not b && w = %d\n", ! b && w);

    return 0;
}

    /* 
    (x→4, y→-4, z→8, b→1, w→1)
    Ingrese un valor para x: (Ingrese 4)
    4
    Ingrese un valor para y: (Ingrese -4)
    -4
    Ingrese un valor para z: (Ingrese 8)
    8
    Ingrese un valor para b: (Ingrese 1)
    1
    Ingrese un valor para w: (Ingrese 1)
    1

    x % 4 == 0 = 1
    x + y == 0 && y - x == (-1) * z = 1
    not b && w = 0

    

    *Si ingreso numeros diferentes al que me piden:
    (x→64, y→321, z→123, b→486, w→21)
    Ingrese un valor para x: (Ingrese 4)
    64
    Ingrese un valor para y: (Ingrese -4)
    321
    Ingrese un valor para z: (Ingrese 8)
    123
    Ingrese un valor para b: (Ingrese 1)
    486
    Ingrese un valor para w: (Ingrese 1)
    21

    x % 4 == 0 = 1
    x + y == 0 && y - x == (-1) * z = 0
    not b && w = 0
    */