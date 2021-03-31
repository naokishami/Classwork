#include <stdio.h>
#include <mpi.h>

int main( int argc, char *argv[] )
{
	double start, end;
	int rank, size;
	MPI_Init( &argc, &argv );
	MPI_Comm_rank( MPI_COMM_WORLD, &rank );
	MPI_Comm_size( MPI_COMM_WORLD, &size );

	MPI_Barrier(MPI_COMM_WORLD);
	start = MPI_Wtime();

	printf( "I am %d of %d\n", rank, size);
	int token;

	if (rank != 0) {
		MPI_Recv(&token, 1, MPI_INT, (rank-1) % size, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
		printf("Process %d received token %d from process %d\n", rank, token, (rank-1) % size);

	} else {
		// Set the token's value if you are process 0
		token = -10;
	}

	if (rank == 0) {
		MPI_Send(&token, 1, MPI_INT, (rank + 1) % size, 0, MPI_COMM_WORLD);
		MPI_Recv(&token, 1, MPI_INT, size - 1, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
		printf("Process %d received token %d from process %d\n", rank, token, size - 1);
	}
	if (rank != 0) {

		MPI_Send(&token, 1, MPI_INT, (rank + 1) % size, 0, MPI_COMM_WORLD);
		// Now process 0 can receive from the last process.
	}

	MPI_Barrier(MPI_COMM_WORLD);
	end = MPI_Wtime();

	MPI_Finalize();

	if (rank == 0) {
		printf("\nExecution time %f\n", end - start);
	}

	return 0;
}

