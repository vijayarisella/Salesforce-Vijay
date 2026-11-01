public class opportunityListCon {

    public String Account { get; set; }
  // ApexPages.StandardSetController must be instantiated   
  // for standard list controllers       
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
  //  public String Account { get; set; }
  // ApexPages.StandardSetController must be instantiated   
  // for standard list controllers       
    public ApexPages.StandardSetController setCon1 {
        get {
            if(setCon1 == null) {
                setCon1 = new ApexPages.StandardSetController(Database.getQueryLocator(
                      [select name,id from contact]));
            }
            return setCon1;
        }
        set;
    }

    // Initialize setCon and return a list of records
   
    public List<contact> getcontact() {
         setCon1.setpagesize(5);
         return (List<contact>) setCon1.getRecords();
    }

   
}