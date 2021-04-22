#include <mpi.h>
#include <stdio.h>
#include <time.h>

//This function generates a random number and takes in the rank.
// outputs the editted random number
int generator(int rank){
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

        //concatnates the random number
        rand_num=rand_num*10;
        rand_num+=1000;

        rand_num+=rank;

        return rand_num;
}

//This function compares the random value generated they also set the values on each index in the leaders array
void* compare_and_set(int* arr, int genValue, int rank) {

	//if even set even indexes else set odd indexes
        if (genValue % 2 == 0) {
                if (genValue > arr[0]) {
                        arr[0] = genValue;
                        arr[2] = rank;
                }
        }
        else {
                if (genValue > arr[1]) {
                        arr[1] = genValue;
                        arr[3] = rank;
                }
        }
        return arr;
}

int main(int argc, char** argv) {

        int rank, size;

	//Initialize MPI
        MPI_Init(&argc, &argv);
        MPI_Comm_size(MPI_COMM_WORLD, &size);
        MPI_Comm_rank(MPI_COMM_WORLD, &rank);

        // leaders = [<largestEven>, <largestOdd>, <rankEven>, <rankOdd>]
        int leaders[4];
        // 0th index will be for even values
        leaders[0] = 0;
        // 1st index will be for odd values
        leaders[1] = 1;

        int gen_value;

        if (rank != 0) {
                MPI_Recv(leaders, 4, MPI_INT, (rank  - 1) % size, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
                printf("Process %d received leaders %d, %d from process %d\n", rank, leaders[1], leaders[0], (rank - 1) % size);

                gen_value = generator(rank); //generate random number
                compare_and_set(leaders, gen_value, rank); //compare random number and set array indexes accordingly
        } else {
                // Process 0 will generate a random number
                gen_value = generator(rank); //generate random number
                compare_and_set(leaders, gen_value, rank); //compare random number and set array indexes accordingly
        }
        MPI_Send(leaders, 4, MPI_INT, (rank + 1) % size, 0, MPI_COMM_WORLD);

        // Now process 0 can receive from the last process.
        if (rank == 0) {
                MPI_Recv(leaders, 4, MPI_INT, size - 1, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
                printf("Process %d received leaders %d, %d from process %d\n", rank, leaders[1], leaders[0], size - 1);
                printf("The president is %d with a value of %d and the vice president is %d with a value of %d\n", leaders[3], leaders[1], leaders[2], leaders[0]);
        }

        MPI_Finalize();
        return 0;
}