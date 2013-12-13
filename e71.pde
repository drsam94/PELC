int gcd(int a, int b) {
  if (b == 0) {
    return a;
  } else {
    return gcd(b, a%b);
  }
}

void draw() {
  int closest = 0;
  int bestd = 0;
  double smallestDiff = 10;
  for (int d = 1000000; d > 8; --d) {
      //int num = 3*d/7;
      int num = floor(3.0 / 7.0 * d);
      double diff = (3.0/7.0) - (num*1.0) / d;
      if (diff < smallestDiff && num / gcd(num, d) != 3) {
        smallestDiff = diff;
        bestd = d;
        closest = num / gcd(num, d);
      }
  }
  println(closest);
  println(bestd);
  println(smallestDiff);
  noLoop();
}
