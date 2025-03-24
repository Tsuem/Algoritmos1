#include <stdio.h>

int main(void) {
    int x,y,z,m;
    printf("Ingrese un valor para x:\n");
    scanf("%d",&x);
    printf("Ingrese un valor para y:\n");
    scanf("%d",&y);
    printf("Ingrese un valor para z:\n");
    scanf("%d",&z);
    printf("Ingrese un valor para m:\n");
    scanf("%d",&m);

    if (x < y) {
        m = x;
    } else {
        m = y;
    }

    if (m < z) {
       m = m; // printf("m<z"\n);//return 0;
    } else {
        m = z;
    }

    printf("Los valores actuales de x, y, z y m son: %d, %d, %d y %d\n", x, y, z ,m);

    return 0;
}


/* 
σ0: (x→5, y→4, z→8, m→0)
Luego del primer if: (x→5, y→4, z→8, m→4)
Luego del segundo if: (x→5, y→4, z→8, m→4)

1. EJECUTANDO EL PROGRAMA
Ingrese un valor para x:
5
Ingrese un valor para y:
4
Ingrese un valor para z:
8
Ingrese un valor para m:
0
Los valores actuales de x, y, z y m son: 5, 4, 8 y 4



σ0: (x→5, y→4, z→6, m→2)
Luego del primer if: (x→5, y→4, z→6, m→4)
Luego del segundo if: (x→5, y→4, z→6, m→4)

2. EJECUTANDO EL PROGRAMA
Ingrese un valor para x:
5
Ingrese un valor para y:
4
Ingrese un valor para z:
6
Ingrese un valor para m:
2
Los valores actuales de x, y, z y m son: 5, 4, 6 y 4



σ0: (x→9, y→1, z→6, m→4)
Luego del primer if: (x→9, y→1, z→6, m→1)
Luego del segundo if: (x→9, y→1, z→6, m→1)

3. EJECUTANDO EL PROGRAMA
Ingrese un valor para x:
9
Ingrese un valor para y:
1
Ingrese un valor para z:
6
Ingrese un valor para m:
4
Los valores actuales de x, y, z y m son: 9, 1, 6 y 1


¿Qué hace este programa? -> Cambia el valor de m dependiendo de los valores de x,y, z
¿Cuál es el valor final de la variable m? -> 4
*/