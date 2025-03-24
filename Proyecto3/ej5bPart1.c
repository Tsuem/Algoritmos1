#include <stdio.h>

int main(void){
    int x, y, i;
    printf("Ingrese un valor para x:\n");
    scanf("%d",&x);
    printf("Ingrese un valor para y:\n");
    scanf("%d",&y);
    printf("Ingrese un valor para i:\n");
    scanf("%d",&i);

    i = 0;

    while (x >= y) {
        x = x - y;
        i = i + 1;
    }

    printf("Los valores actuales de x, y y i son: %d, %d y %d\n", x, y, i);
    return 0;
}


    /* 
    El programa es el algoritmo de división, i es el cociente entre x y y
    σ0: (x→13, y→3, i→0)
    Luego de iter 1: (x→10, y→3 , i→ 1)
    Luego de iter 2: (x→7, y→3 , i→2)
    Luego de iter 3: (x→4, y→3 , i→3)
    Luego de iter 4: (x→1, y→3 , i→4)

    1. EJECUTANDO EL PROGRAMA:
    Ingrese un valor para x:
    13
    Ingrese un valor para y:
    3
    Ingrese un valor para i:
    0
    Los valores actuales de x, y y i son: 1, 3 y 4



    σ0: (x→1, y→13, i→56)
    2. EJECUTANDO EL PROGRAMA:
    Ingrese un valor para x:
    1
    Ingrese un valor para y:
    13
    Ingrese un valor para i:
    56
    Los valores actuales de x, y y i son: 1, 13 y 0



    σ0: (x→5, y→13, i→360)
    3. EJECUTANDO EL PROGRAMA:
    Ingrese un valor para x:
    5
    Ingrese un valor para y:
    13
    Ingrese un valor para i:
    360
    Los valores actuales de x, y y i son: 5, 13 y 0
    */