#include <stdio.h>
#include <mpi.h>

int main( int argc, char *argv[] )
{
     double start_time, end_time;
     int rank, size;
     MPI_Init( &argc, &argv );
     MPI_Comm_rank( MPI_COMM_WORLD, &rank );
     MPI_Comm_size( MPI_COMM_WORLD, &size );

     if (rank == 0) {
	printf("\nRound Trip Blocking\n");
     }

     printf( "\nI am %d of %d\n", rank, size );

     double number = 0;
     printf("Process %d has number=%f\n", rank, number);

     start_time = MPI_Wtime();

     if (rank == 0) {
	   number = -1;
           MPI_Send(&number, 1, MPI_DOUBLE, 1, 0, MPI_COMM_WORLD);
           printf("Process 0 sent number %f to process  1\n", number);
           MPI_Recv(&number, 1, MPI_DOUBLE, 1, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
           printf("Process 0 received number %f from process 1\n", number);
     } else if (rank == 1) {
         MPI_Recv(&number, 1, MPI_DOUBLE, 0, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
         printf("Process 1 received number %f from process 0\n", number);
	 number = 20;
         MPI_Send(&number, 1, MPI_DOUBLE, 0, 0, MPI_COMM_WORLD);
         printf("Process 1 sent number %f to process  0\n", number);
     }

     printf("Process %d has number=%f\n", rank, number);

     end_time = MPI_Wtime();


     if (rank == 0) {
         printf("\nExecution time %f\n", end_time - start_time);
     }
     MPI_Finalize();

     return 0;
}

