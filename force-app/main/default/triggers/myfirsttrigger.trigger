trigger myfirsttrigger on Account (before delete) {
List<Account> ls=new List<Account>();
if(Trigger.Isbefore)
{
Id i=userInfo.getProfileId();
//Profile admin=[select Id from Profile  where name='System Administrator'];
Id admin=[select Id from Profile  where name='System Administrator'].Id;

if(i==admin)
{
Account a;
a.addError('trueeeeeeeeeeeeeeeeeee');

}
else
{
Account a;
a.addError('errrrrrrrrrrrrrrrrrrrrroe');
}
  } 
}