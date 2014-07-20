
public class e91 {

    public static int min (int x, int y) {
        return x < y ? x : y;
    }

    public static void main(String[] args) {

        int ans = 0;
        final int B = 50 + 1;
        for (int P1 = 1; P1 < B*B; ++P1) {
            for (int P2 = P1 + 1; P2 < B*B; ++P2) {
                int x1 = P1 / B;
                int y1 = P1 % B;
                int x2 = P2 / B;
                int y2 = P2 % B;
                int oldans = ans; 
                if(min(x1, x2) == 0 && min(y1, y2) == 0) {
                    //Right Angle at origin
                    ++ans;
                } else if ((y1 == y2) && (x1 == 0 || x2 == 0)) {
                    //undef slope, check explicitly
                    ++ans;
                } else if ((x1 == x2) && (y1 == 0 || y2 == 0)) {
                    //same
                    ++ans;
                } else {
                    //Negative reciprocals => right angle
                    int num   = y1 * (y1 - y2);
                    int denom = x1 * (x1 - x2);
                    if (denom != 0) {
                        int ratio = num / denom;
                        int rem   = num % denom;
                        ans += (ratio == -1 && rem == 0) ? 1 : 0;
                    }
                    if (ans == oldans) {
                        num   = y2 * (y2 - y1);
                        denom = x2 * (x2 - x1);
                        if (denom != 0) {
                            int ratio = num / denom;
                            int rem   = num % denom;
                            ans += (ratio == -1 && rem == 0) ? 1 : 0;
                        }
                    }
                }
            }
        }
        System.out.println(ans);
    }
}
