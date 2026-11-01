public class ArrayExapmle1Controller {
public List<Account> result{set;get;}

public ArrayExapmle1Controller()
{
Account a1=new Account(name='sam',Industry='banking');
result=new List<Account>();
result.add(a1);
}
}