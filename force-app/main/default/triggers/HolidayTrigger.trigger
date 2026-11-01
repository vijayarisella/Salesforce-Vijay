trigger HolidayTrigger on Task (before insert) 
{
    if (trigger.isBefore||trigger.isInsert)
    {
        List<HolidayList__c> lst1=[select date__c from HolidayList__c];
        for(task t:Trigger.new)
        {
            for(HolidayList__c h:lst1)
            {
                if(t.ActivityDate==h.date__c || t.WeekEnd__c=='saturday' ||t.WeekEnd__c=='sunday')
                {
                    t.ActivityDate.addError(' The date you selected is a Holiday. Please choose another date');
                }
            
            }
            
        }
    }   
}