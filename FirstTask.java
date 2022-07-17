import java.util.Scanner;

public class FirstTask {

    public static String sequence(int n) {
        if (n == 1) {
            return "1";
        }
        if (n == 2)  {
            return "11";
        }

        StringBuilder previousTerm = new StringBuilder("11");
        for (int i = 3; i <= n; i++) {
            previousTerm.append("$");
            int counter = 1;
            StringBuilder tmp = new StringBuilder();
            char[] symbolsOfSequence = previousTerm.toString().toCharArray();

            for (int j = 1; j < previousTerm.length(); j++) {
                if (symbolsOfSequence[j] != symbolsOfSequence[j - 1]) {
                    tmp.append(counter);
                    tmp.append(symbolsOfSequence[j - 1]);
                    counter = 1;
                }
                else {
                    counter++;
                }
            }
            previousTerm = new StringBuilder(tmp.toString());
        }
        return previousTerm.toString();
    }

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        boolean flag = false;
        System.out.println("Введите число, ограничивающее последовательность:");
        int n = in.nextInt();
        while (!flag) {
            if (n < 1) {
                System.out.println("Число должно быть не меньше 1");
                n = in.nextInt();
            }
            else {
                flag = true;
                for (int i = 1; i < n + 1; i++) {
                    System.out.println(sequence(i));
                }
            }
        }
    }
}
