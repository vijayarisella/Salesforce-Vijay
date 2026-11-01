global class AccountService {
      webservice static string createCustomer(String name, String Phone) {
      Account objA=new Account();
      objA.name=name;
      objA.Phone=Phone;
      insert objA;
      if(objA.id!=null)
      {return 'success';}
      else
      {return 'failure';}
      
      }
}