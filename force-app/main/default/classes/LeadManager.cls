global class LeadManager {
    webservice static string createNewLead(string leadFirstName,string leadLastName,string LeadCompanyName,string leadEmail,string leadphone,String LeadFax){
        try{
            Lead ld = new lead();
            ld.FirstName = leadFirstName;
            ld.LastName = leadLastName;
            ld.Company  = LeadCompanyName;
            ld.Email    = leadEmail;
            ld.Phone    = leadphone;
            ld.Fax      = leadFax;
            insert ld;
            return ld.id;
        }
        catch(exception ex){
            return 'Error during processing';
        }
    }
}