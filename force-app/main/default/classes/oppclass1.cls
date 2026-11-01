public class oppclass1 {

    public oppclass1(ApexPages.StandardController controller) {
     intr=0;
        lst = [Select name,stagename,amount, probability,ownerid,AccountId from Opportunity where AccountId=:accid order by amount desc ];
        //lst = [Select name,stagename,amount, probability,ownerid from Opportunity order by amount desc ];
        
    lstAgg=[Select COUNT(name)cnt,stagename from Opportunity where stagename !='Canceled' AND AccountId=:accid   group by stagename];

    }

 public String inr { get; set; }
  public Integer intr{get;set;}
    public List<Opportunity> lst{get; set;} 
     public list<AggregateResult> lstAgg = new list<AggregateResult>();
  //Account acc=new Account();
  String accid=ApexPages.currentPage().getParameters().get('id');
     
   /* public oppclass1() {
    intr=0;
        lst = [Select name,stagename,amount, probability,ownerid,AccountId from Opportunity where AccountId=:accid order by amount desc ];
        //lst = [Select name,stagename,amount, probability,ownerid from Opportunity order by amount desc ];
        
    lstAgg=[Select COUNT(name)cnt,stagename from Opportunity where stagename !='Canceled' group by stagename];
   }*/
       
  public list<OppAgg> getResults()
   {
       list<OppAgg> lstResult = new list<OppAgg>();
       for (AggregateResult ar: lstAgg)
         {
           OppAgg objOppAgg = new OppAgg(ar);
           lstResult.add(objOppAgg);
       }
       return lstResult;
   }
class OppAgg{
public String StageName {get;set;}
 public Integer intr {get;set;}

 public OppAgg(AggregateResult ar)
  {
      StageName = (String)ar.get('StageName');
      intr=(integer)ar.get('cnt');   
   
}
}

}