trigger leadingCompetitor on Opportunity (before insert, before update) {
    for(opportunity opp:Trigger.new)
    {
    List<Decimal> CompetitorPrices= new List<Decimal>();
    CompetitorPrices.add(opp.Competitor_1_Price__c);
    CompetitorPrices.add(opp.Competitor_2_Price__c);
    CompetitorPrices.add(opp.Competitor_3_Price__c);
    
    List<String> Competitors= new List<String>();
    Competitors.add(opp.Competitor_1__c);
    Competitors.add(opp.Competitor_2__c);
    Competitors.add(opp.Competitor_3__c);
    Decimal LowestPrice ;
    Integer LowestPricePosition; 
    for(Integer i=0;i<CompetitorPrices.size();i++){
         Decimal currentPrice=CompetitorPrices.get(i);
         if(LowestPrice==null || CompetitorPrices.get(i)>LowestPrice){
          LowestPrice = currentPrice;
          LowestPricePosition = i;
         }   
     opp.Leading_Competitor__c = Competitors.get(LowestPricePosition);
     opp.Expensive_Competitor__c= LowestPrice;
    }
    }
}