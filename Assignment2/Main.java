public class Main {

    public static void main(String args[])
    {
        //Bank b = new Bank(1000);
        //System.out.println(b.nextAccountNumber(1));
        //System.out.println(b.nextAccountNumber(0));

        LinkedList a = new LinkedList();
        a.insert("121",100);
        a.insert("123",200);
        a.delete("121");
        System.out.println(a.randomBalance("121"));
        System.out.println(a.getBalance("121"));
    }
        
}
