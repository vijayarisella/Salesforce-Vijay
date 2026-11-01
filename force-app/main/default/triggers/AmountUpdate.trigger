trigger AmountUpdate on contact (before insert, before update,before delete )
{
    try
    {        if(trigger.isinsert)
        {
            Contact NewRecord = trigger.new[0];     
            if(NewRecord.Status__c == 'Paid')
            {    
                List<contact> lst = [Select Account.id from contact where Status__c = 'Paid' and AccountId=:NewRecord.AccountId];
                if(lst.size()>0)
                {
                       for( contact con : lst)
                       {
                          con.IsPrimary__c = false;
                       }
                 update lst;
                }          
            
            }
           
            }
           // Updating record
           

        
        
        }
        catch(Exception e)
            {
             System.debug(e.getMessage());    
            }
                   
}