trigger AccountTrigger on Account(before insert,after insert,after update, after delete)
{
    if(trigger.isInsert&& trigger.isBefore)
    {
        AccountTriggerhandler.validateAccountBeforeInsert(trigger.new);
    }
    if(trigger.isInsert && trigger.isAfter)
    {
        AccountTriggerhandler.insertContact(trigger.new);
    }
    if(trigger.isAfter && trigger.isUpdate)
    {
        AccountTriggerhandler.createopportunity( trigger.newMap, trigger.oldMap);
    }
    if(trigger.isdelete && trigger.isAfter)
    {
        AccountTriggerhandler.PreventDeletion(trigger.new);
    }
    public static void insertAccount(){
        
    }
    
}