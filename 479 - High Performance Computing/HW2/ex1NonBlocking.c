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
	printf("\nSingle Transmission Non Blocking\n");
     }

     printf( "\nI am %d of %d\n", rank, size );

     MPI_Request ireq;
     MPI_Request isend;
     MPI_Status istatus;

     double number = 0;
     printf("Process %d has number=%f\n", rank, number);

     start_time = MPI_Wtime();

     if (rank == 0) {
	   number = -1;
           MPI_Isend(&number, 1, MPI_DOUBLE, 1, 0, MPI_COMM_WORLD, &isend);
           printf("Process 0 sent number %f to process  1\n", number);
	   MPI_Wait(&isend, &istatus);
     } else if (rank == 1) {
         MPI_Irecv(&number, 1, MPI_DOUBLE, 0, 0, MPI_COMM_WORLD, &ireq);
	 MPI_Wait(&ireq, &istatus);
         printf("Process 1 received number %f from process 0\n", number);
     }
     printf("Process %d has number=%f\n", rank, number);

     end_time = MPI_Wtime();


     if (rank == 0) {
         printf("\nExecution time %f\n", end_time - start_time);
     }	
     MPI_Finalize();
     return 0;
}
