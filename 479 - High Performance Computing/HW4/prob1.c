#include <omp.h>
#include <stdio.h>
#define N 8

int main(int argc, char** argv)
{
        int arr[32];
        int i;

        omp_set_num_threads(N);

        #pragma omp parallel shared(arr) private(i)
        {
                #pragma omp for
                for (i = 0; i < 32; i++)
                {
                        arr[i] = 0;
                }
        }

        for (i = 0; i < 32; i++)
        {
                printf("arr[%d] = %d\n", i, arr[i]);
        }

        return 0;
}
