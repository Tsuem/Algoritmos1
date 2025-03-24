#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

#define N 5

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

    int i = 0;
    while (i < N) {
        printf("%c ", a[i]);
        i++;
    }

    if (res == true) {
        printf("\nTrue. Hay mas de dos consonantes.");
    } else {
        printf("\nFalse. Hay menos de dos consonantes.");
    }

    return 0;
}

