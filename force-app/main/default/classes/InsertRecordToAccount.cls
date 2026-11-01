public class InsertRecordToAccount {

    public pagereference show()
    {
        List<Account> AccList=new List<Account>();
      Account a =new Account(name='vijaykumararisella', Industry='Banking');
    AccList.add(a);
    Database.SaveResult[] r=Database.insert(AccList, false);
        system.debug(Acclist);
         List<Account> Accs=[select id ,(select id from contacts) from account limit 1];
        
        
        for(Account a1:Accs)
        {
            system.debug(a1.id);
            
        }
	return null;     
    }
         
}