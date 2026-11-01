trigger BankTrigger on BankApp1__c (before insert, after insert)
{
List<BankApp1__c> BankList1=new List<BankApp1__c>();
for (BankApp1__c b : trigger.new)
{
        if(b.City__c==null)
        {
          b.addError('City cannot be blank!');
          // Trigger.get(b.City__c).addError('Cannot delete account with related opportunities.');
           }
         else if(b.id__c==null)
        {
            b.addError('Id cannot be blank!');
        }
                  
}
}