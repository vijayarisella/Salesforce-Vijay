public with sharing class AccountTriggerhandler{
    public AccountTriggerhandler(){

    }
    public static void validateAccountBeforeInsert(list<account> AccList)
    {
        for(Account Acc:AccList)
                {
                   if(Acc.Rating=='hot' && Acc.Type == null)
                    {
                        Acc.Type.adderror('Account type is mandatory when the rating is Hor');
                    }
                }
    }
    public static void insertContact(list<account> AccList1)
    {
        List<contact> conList=new list<contact>();
    {
        for(Account Acc:AccList1)
        {
            contact con=new contact();
            con.accountid=acc.id;
            con.LastName=acc.name;
            conList.add(con);
        }
        if(conList.size()>0 && conList!=null)
        {
            insert conList;
        }
    }
    }
    public static void createopportunity(Map<id,account> accNewMap, map<id,account> accoldmap)
    {
        list<opportunity> newopp= new list<opportunity>();
      for(Account Acc:accNewMap.values()) 
      {
          system.debug('inside for');
          if(accNewMap.get(Acc.id).rating!=accoldmap.get(Acc.id).rating && accNewMap.get(Acc.id).rating=='Hot')
          {
              system.debug('inside if');
              opportunity opp=new opportunity();
              opp.name=accNewMap.get(Acc.id).name;
              opp.accountid=accNewMap.get(Acc.id).id;
              opp.StageName='need analysis';
              opp.closedate=system.today();
             newopp.add(opp);
             
          }
      }
        
        if(!newopp.isempty()){
              system.debug('inside insert if block');
            try{
                insert newopp;
            }
             catch(DmlException e) {
    System.debug('The following exception has occurred: ' + e.getMessage());
}
           
       }
    }
    public static void PreventDeletion(List<account> Acclist)
    {
		set<id> accountIdSet = new set<id>();
        map<id,boolean> accIDtestMap=new map<id,boolean>();
        for(Account acc:Acclist)
        {
            accountIdSet.add(acc.id);
        }
        if(accountIdSet != null && accountIdSet.size()>0 )
        {
             for(contact c: [select id from contact where accountid in: accountIdSet and IsPrimary__c =true])
             {
                 accIDtestMap.put(c.accountid,c.isprimary__C);
             }
        }
        
        for(Account accobj:Acclist){
            if(accIDtestMap.get(accobj.id)!=null && accIDtestMap.get(accobj.id)==true){
                accobj.adderror('tou cannot delete account');
            }
        																					
                }
       
    }
}