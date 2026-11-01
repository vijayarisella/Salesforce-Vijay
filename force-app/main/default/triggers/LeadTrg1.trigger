trigger LeadTrg1 on Lead (before delete, after insert) {

    if(trigger.isBefore){
       System.debug('>>>>>>>>>>>>>>'+trigger.old[0]);
    }
    if(trigger.isAfter){
       System.debug('>>>>>>>>>>>>>>'+trigger.new[0]);       
    }

}