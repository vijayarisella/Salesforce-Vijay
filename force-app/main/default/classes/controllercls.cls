public class controllercls {



    public string accName{get; set;}
    public string accphone{get; set;}
    public string conName{get; set;}
    public string conPhone{get; set;}

     public String SelectValue { get; set; }
      public List<SelectOption> statusOptions { get;set; }
public void autoRun()

{

    Schema.DescribeFieldResult statusFieldDescription = Account.Active__c.getDescribe();

 statusOptions = new list<SelectOption>();
 for (Schema.Picklistentry picklistEntry : statusFieldDescription.getPicklistValues())

    {

        statusOptions.add(new SelectOption(pickListEntry.getValue(),pickListEntry.getLabel()));

    }

}
  public PageReference export() 
   {
        return page.piechart;
    }
public pagereference saverecord(){
        Account acc = new Account();
        acc.name=accname;
        acc.phone = accPhone;
       insert acc;
        return page.CustomReport;
        Contact con= new Contact();
        con.lastName = conName;
        con.phone = conphone;
        insert con;

        pagereference ref = new pagereference('/'+acc.id);
        return ref;
    }

public pagereference cancel(){
        pagereference ref = new pagereference('/001/o');
        return ref;

    }
     public pagereference saveNewrecord(){
        Account acc = new Account();
        acc.name=accname;
        acc.phone = accPhone;
        insert acc;

        Contact con= new Contact();
        con.lastName = conName;
        con.phone = conphone;
        insert con;

        pagereference ref = new pagereference('/apex/controller');
        ref.setredirect(true);
        return ref;
    }
}