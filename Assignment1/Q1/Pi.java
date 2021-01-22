import java.util.*;

public class Pi implements Runnable{

    int n;
    int inside = 0;
    Thread t;
    public Pi(int num)
    {
        n = num;
        t = new Thread(this);
        t.start();
    }
    public void run(){
        try{
            int i = 0;
            while(i < n)
            {
                Double x = Math.random();
                Double y = Math.random();
                if(x*x + y*y <= 1)
                {
                    inside++;
                }
                i++;
            }
        }catch(Exception e){}
    }
    public int getInside()
    {
        return inside;
    }
}
