trigger AutomaticUpdate on contact (before insert, before update,before delete )
{
list<Contact> cnt=new list<Contact>();
list<Account> acc=new list<Account>();
set<Id> accid=new set<Id>();
 for(Contact c:Trigger.new)
 {
  accid.add(c.AccountId);
 }
   
    try
    {    if(trigger.isinsert && trigger.isBefore)
            {
              cnt=[select Id,AccountId,isPrimary__c from contact where AccountId in:accid];
                                     for(Contact c:cnt)
                     {
                  if(c.isPrimary__c==true)
                  {
                   c.isPrimary__c=false;
                   }
                   update c;
                  }
          }
    }
    catch(Exception e)
    {
    
    }
    
}