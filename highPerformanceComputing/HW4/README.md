To compile:
```
gcc prob_.c -fopenmp
```

To execute:
```
./a.out
```
***
### Problem 1
Write an openMP program to initialize an array array[] of size 32 to all zeros in parallel using 8 threads, using one parallel construct and/or parallel for. <br>
![problem 1](https://github.com/naokishami/Classwork/blob/a84e27b7310afddfb1dc8bee896fb0eaaab828a7/highPerformanceComputing/HW4/Screen%20Shot%202021-03-16%20at%202.34.55%20PM.png)

### Problem 2
In Problem 1, create another parallel construct and/or parallel for that adds 5*i to array[i] for i=0..32. <br>
![problem 2](https://github.com/naokishami/Classwork/blob/8df1a2fe446f1f4d3dceafed9751f8ac362943e7/highPerformanceComputing/HW4/Screen%20Shot%202021-03-16%20at%202.35.35%20PM.png)

### Problem 3
In Problem 2, create another parallel construct and/or parallel for that calculates the number of odd values in array[] as follows: it distributes the iterations to each thread using the cyclic distribution, each thread computes the number of odd values from its allocated iterations and the master thread (thread ID 0) collects and adds the number of odd values. The master thread (with thread ID is 0) then displays the result. <br>
![problem 3](https://github.com/naokishami/Classwork/blob/52ea3f858fc581eb153173cb0cdc127ca6328baf/highPerformanceComputing/HW4/Screen%20Shot%202021-03-16%20at%202.35.16%20PM.png)
