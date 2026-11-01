public with sharing class WrapperEx2 {
    
    public WrapperEx2(){
        lstObj = new List<String>();
        lstwrap = new List<objWrapper>();
        List<Schema.Sobjecttype> objects = Schema.getGlobalDescribe().values();
        for(Schema.Sobjecttype s: objects){
            if(!string.valueof(s).contains('__c'))
            lstObj.add(string.valueof(s));
            if(string.valueof(s).contains('__c'))
            lstwrap.add(new objWrapper(string.valueof(s),'Custom Object'));
            else
            lstwrap.add(new objWrapper(string.valueof(s),'Standard Object'));
        }
        
        
    
    }
    
    public List<String> lstObj{get; set;}
    public List<objWrapper> lstwrap{get; set;}
    public class objWrapper{
        
        public string objName{get; set;}
        public string objType{get; set;}
        public string color{get; set;}
        
        public objWrapper(string a, string b){
            objName = a;
            objtype = b;
            if(objtype=='Custom Object')
            color='green';
            else
            color='';
        }
    
    }
    
    
}