trigger NewAutomaticUpdate on contact (before insert, before update,before delete )
{
    try
    {        if(trigger.isinsert)
        {
            Contact NewRecord = trigger.new[0];     
            if(NewRecord.IsPrimary__c == true)
            {    
                List<contact> lst = [Select id from contact where IsPrimary__c = true and AccountId=:NewRecord.AccountId];
                if(lst.size()>0)
                {
                       for( contact con : lst)
                       {
                          con.IsPrimary__c = false;
                       }
                 update lst;
                }          
            
            }
            else
            {
             List<contact> lst = [Select id from contact where IsPrimary__c = true and AccountId=:NewRecord.AccountId];
        
             if(lst.size()<1)
                {
                  NewRecord.IsPrimary__c=true;             
                }
            }
            }
           // Updating record
           if(trigger.isupdate )
                                {
                                    Contact NewRecord1 = trigger.old[0];     
                                    if(NewRecord1.IsPrimary__c == false && trigger.new[0].IsPrimary__c == true )
                                    {
                                    List<contact> lst1 = [Select id from contact where IsPrimary__c = true and AccountId=:NewRecord1.AccountId];
                                        if(lst1.size()>0)
                                        {
                                               for( contact con1 : lst1)
                                               {
                                                  con1.IsPrimary__c = false;
                                               }
                                         update lst1;
                                        }                                     
                                    }
                                                                                               
                                    else if(NewRecord1.IsPrimary__c == true && trigger.new[0].IsPrimary__c == false )
                                    {
                                 /** List<contact> Updatelst = [Select id from contact where IsPrimary__c = false and AccountId=:NewRecord1.AccountId order by LastModifiedDate desc limit 1];
                                     if(Updatelst.size()>0)
                                        {
                                               for( contact con2 : Updatelst)
                                               {
                                                  con2.IsPrimary__c = true;
                                               }
                                         update Updatelst;
                                        } 
                                        else   */                                 
                                   NewRecord1.addError('You can not update record because it is a primary contact for your Account');
                 
                                    
                                    }  
                                                   
                               
                               
                               
                                } 
                                 //Delete opration

                                  if(trigger.isDelete)
                                    {
                                          Contact NewRecordToDelete = trigger.old[0];  
                                        if((trigger.old[0].IsPrimary__c ==true) )
                                        {
                                          
                                          NewRecordToDelete.IsPrimary__c.addError('You can not delete record because it is a primary contact for your Account');
                                        
                                        
                                        }
                                    }

        
        
        }
        catch(Exception e)
            {
             System.debug(e.getMessage());    
            }
                   
}