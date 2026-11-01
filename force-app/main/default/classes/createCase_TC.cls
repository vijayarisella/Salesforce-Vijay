@isTest
private class createCase_TC{
    @isTest static void createAccount()
    {
    Account myAcc=new Account();
    myAcc.name='vijaykumar';
    myAcc.Active__c = 'yes';
    myAcc.SLA__c ='gold';
    insert myAcc;
    }

}