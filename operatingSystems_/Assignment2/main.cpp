#include <iostream>
#include <iomanip>
#include <thread>
#include <mutex>          // std::mutex

#define NUM_THREADS 4
using namespace std;
std::mutex mtx;

int CurrentThread = 0;
class Numbers {
	private:
    int size;
    double *myarray;
    double sum;
	public:
    // based on data in the text file
    Numbers () {
	    //TODO: allocate a dynamic array
			sum = 0;
			size = 400000;
			myarray = new double[size];

			srand(time(NULL));
			for(int i = 0; i < size; i++) {
				myarray[i] = 1 + ((double)rand() / RAND_MAX) * 4;
			}
		}
    //TODO: getter, setter, destructor methods
		void setSum(double num){
			sum = num;
		}
		double getSum(){
			return sum;
		}
		double at(int i){
			return myarray[i];
		}
		int getSize(){
			return size;
		}
		~Numbers(){
			delete[] myarray;
			myarray = nullptr;
		}
  } MyNumbers;

	struct Slice {
		int lower;
		int higher;
	};

	void *do_work(void *arg){
		Slice *slice = (Slice*)arg;
		double sum = 0;
		for(int i = slice->lower; i < slice->higher; i++){
			sum += MyNumbers.at(i);
		}
		mtx.lock();
		MyNumbers.setSum(MyNumbers.getSum() + sum);
		mtx.unlock();
		return nullptr;
	}

	int main() {
		thread threads[NUM_THREADS];
		int segment = MyNumbers.getSize() / NUM_THREADS;
		Slice slices[NUM_THREADS];
		for(int i = 0; i < NUM_THREADS; ++i) {
			slices[i].lower = segment * i;
			slices[i].higher = segment * (i + 1);
		}
		// If it can't be split evenly this will make the last thread take the
		// remaining work
		slices[NUM_THREADS - 1].higher = MyNumbers.getSize();
		for (int i = 0; i < NUM_THREADS; ++i){
			threads[i] = thread(do_work, &slices[i]);
		}
		for (auto& th : threads) {
			th.join();
		}
		cout << fixed << setprecision(2) << MyNumbers.getSum() << endl;
	}
