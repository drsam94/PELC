public class e92 {

	public static def getBit(r:Rail[Long], x:Long) {
		val index    = x / 64;
		val subIndex = x % 64;
		return ((r(index) >> subIndex) & 1) == 1;
	}
	
	public static def setBit(r:Rail[Long], x:Long) {
		val index    = x / 64;
		val subIndex = x % 64;
		r(index) = r(index) | (1L << subIndex);
	}
	
	public static def nextTerm(x: Long) {
		var c:Long = x;
		var s:Long = 0;
		while (c > 0) {
			s += (c % 10) * (c % 10);
			c /= 10;
		}
		return s;
	}
    public static def main(Rail[String]) {
    	// Pair of arrays for memoizing to store
    	// if we have info, and if it goes to 89
        var isSet:Rail[Long] = new Rail[Long](10000000 / 64);
        isSet.fill(0);
        var is89:Rail[Long]  = new Rail[Long](10000000 / 64);
        is89.fill(0);
        setBit(isSet, 1);
        setBit(isSet, 89);
        setBit(is89, 89);
        var ans:Long = 1;
        var prev:Rail[Long] = new Rail[Long](100000);
        for (i in 1..9999999) {
        	var pLength:Long = 0;
        	var c:Long = i;
        	while (! getBit(isSet, c)) {
        		prev(pLength) = c;
        		pLength      += 1;
        		c = nextTerm(c);
        	}
        	var was89:Boolean = getBit(is89, c);
        	for (j in 0..(pLength - 1)) {
        		setBit(isSet, prev(j));
        		if (was89) {
        			setBit(is89, prev(j));
        			ans += 1;
        		}
        	}
        }
        Console.OUT.println(ans);
    }
}