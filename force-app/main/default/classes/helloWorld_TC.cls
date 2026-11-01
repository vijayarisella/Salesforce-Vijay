@isTest
private class helloWorld_TC{
    @isTest static void updatelead()
    {
    lead mylead=new lead();
    mylead.FirstName='vijay';
    mylead.lastName='vijay';
    mylead.company ='dell';
    mylead.Status = 'closed - converted';
    insert mylead;
    mylead.company ='dellEMC';
    update mylead;
    }

}