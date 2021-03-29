/*
Student: Naoki Atkins
Class: 479 - 01

HW4
*/


#include <omp.h>
#include <stdio.h>
#define N 8

int main(int argc, char** argv)
{
        int arr[32];
        int i, th_id, odd_count;
        int sum = 0;

        omp_set_num_threads(N);

        #pragma omp parallel shared(arr, sum) private(i, odd_count, th_id)
        {
                th_id = omp_get_thread_num();
                odd_count = 0;

                #pragma omp for schedule (static, 1)
                for (i = 0; i < 32; i++)
                {
                        arr[i] = 5*i;
                }
                #pragma omp barrier
                {
                        if (th_id == 0) {
                                for (i = 0; i < 32; i++) {
                                        if (arr[i] % 2 != 0) {
                                                odd_count += 1;
                                        }
                                }
                                sum += odd_count;
                        }
                }
        }

        for (i = 0; i < 32; i++)
        {
                printf("arr[%d] = %d\n", i, arr[i]);
        }

        printf("number of odd numbers = %d\n", sum);

        return 0;
}
