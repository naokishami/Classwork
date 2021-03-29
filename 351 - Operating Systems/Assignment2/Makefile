main: *.o
	g++ -pthread -std=c++11 *.o -o main

*.o: *.cpp
	g++ -pthread -std=c++11 -c *.cpp

clean: 
	rm *.o main

