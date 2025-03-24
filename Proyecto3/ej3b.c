#include <stdio.h>

int main(void) {
    int x, y;
    printf("Ingrese un valor para x:\n");
    scanf("%d", &x);
    printf("Ingrese un valor para y:\n");
    scanf("%d", &y);
    x = x+y;
    printf("El valor actual de x es: %d\n", x);
    y = y+y;
    printf("El valor actual de y es: %d\n", y);
    return 0;
}

/* 
EJECUCIÓN 1 (x→2, y→5)
Ingrese un valor para x:
2
Ingrese un valor para y:
5
El valor actual de x es: 7
El valor actual de y es: 10


EJECUCIÓN 2 (x→554, y→46)
Ingrese un valor para x:
531
Ingrese un valor para y:
23
El valor actual de x es: 554
El valor actual de y es: 46


EJECUCIÓN 3 (x→10, y→1)
Ingrese un valor para x:
10
Ingrese un valor para y:
1
El valor actual de x es: 11
El valor actual de y es: 2
*/
