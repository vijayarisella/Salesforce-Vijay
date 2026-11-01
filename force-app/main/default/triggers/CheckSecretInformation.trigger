trigger CheckSecretInformation on Case (after insert, before update) {
    set<String> secretKeywords = new set<String>();
    secretKeywords.add('passport');
    secretKeywords.add('Pan');
    secretKeywords.add('credit card');
    secretKeywords.add('social security');
    secretKeywords.add('bedyweight');
    List<case> caseThathaveSecretKey= new List<case>();
    
        
    
    for(case myCase: Trigger.new)
    {
    If (myCase.Description!=null){
        if(!myCase.Description.contains('Warining: created child case created which has scret keyword'))
        {
           for(string keyword:secretKeywords )
           {
               if(myCase.Description!=null && myCase.Description.containsIgnoreCase(keyword))
               {
                   caseThathaveSecretKey.add(myCase);
                   system.debug('inside for look secret key case' +myCase);
                   break;
     			}
    		} 
        }
    
    }
    }
    List <case> caseToCreate = new List<case>();
    for(case caseWithSecretInfo : caseThathaveSecretKey)
    {
     Case Childcase= new case();
     Childcase.priority='high';
        Childcase.status='new';
        Childcase.Origin='email';
        Childcase.parentId= caseWithSecretInfo.Id;
     Childcase.IsEscalated= true;
     Childcase.subject = 'Parent case contain secret info';
	Childcase.product_purchase_date__c =Date.today();
     Childcase.Description= 'Warining: created child case created which has scret keyword '+secretKeywords ;
        caseToCreate.add(Childcase);
        system.debug('created child case' +Childcase);
    }
    insert caseToCreate;
}