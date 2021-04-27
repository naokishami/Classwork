// Author: Naoki Atkins

// What is the goal?
// 	The goal is to divide the file into several sections so that MPI
//	can divide the work amongst processes

//	Each process will find its own set of unique words and their frequencies

//	At the main thread, it will gather all of the results and find
// 	the most common set of unique words and the total of their frequencies

// 	This will be limited to 100 top words in a book

#include <stdio.h>
//#include <mpi.h>

int lineCount(char* fileName, FILE** readFile) {
	char fileChar[40], chr;
	int count = 0;
	chr = getc(*readFile);
	while (chr != EOF) {
		if (chr == "\n") count += 1;
	}
	return count; 
}

void readText(char* fileName, FILE** readFile) {
	if ((*readFile = fopen(fileName, "r")) == NULL ) return FILE_ERROR;
	else {
		
	}
}

int main(int argc, char** argv) {
	char bookName[] = "hamlet";
	char path[] = "./books/";
	char txt[] = ".txt";
	char interm[] = strcat(path, bookName);
	char filePath = strcat(filePath, txt);	

	printf("%s\n", filePath);

	return 0;
}
