
public class RandInit implements Runnable {
    Thread t;

    int start;
    int end;
    int n;
    int[][] A;

    public RandInit(int[][] A, int start, int end, int n) {
        this.start = start;
        this.end = end;
        this.A = A;
        this.n = n;

        t = new Thread(this);
        t.start();
    }

    public void run() {
        try {
            for (int i = start; i < end; i++) {
                for (int j = 0; j < n; j++) {
                    A[i][j] = (int) (Math.random() * 11);
                }
            }
        } catch (Exception e) {

        }
    }
}