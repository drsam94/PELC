import java.math.BigInteger;

public class e20 {
public static void main(String[] args) {

    BigInteger count = BigInteger.ONE;
    for (int i = 1; i < 100; ++i) {
        count = count.multiply(new BigInteger(i + ""));
    }
    BigInteger solution = BigInteger.ZERO;
    while (!count.equals(BigInteger.ZERO)) {
        solution = solution.add(count.mod(BigInteger.TEN));
        count    = count.divide(BigInteger.TEN);
    }
    System.out.println(solution);
}
}
