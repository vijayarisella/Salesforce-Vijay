trigger MultiPickListCounter on Account (before insert,before update) {
    Integer Count;
    for(Account a: Trigger.new)
    {
        if(a.Multi_PickList__c!= null)
        {
            Count=a.Multi_PickList__c.countMatches(';')+1;
            a.Multi_picklist_counter__c =Count;
        }
        else
        {
         a.Multi_picklist_counter__c = 0;
        }
    }
    
}