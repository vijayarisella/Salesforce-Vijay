//This class send the request to end point URL and parse the JSON Data

public class HTTPContactsController {
public HTTPContactsController (){
    //HTtpsrequest Class
    HttpRequest requestParam=new HttpRequest();
    requestParam.setEndpoint(label.contactsEndPointURL);
    requestParam.setMethod('GET');
    
    //HTTP response
    Http httpParam = new HTTP();
    HTTPResponse response =httpParam.send(requestParam);
    String strResponse = response.getBody();
    system.debug('service response is .....'+strResponse);
    lstWI=new List<wrapContacts>();
    //JSON parsing
    JSONParser parser1 = JSON.createParser(strResponse);
	List<string> contactIds =new List<string>();
    while (parser1.nextToken() != null) {
	            if ((parser1.getCurrentToken() == JSONToken.FIELD_NAME) && (parser1.getText() == 'id')) {
	                // Get the value.
	                parser1.nextToken();
	                // Compute the grand total price for all invoices.
	                contactIds.add(parser1.getText());
	            }
	        }
    for(Integer i=0;i<ContactIds.size();i++)
    {
        objWI=new wrapContacts();
        objWI.id=ContactIds[i];
        objWI.isChecked=false;
        lstWI.add(objWI);
    }
    
}
    public pagereference doSave()
    {
        List<contact> lstC=new List<contact>();
        for(wrapContacts objWI:lstWI)
         if(objWI.isChecked==true)
        {
            contact objc=new Contact();
            objC.LastName=objWI.id;
            lstC.add(objc);
        }
      //  if(lstC.size()>0){
        
            Insert lstC;   
       // }
        
        return null;
    }
    public wrapContacts objWI{get;set;}
    public List<wrapContacts> lstWI{get;set;}
      	public class wrapContacts
     	{
          public Boolean isChecked{get;set;}
      	  public String id {get;set;}  
      	  public string title{get;set;}
           
   		}
}