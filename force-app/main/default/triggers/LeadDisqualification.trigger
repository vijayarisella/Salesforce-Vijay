trigger LeadDisqualification on Lead (before insert) {
    List <lead> LeadsToDisqualify =new List<lead>();
    for(Lead myLead : Trigger.new)
    {
        String keywords='test';
        if ((myLead.Firstname!= null && myLead.Firstname.containsIgnoreCase(keywords)) || (myLead.Lastname!= null && myLead.Lastname.containsIgnoreCase(keywords)))
        {
            LeadsToDisqualify.add(myLead);
        }
    }
    for(Lead Leadsdisqualified: LeadsToDisqualify)
    {
        Leadsdisqualified.status='Closed - Not Converted';
    }
}