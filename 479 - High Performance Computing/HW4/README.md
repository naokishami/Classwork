### Problem 1
Write an openMP program to initialize an array array[] of size 32 to all zeros in parallel using 8 threads, using one parallel construct and/or parallel for.

### Problem 2
In Problem 1, create another parallel construct and/or parallel for that adds 5*i to array[i] for i=0..32.

### Problem 3
In Problem 2, create another parallel construct and/or parallel for that calculates the number of odd values in array[] as follows: it distributes the iterations to each thread using the cyclic distribution, each thread computes the number of odd values from its allocated iterations and the master thread (thread ID 0) collects and adds the number of odd values. The master thread (with thread ID is 0) then displays the result.

***
To compile:
```
gcc prob_.c -fopenmp
```

To execute:
```
./a.out
```
