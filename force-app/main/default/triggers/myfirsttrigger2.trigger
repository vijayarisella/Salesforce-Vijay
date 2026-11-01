trigger myfirsttrigger2 on Account (before delete) {
Id userid=userInfo.getProfileId();
String profilename=[select id,name from profile where id=:userid].name; 
for(Account acc:Trigger.old)
{
    if( profilename=='System Administrator'){
acc.addError('you cant delete the record');
  }
} 
}