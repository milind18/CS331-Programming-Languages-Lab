import java.util.concurrent.locks.*;
import java.util.Random;
public class LinkedList
{
    Node head;
    Node tail;
    ReentrantReadWriteLock lock = new ReentrantReadWriteLock();
    /*
        Search, add, delete, modify
    */
    LinkedList()
    {
        head = null;
        tail = null;
    }

    public void insert(String acc, long bal)
    {
        lock.writeLock().lock();
        if(head == null)
        {
            head = new Node(acc,bal,null);
            tail = head;
        }
        else
        {
            Node temp = new Node(acc,bal,null);
            tail.next = temp;
            tail = temp;
        }
        lock.writeLock().unlock();
    }

    public int delete(String acc)
    {
        lock.readLock().lock();
        if(head == null)
        {
            return -1;
        }
        Node pred = null;
        Node temp = head;

        while(temp != null)
        {
            temp.acquireLock();
            if(acc.equals(temp.acc))
            {
                temp.active = false;
                temp.releaseLock();
                lock.readLock().unlock();
                return 0;
            }
            pred = temp;
            temp = temp.next;
            pred.releaseLock();
        }
        lock.readLock().unlock();
        return -1;
    }

    public int updateBalance(String acc,long bal)
    {
        lock.readLock().lock();
        if(head == null)
        {
            return -1;
        }
        Node pred = null;
        Node temp = head;

        while(temp != null)
        {
            temp.acquireLock();
            if(acc.equals(temp.acc))
            {
                if(temp.active == false)
                {
                    temp.releaseLock();
                    lock.readLock().unlock();
                    return -1;
                }
                temp.balance = Math.max(0,temp.balance + bal);
                temp.releaseLock();
                lock.readLock().unlock();
                return 0;
            }
            pred = temp;
            temp = temp.next;
            pred.releaseLock();
        }
        lock.readLock().unlock();
        return -1;
    }
    
    public long randomBalance(String acc)
    {
        lock.readLock().lock();
        if(head == null)
        {
            return -1;
        }
        Node pred = null;
        Node temp = head;

        while(temp != null)
        {
            temp.acquireLock();
            if(acc.equals(temp.acc))
            {
                if(temp.active == false)
                {
                    temp.releaseLock();
                    lock.readLock().unlock();
                    return -1;
                }
                Random rand = new Random();
                long change = (Math.abs(rand.nextLong())%temp.balance);
                temp.balance -= change;
                temp.releaseLock();
                lock.readLock().unlock();
                return change;
            }
            pred = temp;
            temp = temp.next;
            pred.releaseLock();
        }
        lock.readLock().unlock();
        return -1;
    }
    
    public long getBalance(String acc)
    {
        lock.readLock().lock();
        if(head == null)
        {
            return -1;
        }
        Node pred = null;
        Node temp = head;

        while(temp != null)
        {
            temp.acquireLock();
            if(temp.active == false)
            {    
                temp.releaseLock();
                lock.readLock().unlock();
                return -1;
            }
            if(acc.equals(temp.acc))
            {
                long ret = temp.balance;
                temp.releaseLock();
                lock.readLock().unlock();
                return ret;
            }
            pred = temp;
            temp = temp.next;
            pred.releaseLock();
        }
        lock.readLock().unlock();
        return -1;
    }
  
    public void printList()
    {
        lock.writeLock().lock();
        Node temp = head;
        while(temp != null)
        {
            if(temp.active == true)
                System.out.println(temp.acc);
            temp = temp.next;
        }
        lock.writeLock().unlock();
    }

}