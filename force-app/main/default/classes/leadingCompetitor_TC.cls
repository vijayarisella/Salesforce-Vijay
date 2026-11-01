@isTest
private class leadingCompetitor_TC{
    @isTest static void createOpty()
    {
    opportunity myOpty=new opportunity();
     myOpty.Competitor_1_Price__c =100;
     myOpty.Competitor_1_Price__c =200;
     myOpty.Competitor_1_Price__c =300;
     myOpty.Competitor_1__c ='Google'; 
     myOpty.Competitor_2__c ='oracle'; 
     myOpty.Competitor_3__c ='microsoft'; 
     myOpty.Name='leadingCompetitor_TC';
     myOpty.StageName='Closed won';
     myOpty.CloseDate =Date.today();
        
    insert myOpty;
   }

}