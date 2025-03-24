#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

#define N 5

typedef struct {
    int cuantas_a;
    int cuantas_x;
    int cuantas_z;
} s_total;

s_total totales(char a[], int tam) {
    s_total conteo;
    int i = 0;

    conteo.cuantas_a = 0;
    conteo.cuantas_x = 0;
    conteo.cuantas_z = 0;

    while(i<tam) {
        if (a[i] == 'a'){
            conteo.cuantas_a++;
        }
        if (a[i] == 'x'){
            conteo.cuantas_x++;
        }
        if (a[i] == 'z'){
            conteo.cuantas_z++;
        }
        i++;
    }
    return conteo;
}

void llena_con_char(char a[], int tam) {
    int i = 0;
    while (i < tam) {
        printf("Ingrese un caracter en la posicion %d del arreglo:\n", i);
        scanf(" %c", &a[i]);
        i++;
    }  
}

bool hay_mas_de_2_consonantes (char a[], int tam) {
    int i = 0;
    int count = 0;
    bool res = false;
    while (i < tam) {
        if (a[i] != 'a' && a[i] != 'e' && a[i] != 'i' && a[i] != 'o' && a[i] != 'u') {
            count++;
        }
        i++;
    }
    if (count >= 3) {
        res = true;
    }
    return res;
}

int main(void) {
    char a[N];
    bool res = false;

    llena_con_char(a, N);
    res = hay_mas_de_2_consonantes(a, N);

    printf("\n");
    printf("El arreglo construido: ");
    int i = 0;
    while (i < N) {
        printf("%c ", a[i]);
        i++;
    }
    printf("\n");

    if (res == true) {
        printf("\nTrue. Hay mas de dos consonantes.");
    } else {
        printf("\nFalse. Hay menos de dos consonantes.");
    }

    s_total conteo = totales(a, N);
    printf("\nCantidad de veces que se encontro a 'a': %d\n", conteo.cuantas_a);
    printf("Cantidad de veces que se encontro a 'x': %d\n", conteo.cuantas_x);
    printf("Cantidad de veces que se encontro a 'z': %d\n", conteo.cuantas_z);


    return 0;
}

