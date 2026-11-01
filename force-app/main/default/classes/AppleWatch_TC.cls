@isTest
private class AppleWatch_TC{
    @isTest static void createopportunity()
    {
    opportunity myOpty=new opportunity ();
    myOpty.Name='vijay';
    myOpty.CloseDate = Date.parse('12/16/19');
    myopty.StageName = 'closed won';
    insert myOpty;
    }

}