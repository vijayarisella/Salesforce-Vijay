public with sharing class WrapperEx3 {
    
    public class conWrapper{
        
        public boolean ischeck{get; set;}
        public Contact con{get; set;}
        
        public conWrapper(boolean b, Contact c){
            ischeck = b;
            con = c;
        }
    
    }
    
    public List<conWrapper> lstwrap{get; set;}
    
    public WrapperEx3(){
        lstwrap = new List<conWrapper>();
        
        List<Contact> lst = [Select id, name,email,phone from Contact order by name];
        
        for(Contact con: lst){
            lstwrap.add(new conwrapper(false,con));
        }
        
    }
    
    public boolean selectAll{get; set;}
    
    public void selectAllRecords(){
        if(selectAll == true){
            for(conwrapper cw : lstwrap){
                cw.ischeck =true;
            }
        }
        else{
            for(conwrapper cw : lstwrap){
                cw.ischeck =false;
            }
        }
    
    }
    
    
    public pagereference deleteRecords(){
    
        List<Contact> lstToDel = new List<Contact>();
        for(conwrapper cw : lstwrap){
            if(cw.ischeck == true)
                lstTodel.add(cw.con); 
        }
        
        if(lstTodel.size()>0)
        delete lstToDel;
        else{
            apexPages.message msg = new ApexPages.Message(ApexPages.Severity.Fatal,'Please select a record to delete');
            ApexPages.addmessage(msg);
            return null;
        }
        
        pagereference ref = new pagereference('/apex/wrapperpage3');
        ref.setredirect(true);
        return ref;
    
    }
}