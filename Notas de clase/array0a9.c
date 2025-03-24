#include <stdio.h>

void print_array (int a[], int N) {
    int i = 0;
    while (i<N) {
        printf("%d ", a[i]);
        i++;
    }
}

int main(void){
    int N = 10;
    int i;
    int a[N];

    i=0;
    while (i<N){
        a[i]=i;
        i++;
    }

    print_array(a, N);
    return 0;
}