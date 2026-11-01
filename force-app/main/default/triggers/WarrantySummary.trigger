trigger WarrantySummary on Case (before insert) {
    for(case myCase:Trigger.new)
    {
       if((myCase.product_total_warranty_days__c!= null) && (myCase.product_purchase_date__c!=null) && (myCase.product_has_extended_warranty__c!=null)){
        Date purchaseDate=myCase.product_purchase_date__c;
        DateTime createdDate = DateTime.now();
        Integer warrantyDays;
        
        warrantyDays=myCase.product_total_warranty_days__c.intValue();
         
        
        Decimal warrantyPercentage=(purchaseDate.daysBetween(Date.today()))/myCase.product_total_warranty_days__c;
        Boolean hasExtendedWarranty=myCase.product_has_extended_warranty__c;
        myCase.warranty_summary__c = ' product purchased on ' +  purchaseDate +''
                                    + ' and case created on ' + createdDate+'\n'
                                    +' warranty is for '+warrantyDays+''
                                    +' and percentage is ' +warrantyPercentage+'through warranty peroid '+''
                                    +' has extended warranty '+hasExtendedWarranty;
    }
    }
}