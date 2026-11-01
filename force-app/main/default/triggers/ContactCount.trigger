trigger ContactCount on Contact (after insert, after update, after delete) 
{
    Map<Id, List<Contact>> AcctContactList = new Map<Id, List<Contact>>();
    Set<Id> AcctIds = new Set<Id>();    
    List<Account> AcctList = new List<Account>();
    List<Contact> ConList = new List<Contact>();
    
    if(trigger.isInsert || trigger.isUpdate) 
    {
        for(Contact Con : trigger.New) 
        {
            if(String.isNotBlank(Con.AccountId))
            {
                AcctIds.add(Con.AccountId);  
            }   
        }  
    }
    
    if(trigger.isDelete) {
        for(Contact Con : trigger.Old) {
            AcctIds.add(Con.AccountId);     
        }  
    }           
    
    if(AcctIds.size() > 0)
    {
        ConList = [SELECT Id, AccountId FROM Contact WHERE AccountId IN : AcctIds];
        
        for(Contact Con : ConList)  {
            if(!AcctContactList.containsKey(Con.AccountId)){
                AcctContactList.put(Con.AccountId, new List<Contact>());
            }
            AcctContactList.get(Con.AccountId).add(Con);      
        }                           
        
        System.debug('Account Id and Contact List Map is ' + AcctContactList);
            
        
    }

}