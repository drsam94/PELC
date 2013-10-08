
void euler23() {
   
    Boolean isAbundant(Integer x) {
        if (x < 12) {
            return false;
        }
        variable Integer sum = 0;
        Integer ceiling(Float f) { 
            if (f > f.integer.float) {
                return f.integer + 1;
            } else {
                return f.integer;
            } 
        }
        Integer root = ceiling(x.float^0.5);
        if (root * root == x) {
            sum += root;
        }
        for (i in 2..(root -1)) {
            if (x % i == 0) {
                sum += i + (x / i);
            }
        }
        return sum + 1 > x;
    } 
    Integer[] abundants = [ for( i in 1..28123) if(isAbundant(i)) i];
    variable Integer ans = 0;
    for (i in 1..28123) {
        variable Boolean wasSum = false;
        for (a in abundants) {
            if (a >= i) {
                break;
            } else if(isAbundant(i - a)) {
                wasSum = true;
                break;
            }
        }
        if (!wasSum) {
            ans += i;
        }
    }
    print(ans);
}
