#include <stdio.h>
#include <assert.h>

int main (void) {
    int x;
    printf("ingrese un valor para x: \n");
    scanf("%d", &x);
    if (x<0) {
        x = x* (-1);
    } else {
        x =x;
    }
    printf("El valor absoluto de x es: %d", x);
    return 0;
}