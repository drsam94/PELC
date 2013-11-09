using System.IO;
public class Euler59 {
    
    public static char[] decode(char[] key) {
        StreamReader reader = new StreamReader("cipher1.txt");
        char[] message = new char[1201];
        int i = 0;
        do {
            char c = (char) System.Convert.ToInt16(reader.ReadLine());
            message[i] = (char)(((int)c) ^ ((int)key[i%3]));
            i++;
        } while (reader.Peek() != -1);
        return message;
    }


    public static int Main(string[] args) {
        for (char a = 'a'; a <= 'z'; ++a) {
            for (char b = 'a'; b <= 'z'; ++b) {
                for (char c = 'b'; c <= 'z'; ++c) {
                    char[] key = new char[3] {a,b,c};
                    char[] asciis = decode(key);
                    string message = new string(asciis);
                    if (message.Contains(" the ")) {
                        int ans = 0;
                        for (int i = 0; i < asciis.Length; ++i) {
                            ans += (int) asciis[i];
                        }
                        System.Console.WriteLine(ans);
                        return 0;
                    }
                }
            }
        }
        return 0;
    }
}
