
public class Euler26 {

    public static int biggestCycle(int d) {
        int[] rems = new int[1000];
        int r = 1;
        int i = 0;
        while (r != 0) {
            r = (r * 10) % d;
            for (int j=0;j<i;++j) {
                if (rems[j] == r) {
                    return i;
                }
            }
            rems[i++] = r;
        }
        return i;
    }

    public static int Main(string[] args) {
        int ans = 0;
        for (int d=1;d<1000;++d) {
            ans = ans < biggestCycle(d) ? d : ans;
        }
        System.Console.WriteLine(ans);
        return 0;
    }
}
