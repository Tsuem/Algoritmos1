#include <stdio.h>
#include <stdbool.h>

int main(void) {
    int temp;
    int x, i;
    bool res;

    printf("Ingresa un valor para x:\n");
    scanf("%d", &x);
    printf("Ingresa un valor para i:\n");
    scanf("%d", &i);
    printf("Ingresa un valor para res:\n");
    scanf("%d", &temp);

    res = (temp != 0);
    /* la función scanf no tiene un especificador para el tipo bool. Esto puede causar un comportamiento indefinido o un error de lectura. Te sugiero que uses la función scanf para leer un valor de tipo int y luego lo conviertas a bool usando una expresión lógica.
    int temp;
    printf("Ingresa un valor para res:\n");
    scanf("%d", &temp);
    res = (temp != 0); // Esto convierte el valor entero a bool */

    i = 2;
    res = true;

    while (i < x && res) {
        res = res && ((x % i) != 0);
        i= i + 1;
    } 

    printf("Los valores actuales de x y i son: %d, %d y %d\n", x, i, res);
    return 0;
}

    /* 
    El programa calcula si son numeros primos.
    σ0: (x→5, i→0, res→0)
    Luego de iter 1: (x→5, i→3 , res→1)
    Luego de iter 2: (x→5, i→4 , res→1)
    Luego de iter 3: (x→5, i→5 , res→1)

    1. EJECUTANDO EL PROGRAMA
    Ingresa un valor para x:
    5
    Ingresa un valor para i:
    0
    Los valores actuales de x y i son: 5, 5 y 1


    σ0: (x→8, i→6, res→7)
    2. EJECUTANDO EL PROGRAMA
    Ingresa un valor para x:
    8
    Ingresa un valor para i:
    6
    Ingresa un valor para res:
    7
    Los valores actuales de x y i son: 8, 3 y 0


    σ0: (x→1, i→62, res→0)
    3. EJECUTANDO EL PROGRAMA
    Ingresa un valor para x:
    1
    Ingresa un valor para i:
    62
    Ingresa un valor para res:
    0
    Los valores actuales de x y i son: 1, 2 y 1
    */