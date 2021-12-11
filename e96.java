import java.util.*;

//Because you can't have arrays of Generics
//Because Java is silly
class HashSetInteger extends HashSet<Integer> { }

public class e96 {

public static int[][] copyArray(int[][] arr) {
    int ret[][] = new int[arr.length][arr[0].length];
    for (int i = 0; i < arr.length; ++i) {
        for (int j = 0; j < arr.length; ++j) {
            ret[i][j] = arr[i][j];
        }
    }
    return ret;
}

public static void printBoard(int[][] board) {
    for (int i = 0; i < board.length; ++i) {
        for (int j = 0; j < board.length; ++j) {
            System.out.print(board[i][j]);
        }
        System.out.println();
    }
    System.out.println();
}

public static int solveBoard(int[][] board) {
    HashSetInteger[][] notes = new HashSetInteger[9][9];
    for (int i = 0; i < 9; ++i) {
        for (int j = 0; j < 9; ++j) {
            notes[i][j] = new HashSetInteger();
            for (int k = 1; k <= 9; ++k) {
                notes[i][j].add(k);
            }
        }
    }

    boolean changed      = false;
    boolean allSet       = true;
    boolean secondChanges = true;
    do {
        changed = false;
        for (int i = 0; i < 9; ++i) {
            for (int j = 0; j < 9; ++j) {
                if (board[i][j] == 0) {
                    for (int k = 0; k < 9; ++k) {
                        notes[i][j].remove(board[i][k]);
                        notes[i][j].remove(board[k][j]);
                        int startx = (i / 3) * 3;
                        int starty = (j / 3) * 3;
                        notes[i][j].remove(board[startx+(k%3)][starty+(k/3)]);
                    }
                    if (notes[i][j].size() == 1) {
                        for (Integer ger : notes[i][j]) {
                            board[i][j] = ger;
                        }
                        changed = true;
                    } else if (notes[i][j].size() == 0) {
                        return 0;
                    } else {
                        allSet = false;
                    }
                }
            }
        }
        secondChanges =  (!changed && !secondChanges);
    } while (changed || secondChanges);
    
    if (allSet) {
        return board[0][0]*100 + board[0][1]*10 + board[0][2];
    } else {
        int ret = 0;
        do {
        int[][] oldBoard = copyArray(board);
        for (int i = 0; i < 9; ++i) {
            for (int j = 0; j < 9; ++j) {
                if (board[i][j] == 0) {
                    if (notes[i][j].size() == 0) {
                        return 0;
                    }
                    for (Integer ger : notes[i][j]) {
                        board[i][j] = ger;
                        notes[i][j].remove(ger);
                        break;
                    }
                    i = 9;
                    j = 9;
                }
            }
        }
        ret   = solveBoard(board);
        board = oldBoard;
        } while (ret == 0);
        return ret;
    }
}

public static void main(String[] args) {
    int ans = 0;
    //we pass sudoku.txt through stdin
    //even though I guess it would be about as easy
    //to just past it to this scanner, huh?
    Scanner scan = new Scanner(System.in);
    scan.useDelimiter("");
    for (int i = 0; i < 50; ++i) {
        int[][] board = new int[9][9];
        scan.nextLine();
        for (int r = 0; r < 9; ++r) {
            for (int c = 0; c < 9; ++c) {
                String s = scan.next();
                board[r][c] = Integer.parseInt(s);
            }
            scan.nextLine();
        }
        ans += solveBoard(board);
    }
    System.out.println(ans);
}

}
