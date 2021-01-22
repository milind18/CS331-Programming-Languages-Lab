public class MultiplicationWorker implements Runnable {
    int A[][];
    int B[][];
    int C[][];
    int n;
    int start;
    int end;

    Thread t;

    public MultiplicationWorker(int A[][], int B[][], int C[][], int n, int start, int end) {
        this.A = A;
        this.B = B;
        this.C = C;
        this.n = n;
        this.start = start;
        this.end = end;

        t = new Thread(this);
        t.start();
    }

    public void run() {
        try {

            for (int i = start; i < end; i++) {
                for (int j = 0; j < n; j++) {
                    for (int k = 0; k < n; k++) {
                        C[i][j] += A[i][k] * B[k][j];
                    }
                }
            }

        } catch (Exception e) {
        }
    }
}