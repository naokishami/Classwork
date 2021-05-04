#include <stdio.h>
#include <mpi.h>
#include <openmp.h>
#include <math.h>

// What will this program do?
// This program will take in a matrix and a query book and find the classification of the query
// book based on the cosine similarity metric coupled with the k nearest neighbor classification

// Approach
// First read in the matrix and the query book
// Then, make cosine similarity calculations
// Afterwards, store the results in some data structure for efficient storage
// And then, find the k closest neighbors

float magnitude(int* vec) {
	float total = 0;
	int size = sizeof vec / sizeof *vec;
	int i;
	for (i = 0; i < size; i++) {
		total += pow(vec[i], 2);
	}
	total = sqrt(total);
	return total;	
}


float cosineDistance(int* vec1, int* vec2) {
	return 0;
}



int main(int argc, char** argv) {
	int myVec[5] = {1, 2, 3, 4, 5};
	printf("%f\n", magnitude(myVec));
	return 0;
}
