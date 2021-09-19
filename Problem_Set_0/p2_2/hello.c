#include <stdio.h>
#include <stdlib.h>

int main() {

    // Define an integer counter
    int counter = 0;
    counter = 0;

    // Allocate double-precision data on the heap
    // Note: *data denotes a pointer to memory
    int N = 10;
    double *data = malloc(N * sizeof(double));

    //Loop to perform operations
    for (int i = 0; i < N; i++){
        data[i] = 2.5 * i;
        printf("Hello world %d %4.3f\n", counter, data[i]);
        counter++;
    }

    // Read the saved data in reverse
    for (int i = N; i > 0; i--){
        printf("%d %4.3f\n", i, data[i - 1]);
    }

    // Clean up
    free(data);
    data = NULL;

    return 0;
}