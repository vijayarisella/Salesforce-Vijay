@isTest
private class LeadDisqualification_TC{
    @isTest static void insertLead()
    {
    lead mylead=new lead();
    mylead.FirstName='test';
    mylead.LastName='test';
    mylead.company ='test';
 
    insert mylead;
    }

}