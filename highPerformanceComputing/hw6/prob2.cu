/*
   Write a CUDA program that includes a host function to compute the square of a N dimensional square matrix, N being 16
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

__host__ void computeSquare(int* matrix, int* result, int matrixsize) {
        int offset;
  for (unsigned jj = 0; jj < matrixsize; ++jj) {
    for (unsigned kk = 0; kk < matrixsize; ++kk) {
        offset = jj * N + kk;
      result[offset] += matrix[offset] * matrix[offset];
    }
  }
}

int main(int argc, char** argv) {
        // Matrix
        int i, j;
        int offset;
        int *mat = (int *)malloc(N * N * sizeof(int));

        printf("Generating a random matrix...\n");
        for (i = 0; i < N; ++i) {
                for (j = 0; j < N; ++j) {
                        offset = i * N + j;
                        mat[offset] = generator(rand() % 100);
                        printf("%d ", mat[offset]);
                }
                printf("\n");
        }

        // Square the matrix
        int *squareMat = (int *)malloc(N * N * sizeof(int));

        printf("Calculating the square...\n");
        computeSquare(mat, squareMat, N);

        for (i = 0; i < N; ++i) {
                for (j = 0; j < N; ++j) {
                        offset = i * N + j;
                        printf("%d ", squareMat[offset]);
                }
                printf("\n");
        }

        return 0;
}
