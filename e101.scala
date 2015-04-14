
class Rational(n : BigInt, d: BigInt) {
    private def gcd(x: BigInt, y: BigInt): BigInt = {
        if (x == 0) y
        else if (x < 0) gcd(-x, y)
        else if (y < 0) -gcd(x, -y)
        else gcd(y % x, x)
    }
    private val g = gcd(n, d)

    val numer: BigInt = n/g
    val denom: BigInt = d/g
    def +(that: Rational) =
        new Rational(numer * that.denom + that.numer * denom, denom * that.denom)
    def -(that: Rational) = {
    //    println(numer)
    //    println(denom)
//        println(that.numer)
    //    println(that.denom)
        new Rational(numer * that.denom - that.numer * denom, denom * that.denom)
    }
    def *(that: Rational) =
        new Rational(numer * that.numer, denom * that.denom)
    def *(that: BigInt) =
        new Rational(that * numer, denom);
    def /(that: Rational) =
        new Rational(numer * that.denom, denom * that.numer)
    def reciprocal() =
        new Rational(denom, numer)
    def ==(that: Rational) =
        (numer == that.numer && denom == that.denom)
}

object e101 {

    val one = BigInt(1)
    val u = Array(one, -one, one, -one, one, -one, one, -one, one, -one, one)

    /**Diagnostic only
    def printMat(matrix: Array[Array[Rational]]) {
        for (i <- 0 to matrix.size - 1) {
            for (j <- 0 to matrix(i).size - 1) {
                print(matrix(i)(j).numer + "/" + matrix(i)(j).denom + " ")
            }
            println
        }
    }
    */
    def solve(matrix: Array[Array[Rational]]): Array[BigInt] = {
        for (i <- 0 to matrix.size - 1) {
            // Get leading 0s
            for (j <- 0 to (i - 1)) {
                matrix(i) = matrix(i).map(_ * matrix(i)(j).reciprocal)
                for (k <- j to matrix(i).size - 1) {
                    matrix(i)(k) = matrix(i)(k) - matrix(j)(k)
                }
            }
            //Get the 1 in front
            matrix(i) = matrix(i).map(_ * matrix(i)(i).reciprocal)
        }
        // We go farther than row reduction, and get something
        // that looks the identity
        // (We assume correctly our matrix is invertible)
        for (i <- 1 to matrix.size - 1) {
            val ii = matrix.size - i
            for (j <- 0 to ii - 1) {
                val m = matrix(j)(ii)
                for (k <- 0 to matrix(j).size - 1) {
                    matrix(j)(k) = matrix(j)(k) - m * matrix(ii)(k)
                }
            }
        }
        val t = matrix.transpose
        return t(matrix.size).map((x: Rational) => x.numer / x.denom)
    }

    //For row reduction, we need the augmented matrix with the sequence in the
    //right-hand column
    def getMatrix(seq: Array[BigInt]) : Array[Array[Rational]] = {
        val matrix : Array[Array[Rational]] = new Array(seq.size)
        for (i <- 0 to matrix.size - 1) {
            matrix(i) = new Array(seq.size + 1)
            for (j <- 0 to seq.size - 1) {
                matrix(i)(j) = new Rational(BigInt(i  + 1) pow j, 1)
            }
            matrix(i)(seq.size) = new Rational(seq(i), 1)
        }
        return matrix
    }

    def evalPoly(p: Array[BigInt], n: Int): BigInt = {
        var s = BigInt(0)
        for (i <- 0 to p.size - 1) {
            s += p(i) * (BigInt(n) pow i)
        }
        return s
    }

    def FIT(p: Array[BigInt]): BigInt = {
        for (i <- 1 to 11) {
            var nextVal = evalPoly(p, i)
            if (nextVal != evalPoly(u, i)) {
                return nextVal
            }
        }
        return 0
    }

    def main(args: Array[String]) = {
        var ans = BigInt(0)
        var seq: Array[BigInt] = new Array(0)
        for(i <- 1 to 10) {
            seq = seq :+ evalPoly(u, i)
            val p = solve(getMatrix(seq))
            val fit = FIT(p)
            ans += fit
        }
        println(ans)
    }
}
