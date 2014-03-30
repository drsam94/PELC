import java.util.Scanner;
import java.util.HashSet;
import java.util.Vector;

public class e79 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        Vector<HashSet<Integer>> preceding = new Vector<HashSet<Integer>>();
        HashSet<Integer> used = new HashSet<Integer>();
        for (int i = 0; i < 10; ++i) {
            preceding.add(new HashSet<Integer>());
        } 
        while (scan.hasNextInt()) {
            int entry = scan.nextInt();
            Integer d1 = entry / 100;
            Integer d2 = (entry / 10) % 10;
            Integer d3 = entry % 10;
            preceding.get(d2).add(d1);
            preceding.get(d3).add(d1);
            preceding.get(d3).add(d2);
            used.add(d1);
            used.add(d2);
            used.add(d3);
        }
        String ans = "";
        int i = 0;
        while (i < 10) {
            if (preceding.get(i).isEmpty() && used.contains(i)) {
                ans += i;
                used.remove(i);
                for (HashSet<Integer> hs : preceding) {
                    hs.remove(i);
                }
                i = 0;
            } else {
                ++i;
            }
        }
        System.out.println(ans);
    }
}