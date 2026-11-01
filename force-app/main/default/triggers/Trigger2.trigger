trigger Trigger2 on Account (before insert, before update) {

if(Trigger.isBefore)
{
for(Account obj:Trigger.new)
{
obj.BillingCity='karimnagar';
}
}
}