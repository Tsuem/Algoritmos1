#include <stdio.h>
#include <assert.h>

int main(void){
    int x, y, z, a, b;
    printf("Ingrese un valor para x:\n");
    scanf("%d", &x);
    printf("ingrese un valor para y:\n");
    scanf("%d", &y);
    printf("ingrese un valor para z:\n");
    scanf("%d", &z);
    
    a = x;
    b = z;

    z = y + x;
    x = y;
    y = y + a +b;

    printf("Los valores de x, y y z actuales son: %d, %d y %d.", x ,y, z);

    return 0;
}
