/*
   Write a CUDA program that includes a host function to compute the minimum value in a N dimensional square matrix, N being 16.
*/

// Author: Naoki Atkins

#include <stdio.h>
#include <cuda.h>
#include <time.h>
#include <stdlib.h>
#include <limits.h>
#define N 16

__host__ int generator(int rank){
        int rand_num;
srand(time(NULL)+rank);
      rand_num = rand();
    if (rand_num<0) {
      rand_num=abs(rand_num);
    }
    else if(rand_num<10){
      rand_num+=10;
    }
    else if( rand_num>=100){
      rand_num = rand_num%100;
    }

    rand_num=rand_num*10;
    rand_num+=1000;

    rand_num+=rank;

    return rand_num;
    }

__host__ int computeMin(int* matrix) {
        int min = INT_MAX;
        int val;
        int i, j, offset;

        for (i = 0; i < N; ++i) {
                for (j = 0; j < N; ++j) {
                        offset = i * N + j;
                        val = matrix[offset];
                        if (val < min) min = val;
                }
        }

        return min;
}

int main(int argc, char** argv) {
        int i, j;
        int offset;
        int *mat = (int *)malloc(N * N * sizeof(int));

        printf("Generating a random matrix...\n");
        for (i = 0; i < N; ++i) {
                for (j = 0; j < N; ++j) {
                        offset = i * N + j;
                        mat[offset] = generator(offset);
                        printf("%d ", mat[offset]);
                }
                printf("\n");
        }

        printf("Calculating the minimum...\n");
        int min;
        min = computeMin(mat);
        printf("Min is %d\n", min);

        return 0;
}
