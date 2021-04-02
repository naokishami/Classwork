// Author: Naoki Atkins


#include <stdio.h>
#include <mpi.h>

// generates a random number between 10 and 100
int generator(int rank){
        int rand_num;
        srand(time(NULL)+rank);
        rand_num = rand();

        if (rand_num<0) {
                rand_num=abs(rand_num);
        }
        else if( rand_num>=100){
                rand_num = rand_num%100;
        }
        if(rand_num<10){
                rand_num+=10;
        }

        return rand_num;
}

int *find_interest(int* arr, int* return_arr, int size) {
	int i, j, val, closestDist, distance;
	for (i = 0; i < size; i++) {
		closestDist = 10000;
		for (j = 0; j < size; j++) {
			distance = abs(arr[j] - arr[i]);
			if (i != j && distance < closestDist) {
				closestDist = distance;
				return_arr[i] = j;
			}
		}
	}
	return return_arr;
}

int main(int argc, char** argv) {
	int rank, size;
	
	
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);

	int genVals[size];
	int genVal = generator(rank);
	printf("Process %d generated %d\n", rank, genVal);

	MPI_Gather(&genVal, 1, MPI_INT, &genVals, 1, MPI_INT, 0, MPI_COMM_WORLD);
	MPI_Barrier(MPI_COMM_WORLD);

	if (rank == 0) {
		printf("Processes interests' down below...\n");
		int* interest;
		int emptyList[size];
		interest = find_interest(genVals, emptyList, size);
		int i;
		for (i = 0; i < size; i++) {
			printf("Process %d interest is %d\n", i, interest[i]);
		}
	}

	MPI_Finalize();

	return 0;
}
