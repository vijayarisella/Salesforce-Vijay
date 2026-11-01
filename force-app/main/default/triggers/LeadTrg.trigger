trigger LeadTrg on Account(before insert,before update, after insert) {

    if(trigger.isBefore){
        if(trigger.isInsert)
        System.debug('>>>>>>>>Trigger fired before Insert>>>>>>>>>>>>');
        if(trigger.isUpdate)
        System.debug('>>>>>>>>Trigger fired before update>>>>>>>>>>>>');
    }
    if(trigger.isAfter){
        System.debug('>>>>>>>>Trigger fired after>>>>>>>>>>>>');
    }

}