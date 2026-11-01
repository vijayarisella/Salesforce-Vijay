public class Examples {

    public Integer age { get; set; }
    private Account account; 
    public Account getAccount(){
    if(account == null)
    account=new Account();
    return account;
    
    
    }
    public pagereference doSave(){
    insert account;
    account=null;
    return null;
    }
        
}