#include <assert.h>
#include <stdio.h>

#define N 5


// Ej 1:
int sum_end(int tam, int a[], int n) {
    assert(n >= 0 && n <= tam);

    int sum = 0;
    int i = tam - n;
    while (i < tam) {
        sum = sum + a[i];
        i = i + 1;
    }
    return sum;
}


// Ej 2:
int main(void) {
    printf("Ingrese %d valores enteros: ", N);
    int a[N] = {0};
    int i = 0;
    while (i < N) {
        scanf("%d", &a[i]);
        i = i + 1;
    }

    printf("Ingrese un entero positivo: ");
    int n;
    scanf("%d", &n);

    int sum = sum_end(N, a, n);
    printf("La suma de los últimos %d elementos es %d\n", n, sum);

    return 0;
}