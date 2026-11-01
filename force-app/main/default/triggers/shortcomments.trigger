trigger shortcomments on Task (before insert,before update)
{
    try
    {
        if (trigger.isBefore)
         {
            if (trigger.isInsert|| trigger.isUpdate) 
            {
                for(task t:trigger.new)
                {
                         if((t.description.length())<255)
                         {
                          t.ShortComments__c=t.description;
                         }  
                         else
                         {
                           t.ShortComments__c=t.description.SubString(0,251)+'...';
                         } 
                }
             }
          }
            
    }
    catch(NullPointerException e)
        {
        
        }
    
}