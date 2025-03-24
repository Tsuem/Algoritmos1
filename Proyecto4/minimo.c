#include <assert.h>
#include <stdio.h>

int main (void) {
    int x, y;
    printf("Ingrese valor para x: \n");
    scanf("%d", &x);
    printf("Ingrese valor para y: \n");
    scanf("%d", &y);
    if (x<y) {
        printf("El mínimo es x: %d", x);
    } else {
        printf("El mínimo es y: %d", y);
    }
    return 0;
}