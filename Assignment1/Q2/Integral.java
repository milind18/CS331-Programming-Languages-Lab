public class Integral implements Runnable
{
    double start;
    double end;
    double step = 0.000001;
    Thread t;

    double ans = 0;
    public Integral(double start, double end)
    {
        this.start = start;
        this.end = end;

        t = new Thread(this);
        t.start();
    }
    
    public void run()
    {
        try{
            System.out.println("HERE");
            
            double calc = 0;
            int sw = 0;
            for(double i = start; i <= end; i += step)
            {
                if(i == start || i == end )
                {
                    ans += Math.exp(-(i*i));
                    continue;
                }
                if(sw == 1) ans += 2*Math.exp(-(i*i));
                else ans+= 4*Math.exp(-(i*i));

                sw= 1-sw;
            }
            
        }
        catch(Exception e){}
    }

    public double retAns()
    {
        return (ans*step)/3;
    }

}
