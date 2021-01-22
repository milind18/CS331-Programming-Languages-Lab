import java.util.Scanner;

public class PiCalculator{
    public static void main(String[] args)
    {
        Scanner input = new Scanner(System.in);
        System.out.println("Enter the number of threads: ");
        int n = input.nextInt();

        Pi t[] = new Pi[n];
        int numbersPerWorker = 1000000/n;
        for(int i = 0; i < n; i++)
        {
            t[i] = new Pi(numbersPerWorker);
        }
        int totalNumPoints = numbersPerWorker*n;
        double totalInside = 0;
        try {
            for(int i = 0;i < n;i++)
            {
                t[i].t.join();
                totalInside += t[i].getInside();
            }
            } catch (InterruptedException ignored) {
            }
        double pi_calculated = 4*totalInside/totalNumPoints;
        System.out.printf("Estimated value of Pi:\n %f\n",pi_calculated);
        
    }
}
