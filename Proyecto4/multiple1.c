#include <stdio.h>
#include <assert.h>

int main (void) {
    int x, y;
    printf("ingrese un valor para x:\n");
    scanf("%d", &x);
    printf("ingrese un valor para y:\n");
    scanf("%d", &y);
    y = x + y;
    x = x + 1;
    printf("Los valores de x y y actuales son: %d y %d.", x ,y);

    return 0;
}

/* ingrese un valor para x:
2
ingrese un valor para y:
3
Los valores de x y y actuales son: 3 y 5. */