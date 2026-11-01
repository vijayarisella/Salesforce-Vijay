@RestResource(urlMapping='/showAccountDetails/*')
global class CheckAccounts {
@HttpGet
    global static List<Account> getAccount()
    {
        List<Account> lst;
        try{
            lst=[select name,phone from account limit 10];
            return lst;
        }
        catch(exception e)
        { 
         system.debug('Error'+e.getMessage());
        }
        return lst;
    }
}