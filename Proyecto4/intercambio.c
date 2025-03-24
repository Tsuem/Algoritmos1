#include <stdio.h>
#include <assert.h>

int main (void) {
    int x, y, z;
    printf("Ingrese un valor para x:\n");
    scanf("%d", &x);
    printf("Ingrese un valor para y:\n");
    scanf("%d", &y);
    printf("ingrese un valor para z:\n");
    scanf("%d", &z);
    z = x;
    x = y;
    y = z;
    printf("Los valores para x, y, z son %d, %d y %d.", x, y, z);

    return 0;
}