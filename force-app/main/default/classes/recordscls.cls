public class recordscls {

    public PageReference previous() {
        return null;
    }

    public string recId{get; set;}
    public string alpha{get; set;}
    public string searchText{get; set;}
    public List<Account> lst{get; set;}   //to display list of records in the page.
      public List<contact> Conlst{get; set;}
        public List<opportunity> Opplst{get; set;}
    public recordscls(){
        
        lst = [Select id, name, phone,billingcountry,fax from account where billingcountry != null order by name];
    }
public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                      [select name,closedate from Opportunity]));
            }
            return setCon;
        }
        set;
    }

    // Initialize setCon and return a list of records
   
    public List<Opportunity> getOpportunities() {
         setCon.setpagesize(5);
         return (List<Opportunity>) setCon.getRecords();
    }


    public void doviewAll() {
        searchText='';
        lst = [Select id, name, phone,billingcountry,fax from account where billingcountry != null order by name];        
    }    
    
    //constructor will be fired when the page is loaded
    
    
    public void doSearch(){
        lst = [Select id, name, phone, billingcountry, fax from Account where  name like: '%'+searchText+'%' order by name];    
    }
    public void ContactSearch(){
        Conlst = [Select id, Email, Fax, Name from contact where Name like: '%'+searchText+'%' order by Name];    
    }
    public void OpportunitySearch(){
        Opplst = [Select id, name, Amount from opportunity where name like: '%'+searchText+'%' order by name];    
    }
    public pagereference deleteRecord(){
        Account acc = new Account(id=recId);
        delete acc;
        
        pagereference ref = new pagereference('/apex/records');
        ref.setredirect(true);
        return ref;
    }
   
    public void doSearchByAlpha(){
        lst = [Select id, name, phone, billingcountry, fax from Account where billingcountry != null and name like:alpha+'%' order by name];            
    }
}