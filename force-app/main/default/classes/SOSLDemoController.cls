public with sharing class SOSLDemoController {
  public list<account> Acc_List{get; set;}
  public list<Opportunity> Opp_List{get; set;}
  public void SOSLDemo_Method()
  {
    Acc_List=new List<Account>();
    List<List<sobject>> Objects_List = [FIND 'test' IN ALL Fields RETURNING Account(name,id, type), contact(id,name), opportunity(id,name)];
    Acc_List = ((List<Account>)Objects_List[0]);
    opp_List = ((List<Opportunity>)Objects_List[2]);
  }
}