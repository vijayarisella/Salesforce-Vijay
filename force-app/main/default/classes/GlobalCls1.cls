public class GlobalCls1
{

    public String searchText1 { get; set; }

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
    
    
     public List<String> Lst1{get; set;}

    public GlobalCls1()
        {
        }
    public string searchText{get; set;}
   
    public void doSearch()
        {
            Lst1.add(searchText);  
            Lst1=Lst1;                   
              
        }
          
          
}