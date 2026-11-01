public class SearchAndSortWithFilterCls
{
        public String searchText1 { get; set; }
        public Date dat {get;set;}
        public Date dat1 {get;set;}
        public String Accounts { get; set; }
        public boolean SortCheckbox{ get; set; }
        public boolean SortCheckboxDate{ get; set; } 
   
public void next() {
    
     lst = [Select id, name, phone,  fax from Account where name like: '%'+searchText+'%' ];

           }

    public void last() {
            }

    public PageReference first() {
        return null;
    }

    public PageReference previous() {
        return null;
    }

    public List<Account> lst{get; set;}   //to display list of records in the page.
    public List<Contact> Conlst{get; set;}
    public List<Opportunity> Opplst{get; set;}
    public List<Lead> Leadlst{get; set;}
    public List<Product2> Prolst{get; set;}
    public SearchAndSortWithFilterCls()
        {
        }
    public string searchText{get; set;}
     
    public void doSearch()
        {
            if(CheckboxSelect()==true && CheckboxSelectDate()==true)
            {
                if(dat1 == null || dat == null)
                {
               
               return ;
                }
                else
                {
                lst = [Select id, name, phone,  fax from Account where name like: '%'+searchText+'%' and Date1__c <=: dat1 and Date1__c >=:dat];
                }                         
            }   
            else if(CheckboxSelect()==true && CheckboxSelectDate()==false)
            {
                lst = [Select id, name, phone,  fax from Account where name like: '%'+searchText+'%'];
            }  
            else if(CheckboxSelect()==false && CheckboxSelectDate()==true)
            {
                 if(dat1 == null || dat == null)
                    {
                   
                   return ;
                    }
                    else
                    {
                    lst = [Select id, name, phone,  fax from Account where Date1__c <=: dat1 and Date1__c >=:dat];
                    
                   }
            }    
            else
            {
                lst = [Select id, name, phone,  fax from Account];
            }      
        }
    public boolean CheckboxSelect()
    {
    boolean chkbox=false;
       if(SortCheckbox==true)
       {
        return SortCheckbox;
       }
         else
         {
         return chkbox;
         }
    }
    
     public boolean CheckboxSelectDate()
    {
    boolean chkboxdate=false;
       if(SortCheckboxDate==true)
       {
        return SortCheckboxDate;
       }
         else
         {
         return chkboxdate;
         }
    }
    
          
          
}



/*
public class GlobalCls
{

    public String searchText1 { get; set; }
     public Date dat {get;set;}
          public Date dat1 {get;set;}
    public String Accounts { get; set; }
public void next() {
    
     lst = [Select id, name, phone,  fax from Account where name like: '%'+searchText+'%' ];

           }


    public void last() {
            }


    public PageReference first() {
        return null;
    }


    public PageReference previous() {
        return null;
    }


    public List<Account> lst{get; set;}   //to display list of records in the page.
    
    public List<Contact> Conlst{get; set;}
    public List<Opportunity> Opplst{get; set;}
    public List<Lead> Leadlst{get; set;}
    public List<Product2> Prolst{get; set;}


    public GlobalCls()
        {
        }
    public string searchText{get; set;}
  
    
    public void doSearch()
        {
            
            lst = [Select id, name, phone,  fax from Account where name like: '%'+searchText+'%' and Date1__c <=: dat1 and Date1__c >=:dat  order by name ASC ];
           
            Conlst = [Select id, name, phone from contact where name like: '%'+searchText+'%' limit 5];
            
             Opplst = [Select id, name, NumberOfDays__c from Opportunity where name like: '%'+searchText+'%' limit 5 ];
             Leadlst = [Select id, name, AnnualRevenue from Lead where name like: '%'+searchText+'%' limit 5 ];
             Prolst = [Select id, name, ProductCode from Product2 where name like: '%'+searchText+'%' limit 5];
    
        }
          
          
}
*/