trigger BulkUpdateTrigger on Contact (before insert,before update) 
{
      
     for(contact con :trigger.new){
     
         List<contact> ContLst=new List<contact>([select id,email from Contact where email=: con.Email]);
         if(ContLst.size()>0)
         {
         con.addError(con.Email+' : contact with this email already exist');
         }
         
        
        }     
}