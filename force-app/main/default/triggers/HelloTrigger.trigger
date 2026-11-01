trigger HelloTrigger on Lead (before update) {
    for(lead l:Trigger.new)
        {
        l.FirstName='hello';
        l.LastName='world';
        }
}