rm main .*o
#g++ -c *.cpp
#g++ -Wall -std=c++17 *.o -o main
g++ -pthread -o main *.cpp

#g++ -Wall -std=c++14 shellskel.cpp -o main
time ./main
