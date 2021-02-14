import java.util.concurrent.atomic.*;
public class Bank
{
    AtomicIntegerArray nextNumber;
    LinkedList [] ll;
    int slots;
    long d;
    Bank(int slots)
    {
        this.slots = slots;
        ll = new LinkedList[slots];
        for(int i = 0; i < slots; i++)
        {
            ll[i] = new LinkedList();
        }
        nextNumber = new AtomicIntegerArray(slots/10);
        d = Long.valueOf(slots)/10;
    }

    int branch(String acc)
    {
        return (int)acc.charAt(0)-(int)'0';
    }
    int hash(String acc)
    {
        long l = Long.parseLong(acc);
        long ret = l%d;
        return Math.toIntExact(ret);
    }
    int findSlot(String acc)
    {
        int slot = hash(acc);
        slot += (branch(acc))*d;
        return slot;

    }

    String nextAccountNumber(int branchNumber)
    {
        int num = nextNumber.getAndIncrement(branchNumber);
        int k = Integer.toString(num).length();
        String accNumber ="";
        accNumber += (char)(branchNumber+(int)'0');
        for(int i = 1; i <= 9-k; i++)
        {
            accNumber += '0';
        }
        accNumber += Integer.toString(num);
        return accNumber;
    }

    void addAccount(String acc, long bal)
    {
        ll[findSlot(acc)].insert(acc,bal);
    }
 
    void deleteAccount(String acc)
    {
        ll[findSlot(acc)].delete(acc);
    }

    void depositAmount(String acc, long bal)
    {
        ll[findSlot(acc)].updateBalance(acc,bal);
    }
    
    void withdrawAmount(String acc)
    {
        ll[findSlot(acc)].randomBalance(acc);
    }

    void transferAmount(String acc1, String acc2)
    {
        long amount = ll[findSlot(acc1)].randomBalance(acc1);
        ll[findSlot(acc2)].updateBalance(acc2,amount);
    }

    void transferAccount(String acc, int branchNumber)
    {
        long bal = ll[findSlot(acc)].getBalance(acc);
        String accnew = nextAccountNumber(branchNumber);
        addAccount(accnew, bal);
    }

}