public class controllercls1 {
    //Get method - VF page gets data from apex class
    //Set method - VF page sets data into Apex class
    public Account acc{get; set;}
    public Contact con{get; set;}
    
    public controllercls1(){
        acc=new Account();
        con = new Contact();
    }
    
    public pagereference saverecord(){
       insert acc;
       insert con;
        
        pagereference ref = new pagereference('/apex/login');
        return ref;
    }
    
    public pagereference saveNewrecord(){
        insert acc;
       insert con;
        
        pagereference ref = new pagereference('/apex/controller');
        ref.setredirect(true);
        return ref;
    }
    
    public pagereference cancel(){
        pagereference ref = new pagereference('/001/o');
        return ref;
    
    }
}