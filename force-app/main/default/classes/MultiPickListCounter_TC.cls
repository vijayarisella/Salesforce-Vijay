@isTest
private class MultiPickListCounter_TC{
    @isTest static void insertAccount()
    {
    Account a = new Account();
    a.name='vijay';
    a.SLA__c = 'gold';
    a.Multi_picklist__c='hyd;bng;chennai';
       
    insert a;
       a.Multi_picklist__c=null;
       update a;
    }
}