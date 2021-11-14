# include <stdio.h>
# include <stdlib.h>
# include <omp.h>

int main (){
    int nthreads, tid;

    // Allocate double-precision data on the heap
    int N = 10;
    double *data = malloc(N * sizeof(double));

    // Beginning of parallel region
#pragma omp parallel shared(data) private(tid)
    {
        // Each hread gets its thread ID
        tid = omp_get_thread_num();

        if (tid==0) {
            // Root thread writes the total number of threads to screen
            nthreads = omp_get_num_threads();
            printf("Number of threads is %d\n", nthreads);
        }

        //OMP partitions a loop among all threads
#pragma omp for
    for (int i=0; i<N; i++) {
        data[i] = 2.5 * i;
        printf("Hello from thread %d, i=%d, data=%4.3f\n", tid, i, data[i]);
    }
    } // End of parallel region
    printf("End of parallel region\n");

    // Write the contents of 'data' friom the root processor
    for (int i = 0; i < N; i++) {
        printf("tid=%d, %d %4.3f\n", tid, i, data[i]);
    }

    //Clean up
    free(data);
    data = NULL;

    return 0;
}