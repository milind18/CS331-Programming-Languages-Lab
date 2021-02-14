import java.util.*;
import java.util.concurrent.locks.*;
public class Node
{
    public Boolean active;
    public String acc;
    public long balance;
    public Node next;

    ReentrantReadWriteLock rw = new ReentrantReadWriteLock();
    void acquireLock()
    {
        rw.writeLock().lock();
    }
    void releaseLock()
    {
        rw.writeLock().unlock();
    }

    Node(String acc,long balance,Node next)
    {
        this.acc = acc;
        this.balance = balance;
        this.next = next;
        this.active = true;
    }
    Node()
    {
        this.acc = "";
        this.active = false;
    }
};
