trigger MultiPicklistTask on Account (after insert) {
    List<String> listitems = new List<string>();
    for(Account a:Trigger.new)
    {
       if(a.Multi_picklist__c!=null)
       {
           system.debug('account id'+a.id);
        listitems= a.Multi_picklist__c.split(';'); 
        system.debug('list items are '+listitems);
       }
    list <task> taskForSelectedItem = new List<task>();
    for(String selecteditem: listitems)
    {
        System.debug('task starting'+selecteditem);
        Task t =new Task();
        t.subject= selecteditem;
        t.WhatId =a.Id; 
        taskForSelectedItem.add(t);
    }
        system.debug('insert task'+taskForSelectedItem);
    insert taskForSelectedItem;
    }
   
}