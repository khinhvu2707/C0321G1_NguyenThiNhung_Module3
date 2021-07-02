import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nhập hệ số bậc 2, a = ");
        float a = scanner.nextFloat();
        System.out.print("Nhập hệ số bậc 1, b = ");
        float b = scanner.nextFloat();
        System.out.print("Nhập hằng số tự do, c = ");
        float c = scanner.nextFloat();
       Equation.giaiPTBac2(a,b,c);
    }
}
