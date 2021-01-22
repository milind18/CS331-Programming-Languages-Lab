import java.util.*;

public class IntegralCalculator{
    public static void main(String arg[])
    {
        Scanner readInt = new Scanner(System.in);
        int n = readInt.nextInt();
        double ans = 0 ;
        Integral t[] = new Integral[n];
        double division = 1/Double.valueOf(n);
        for(int i = 0; i < n; i++)
        {
            t[i] = new Integral(i*division, (i+1)*division);
        }
        Integral a = new Integral(0,1);
        try{
            for(int i = 0;i<n;i++)
            {
                t[i].t.join();
                ans += t[i].retAns();
            }
        }
        catch(Exception e){}
        double scaling = Math.sqrt(2/Math.PI);
        System.out.println(ans*scaling);
        //System.out.println("threads: " + n);
    }

}
