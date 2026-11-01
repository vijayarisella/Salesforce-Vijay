@isTest 
public class DoNotAllowSLAChangeswithOpenCases_TC {
    @isTest static void updateaccount()
    {
        Account newAcc= new Account();
        newAcc.name='test account';
        newAcc.active__c='yes';
        newAcc.SLA__C='gold';
        insert newAcc;
        newAcc.SLA__C='silver';
        update newAcc;
    }
}