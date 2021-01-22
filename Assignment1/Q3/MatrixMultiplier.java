import java.util.*;

public class MatrixMultiplier {

    static void printArray(int A[][], int n) {
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++)
                System.out.printf("%d ", A[i][j]);
            System.out.printf("\n");
        }
        System.out.println("\n");
    }

    static void generateEntries(int A[][], int n, int numOfThreads) {
        int q = n / numOfThreads;
        int r = n % numOfThreads;

        RandInit t[] = new RandInit[numOfThreads];
        for (int i = 0; i < numOfThreads; i++) {
            if (i == numOfThreads - 1) {
                t[i] = new RandInit(A, i * q, n, n);
                continue;
            }
            t[i] = new RandInit(A, i * q, (i + 1) * q, n);
        }
        try {
            for (int i = 0; i < numOfThreads; i++) {
                t[i].t.join();
            }
        } catch (Exception e) {

        }
    }

    static void multiply(int A[][], int B[][], int C[][], int n, int numOfThreads) {
        int q = n / numOfThreads;
        int r = n % numOfThreads;

        MultiplicationWorker t[] = new MultiplicationWorker[numOfThreads];
        for (int i = 0; i < numOfThreads; i++) {
            if (i == numOfThreads - 1) {
                t[i] = new MultiplicationWorker(A, B, C, n, i * q, n);
                continue;
            }
            t[i] = new MultiplicationWorker(A, B, C, n, i * q, (i + 1) * q);
        }
        try {
            for (int i = 0; i < numOfThreads; i++) {
                t[i].t.join();
            }
        } catch (Exception e) {

        }
    }

    public static void main(String args[]) {
        Scanner readInp = new Scanner(System.in);
        int numOfThreads = readInp.nextInt();
        readInp.close();

        int n = 2000;
        int A[][] = new int[n][n];
        int B[][] = new int[n][n];
        int C[][] = new int[n][n];

        generateEntries(A, n, numOfThreads);
        generateEntries(B, n, numOfThreads);

        long start_time = System.nanoTime();
        multiply(A, B, C, n, numOfThreads);
        long finish_time = System.nanoTime();



        /*
        printArray(A, n);
        printArray(B, n);
        printArray(C, n);
        */
        System.out.println("Execution time: " + (finish_time-start_time)*(0.000000001)+" seconds");

    }
}
