trigger createCase on Account (after insert) {
    for(Account a:Trigger.new)
    {
    Case c=new case();
    c.Subject = 'Dedupe this account';
    c.OwnerId = a.ownerid;
    c.Accountid=a.id;
    
    insert c;
    }

}