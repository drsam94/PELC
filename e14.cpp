#include <iostream>

long collatzCount(long start) {
  long count = 1;
  long current = start;
  while (current != 1) {
    count += 1;
    if (current % 2 == 0) {
      current = current / 2; 
    } else {
      current = 3*current + 1;
    }
  }
  return count;
}

int main() {
  long maxCount = 0;
  long maxElem  = 0;
  for (long i = 1; i < 1000000; ++i) {
    long c = collatzCount(i);
    if (c > maxCount) {
      maxCount = c;
      maxElem  = i;
    }
  }
  std::cout << maxElem;
}
  
