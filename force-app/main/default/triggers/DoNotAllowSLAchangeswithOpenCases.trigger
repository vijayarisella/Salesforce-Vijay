trigger DoNotAllowSLAchangeswithOpenCases on Account (before update) {
   
    //find the accounts with open cases
    List<Account> accountsWithOpenCases = [select ID, 
                                                (select id from cases 
                                                 where IsClosed = false limit 1)
                                                from Account where id in: Trigger.new];
            
    for(Account acc:accountsWithOpenCases)
    {
        //check id SLA field is changed
        String oldSLA=Trigger.oldMap.get(acc.id).SLA__c;
        String newSLA=Trigger.newMap.get(acc.id).SLA__c;
        Boolean isSLAChanged = oldSLA!=newSLA;
        //check account has open cases
        Boolean hasopencases = acc.cases.size()>0;
        
        //Get the trigger.new version of the accont
        Account accInNewTrigger = trigger.newMap.get(acc.id);
        //Through the error when open cases to the account
        if(isSLAChanged && hasopencases)
        {
            accInNewTrigger.SLA__C.adderror('please do not change SLA when open cases on it');
        }  
    }
}