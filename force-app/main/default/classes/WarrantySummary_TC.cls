@isTest
private class WarrantySummary_TC{
    @isTest static void createCase()
    {
    Case myCase=new Case();
    myCase.Status= 'new';
    myCase.Origin='email';
    myCase.product_total_warranty_days__c =20;
    myCase.product_purchase_date__c = date.ValueOf('2017-09-21');
    insert myCase;
        
    }

}