#include <stdio.h>
#include <assert.h>

int suma_hasta(int n) {
    int res = 0;
    while (n > 0) {
        res = res + n;
    }
    return res;
}

int main(void) {
    int n, res;
    printf("Ingrese un valor positivo para n:\n");
    scanf("%d",&n);
    assert( n > 0);
    suma_hasta(n);
    return 0;
}