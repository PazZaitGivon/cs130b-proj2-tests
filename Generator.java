import java.util.Random;

public class Generator {
    public static void main(String[] args) {
        Random random = new Random();
        int N = random.nextInt(20);
        int K = random.nextInt(200);
        int S = random.nextInt(100);
        int C = random.nextInt(5);

        System.out.printf("%d\t%d\t%d\t%d\n", N, K, S, C);

        for (int i = 0; i < N; i++) {
            System.out.println(random.nextInt(200));
        }
    }
}
