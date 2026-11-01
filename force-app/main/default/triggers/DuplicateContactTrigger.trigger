trigger DuplicateContactTrigger on Contact (before insert,before update) {

    set<string> newEmails=new set<string>();
    for(contact newcon:trigger.new)
    {
        newEmails.add(newcon.email);
        //systesm.debug(newEmails);
    }
    
    set<string> oldEmails=new set<string>();
    List<contact> ExistingEmails =new List<contact>([select id,email from contact where email in:newEmails]);
    for(contact con:ExistingEmails)
    {
        oldEmails.add(con.Email);
    }
    
    for(Contact cont:trigger.new)
    {
    if(oldEmails.contains(cont.email))
    {
    cont.adderror('contact with email '+cont.email+' already exist');
    }
    
    
    }
    
    
    
    
}