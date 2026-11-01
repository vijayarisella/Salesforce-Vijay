@isTest
private class CheckSecretInformation_TC{
    @isTest static void createcase()
    {
        Case Childcase= new case();
        Childcase.priority='high';
        Childcase.status='new';
        Childcase.Origin='email';
        Childcase.product_total_warranty_days__c = 20;
        Childcase.IsEscalated= true;
        Childcase.subject = 'case: Parent case contain secret info';
        Childcase.product_purchase_date__c =Date.today();
        Childcase.Description= 'passport secretKeywords.add Pan ' ;
        insert Childcase;
        Childcase.Description= 'Warining: created child case created which has scret keyword' ;
        update Childcase;
   }

}