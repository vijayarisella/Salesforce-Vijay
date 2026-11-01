public class AccountProcessor {
    @future
    public static void countContacts(list<id> accid)
    {
         List<Account> accounts = [Select Id, Name from Account Where Id IN :accid];
             
        for(Account acclist: accounts)
        {
         List<contact> myList   = [select id from contact where accountid =:acclist.id];
         acclist.Number_Of_Contacts__c  = myList.size();
        
        }
        update accounts;
        
        
    }

}