***Project 1***

This is an implementation of a leader election algorithm using the MPI library with C.

MPI creates a number of threads for us. After thread creation is done, each thread generates a random number between 1000 <= x < 2000. Thread 0 will start the communication by sending its generated value to Thread 1. If Thread 1 has a larger number, it will pass that number to Thread 2. Else, it will pass Thread 0's number on. Each thread is keeping track of the largest even number generated (vice-president) and the largest odd number generated (president). At the end of the program, the vice-president and the president will be announced.

******
To compile: 
```
mpicc ring.c
```
To execute:
```
mpirun -n <number of processes> a.out
```
